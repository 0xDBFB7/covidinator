import fdtd

from cairosvg import svg2png
import lxml.etree as etree
from PIL import Image
import io
import math
from pyevtk.hl import gridToVTK
from math import pi, ceil, cos, sin, log
from scipy.constants import mu_0,epsilon_0
import numpy as np
import torch

from importlib import reload

import gc


# import subprocess
import sys
# import signal


import copy

import ngspyce
from ngspyce.sharedspice import *


from fdtd.backend import NumpyBackend
from fdtd.backend import backend as bd


from numpy import array


import sexpdata #hehe
# from pykicad.pcb import *
# from pykicad.module import * unfortunately, got an error immediately with this. probably for a different version of kicad.



X = 0
Y = 1
Z = 2

#
# def _set_pdeathsig(sig=signal.SIGTERM):
#     """help function to ensure once parent process exits, its childrent processes will automatically die
#     """
#     def callable():
#         libc = ctypes.CDLL("libc.so.6")
#         return libc.prctl(1, sig)
#     return callable

class Port:
    def __init__(self, pcb, SPICE_net, F_x, F_y):

        self.SPICE_net = SPICE_net

        self.N_x = pcb.xy_margin+int((F_x)/pcb.cell_size)
        self.N_y = pcb.xy_margin+int((F_y)/pcb.cell_size)


        self.voltage = 0.0
        self.current = 0.0
        self.voltage_history = []
        self.current_history = []

class PCB:
    def __init__(self, cell_size, z_height=2e-3, xy_margin=15, z_margin=11, pml_cells=10):

        self.time = 0
        self.grid = None
        self.cell_size = cell_size

        self.z_height = z_height
        self.xy_margin = xy_margin
        self.z_margin = z_margin

        self.pml_cells = pml_cells

        self.ground_plane_z_top = None
        self.component_plane_z = None

        # self.reference_port = None
        self.component_ports = []
        self.substrate_permittivity = None

        self.copper_mask = None

        self.times = []
        self.time_step_history = []

    def initialize_grid(self, N_x, N_y, N_z, courant_number=None):
        grid = fdtd.Grid(
            (N_x,N_y,N_z),
            grid_spacing=self.cell_size,
            permittivity=1.0,
            permeability=1.0,
            courant_number = courant_number)

        fdtd.PML(1e-8, # stability factor
            None)

        pml_cells = self.pml_cells

        grid[0:pml_cells, :, :] = fdtd.PML(name="pml_xlow")
        grid[-pml_cells:, :, :] = fdtd.PML(name="pml_xhigh")
        grid[:, 0:pml_cells, :] = fdtd.PML(name="pml_ylow")
        grid[:, -pml_cells:, :] = fdtd.PML(name="pml_yhigh")
        grid[:, : ,0:pml_cells] = fdtd.PML(name="pml_zlow")
        grid[:, : ,-pml_cells:] = fdtd.PML(name="pml_zhigh")

        self.grid = grid


        if(not isinstance(fdtd.backend, NumpyBackend)):
            self.copper_mask = bd.zeros((N_x,N_y,N_z)).bool()
        else:
            self.copper_mask = np.zeros((N_x,N_y,N_z), dtype=bool)


    def create_planes(self, ground_plane_thickness, conductor_conductivity):
        '''
        Using thick copper planes only seems to affect the impedance by about 3%.
        This should be okay, but might affect interdigital filters etc.
        '''

        N_ground_plane = ceil(ground_plane_thickness / self.cell_size)

        #using a copper mask is much faster than an fdtd.object
        self.copper_mask[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.z_margin:(self.z_margin+N_ground_plane)] = 1

        self.ground_plane_z_top = self.z_margin+N_ground_plane


    def create_substrate(self, substrate_thickness, substrate_permittivity, loss_tangent, loss_tangent_frequency):

        N_substrate = ceil(substrate_thickness / self.cell_size)

        substrate_conductivity = loss_tangent * (2.0*pi) * 2.4e9 * epsilon_0 * substrate_permittivity
        #loss tangent not accounted for
        # substrate_conductivity = 0
        self.grid[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.ground_plane_z_top:(self.ground_plane_z_top+N_substrate)] \
                            = fdtd.Object(permittivity=substrate_permittivity, name="substrate")


        self.component_plane_z = self.ground_plane_z_top + N_substrate

        self.substrate_permittivity = substrate_permittivity

    def initialize_grid_with_svg(self, svg_file, courant_number = None):
        '''

        xy_margin is the number of cells (including PML cells) to add around the board.
        z_margin is the same, but below the board.

        '''

        svg = etree.parse(svg_file).getroot()
        width = float(svg.attrib['width'].strip('cm')) / 100.0 #to meters
        height = float(svg.attrib['height'].strip('cm')) / 100.0 #to meters
        print("Imported {} | width: {}m | height: {}m".format(svg_file, width, height))

        N_x = math.ceil(width/self.cell_size) + 2*(self.xy_margin)
        N_y = math.ceil(height/self.cell_size) + 2*(self.xy_margin)
        N_z = math.ceil(self.z_height/self.cell_size) + self.pml_cells+self.z_margin

        self.board_N_x = math.ceil(width/self.cell_size)
        self.board_N_y = math.ceil(height/self.cell_size)

        print("Into a {} x {} x {} mesh".format(N_x, N_y, N_z))

        self.initialize_grid(N_x, N_y, N_z, courant_number=courant_number)

    def construct_copper_geometry_from_svg(self, copper_thickness, conductor_conductivity, svg_file):
        PNG_SUPERSAMPLE_FACTOR = 10

        N_top_copper = ceil(copper_thickness / self.cell_size)

        z_slice = slice(self.component_plane_z,(self.component_plane_z+N_top_copper))
        image_data = io.BytesIO(svg2png(url=svg_file, output_width=self.board_N_x*PNG_SUPERSAMPLE_FACTOR,
                                                      output_height=self.board_N_y*PNG_SUPERSAMPLE_FACTOR))
        image = Image.open(image_data)
        pix = image.load()
        for x in range(0, self.board_N_x):
            for y in range(0, self.board_N_y):
                if(pix[x*PNG_SUPERSAMPLE_FACTOR,y*PNG_SUPERSAMPLE_FACTOR][3]): #alpha channel
                    self.copper_mask[self.xy_margin+x:self.xy_margin+x+1, self.xy_margin+(y):self.xy_margin+(y)+1, z_slice] = 1
                    # self.grid[self.xy_margin+x:self.xy_margin+x+1, self.xy_margin+(y):self.xy_margin+(y)+1, z_slice] \
                    #                     = fdtd.PECObject(name=None)



    def compute_all_voltages(self):
        for port in self.component_ports:
            # port.voltage = self.e_field_integrate(port, self.reference_port)
            #since all conductors have zero electric field, this is a reasonable approximation -
            #
            port.voltage = float(sum(self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z,Z])*self.cell_size)
            # port.voltage_history.append(port.voltage)

#permittivity might have to be cubed
#is there a bug in fdtd/grid/permittivity? Seems like it's not updated unless it's an array

    def create_source_vias(self):
        for port in self.component_ports:
            if(port.SPICE_net == 0):
                pass
                self.copper_mask[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-3] = 1 #make a conductor
                self.copper_mask[port.N_x,port.N_y,self.component_plane_z-2:self.component_plane_z] = 1 #make a conductor

                # self.copper_mask[port.N_x:port.N_x+1,port.N_y:port.N_y+1,self.ground_plane_z_top:self.component_plane_z] = 1 # for good measure



    def apply_all_currents(self):
        for port in self.component_ports:
            # port.voltage = e_field_integrate(G, port, self.reference_port)
            # math.sin(self.grid.time_steps_passed/50.0)* (100.0/self.cell_size)
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-1,Z] += (port.current*self.cell_size / C) * self.grid.time_step
            #(self.component_plane_z-self.ground_plane_z_top)

            self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-3,Z] = 0 #make a conductor
            self.grid.E[port.N_x,port.N_y,self.component_plane_z-2:self.component_plane_z,Z] = 0 #make a conductor

            C = epsilon_0*(self.cell_size**2.0)*(self.substrate_permittivity)/(1.0*self.cell_size)
            # print(C)

            C *= 10.0

            dvdt = (port.current / C)

            port.voltage += (dvdt * self.grid.time_step)

            self.grid.E[port.N_x,port.N_y,self.component_plane_z-3:self.component_plane_z-2,Z] = port.voltage / (self.cell_size)

            #make a ring of current around the conductor
            # contour_length = (4.0*self.cell_size)


            # print(port.current)
            #ostensibly there should be a factor of mu_0 here.
            # self.grid.H[port.N_x+1:port.N_x+2,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2,Y] = 1.0 * (port.current / contour_length)
            # self.grid.H[port.N_x-1:port.N_x,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2,Y] = -1.0 * (port.current / contour_length)
            # self.grid.H[port.N_x:port.N_x+1,port.N_y+1:port.N_y+2,self.component_plane_z-3:self.component_plane_z-2,X] = 1.0 * (port.current / contour_length)
            # self.grid.H[port.N_x:port.N_x+1,port.N_y-1:port.N_y,self.component_plane_z-3:self.component_plane_z-2,X] = -1.0 * (port.current / contour_length)
            # self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z,Z] = 0
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-1:self.component_plane_z,Z] = port.voltage / (self.cell_size)


    def zero_conductor_fields(self):
        self.grid.E[self.copper_mask] = 0



    def E_magnitude(self, E):
        return np.sqrt(E[:,:,:,X]**2.0 + E[:,:,:,Y]**2.0 + E[:,:,:,Z]**2.0)



    def dump_to_vtk(self, filename, iteration, Ex_dump=False, Ey_dump=False, Ez_dump=False, Emag_dump=True, objects_dump=True, ports_dump=True):
        '''
        Extension is automatically chosen, you don't need to supply it

        thanks
        https://pyscience.wordpress.com/2014/09/06/numpy-to-vtk-converting-your-numpy-arrays-to-vtk-arrays-and-files/
        https://bitbucket.org/pauloh/pyevtk/src/default/src/hl.py

        Paraview needs a threshold operation to view the objects correctly.

        '''


        x = np.linspace(0, self.cell_size*self.grid.Nx, self.grid.Nx+1) #there might be an off-by-one error here.
        y = np.linspace(0, self.cell_size*self.grid.Ny, self.grid.Ny+1)
        z = np.linspace(0, self.cell_size*self.grid.Nz, self.grid.Nz+1)

        cellData = {}

        if(not isinstance(fdtd.backend, NumpyBackend)):
            E_copy = self.grid.E.cpu()
            cu_mask = self.copper_mask.cpu().numpy()
        else:
            E_copy = self.grid.E
            cu_mask = self.copper_mask

        if(objects_dump):
            objects = np.zeros_like(E_copy[:,:,:,X])
            for obj in self.grid.objects:
                if(obj.name == "substrate"):
                    objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 1
                else:
                    objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 2
            objects += cu_mask*2
            cellData['objects'] = objects

        if(ports_dump):
            ports = np.zeros_like(E_copy[:,:,:,X])
            for port in [i for i in self.component_ports if i]:
                    ports[port.N_x,port.N_y,self.component_plane_z-1] = 4

                    # ports[port.N_x+1:port.N_x+2,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2] = 5
                    # ports[port.N_x-1:port.N_x,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2]  = 5
                    # ports[port.N_x:port.N_x+1,port.N_y+1:port.N_y+2,self.component_plane_z-3:self.component_plane_z-2] = 5
                    # ports[port.N_x:port.N_x+1,port.N_y-1:port.N_y,self.component_plane_z-3:self.component_plane_z-2]  = 5
            cellData['ports'] = ports


        if(Ex_dump):
            cellData['Ex'] = np.ascontiguousarray(E_copy[:,:,:,X])
        if(Ey_dump):
            cellData['Ey'] = np.ascontiguousarray(E_copy[:,:,:,Y])
        if(Ez_dump):
            cellData['Ez'] = np.ascontiguousarray(E_copy[:,:,:,Z])
        if(Emag_dump):
            cellData['Emag'] = np.ascontiguousarray(self.E_magnitude(E_copy)) # gridToVTK expects a contiguous array.


        gridToVTK(filename + str(iteration), x, y, z, cellData = cellData)

# Compiled ngspice 32 with
# make clean
#../configure --with-x --enable-xspice --disable-debug --enable-cider
#--with-readline=yes --with-ngshared --enable-openmp --prefix=/home/arthurdent/Programs/ngspice-32/install/
# then set export LIBNGSPICE=/home/arthurdent/Programs/ngspice-32/lib/lib/libngspice.so
# had to compile twice; once with prefix lib and --ngshared,
# and the other with prefix install and no ngshared

    def error(self, i):
        if i:
            print("Error", i)
            sys.exit("Spice error")

    def init_SPICE(self, source_file):
        ngspyce.source(source_file)



    def set_spice_voltages(self):
        for port in self.component_ports:
            try:
                self.set_spice_voltage(port.SPICE_net, port.voltage)
            except:
                print(f"No such source vs{port.SPICE_net}")

    def get_spice_currents(self):
        for port in self.component_ports:
            try:
                port.current = self.get_spice_current(port.SPICE_net)
            except:
                port.current = 0


    def get_spice_current(self, SPICE_net):
        try:
            return ngspyce.vector('i(vs' + SPICE_net.lower() + ")")[-1]
        except:
            print(f"No such source vs{port.SPICE_net}")
            return 0


    def set_spice_voltage(self, SPICE_net, voltage):
        ngspyce.cmd('alter vs' + SPICE_net.lower() + ' = ' + str(voltage))

    def reset_spice(self):
        # resets simulation without reloading file from disk
        ngspyce.cmd('reset')
        # self.error(ngspyce.cmd('altermod cstd cap = {}'.format(C)))

    def run_spice_step(self):
        # ngspyce.cmd('tran {} {} uic'.format(self.grid.time_step, self.grid.time_step))
        ngspyce.cmd('tran 1p 1p uic'.format(self.grid.time_step, self.grid.time_step))
        # WARNING ! THIS IS WRONG !
        # for any non-linear circuit, this will produce incorrect results.
        # with this combination of parts,
        # ngspice refuses to sim at tstep < 1p.

    def save_voltages(self):
        for port in self.component_ports:
            port.voltage_history.append(port.voltage)
            port.current_history.append(port.current)


    def initialize_kicad_and_spice(self, kicad_filename,SPICE_filename, SPICE_modified_filename, skip_source_creation_names):
        pads = self.parse_kicad_pcb(kicad_filename)
        spice_file_string = open(SPICE_filename, 'r').read()
        pads, spice_file_string = self.munge_SPICE_nets(pads, spice_file_string, skip_source_creation_names)
        self.insert_ports(pads)

        with open(SPICE_modified_filename, 'w') as file:
            file.write(spice_file_string)

        self.init_SPICE(SPICE_modified_filename)
        self.reset_spice()

    def parse_kicad_pcb(self, pcb_filename):
        '''
        given a .kicad_pcb filename, returns a list of module_reference, abs pad_x, abs pad_y, net
        '''

        pcb_string = open(pcb_filename, 'r').read()
        pcb_data = sexpdata.loads(pcb_string)
        setup = [i for i in pcb_data if isinstance(i, list) and i[0] == sexpdata.Symbol('setup')][0]
        aux_origin = [i for i in setup if isinstance(i, list) and i[0] == sexpdata.Symbol('aux_axis_origin')][0]
        aux_origin_x = float(aux_origin[1])*1e-3
        aux_origin_y = float(aux_origin[2])*1e-3

        pads = []

        modules = [i for i in pcb_data if isinstance(i, list) and i[0] == sexpdata.Symbol('module')]
        for module in modules:
            module_at = [i for i in module if isinstance(i, list) and i[0] == sexpdata.Symbol('at')][0]
            module_x = float(module_at[1])*1e-3
            module_y = float(module_at[2])*1e-3
            module_angle = None

            try: #some modules don't have an angle
                module_angle = (float(module_at[3])/360.0)*2.0*pi
            except:
                pass

            module_reference = [i for i in module if isinstance(i, list) and len(i) >= 2 and i[1] == sexpdata.Symbol('reference')][0][2].value()
            for pad_idx, pad in enumerate([i for i in module if isinstance(i, list) and i[0] == sexpdata.Symbol('pad')]):
                pad_at = [i for i in pad if isinstance(i, list) and i[0] == sexpdata.Symbol('at')][0]

                pad_relative_x = float(pad_at[1])*1e-3
                pad_relative_y = float(pad_at[2])*1e-3

                if(module_angle): #some modules don't have an angle
                    pad_rotated_vector_x = pad_relative_x*cos(module_angle) - pad_relative_y*sin(module_angle)
                    pad_rotated_vector_y = pad_relative_x*sin(module_angle) + pad_relative_y*cos(module_angle)
                    pad_x = module_x + pad_rotated_vector_x - aux_origin_x
                    pad_y = module_y + pad_rotated_vector_y - aux_origin_y
                else:
                    pad_x = module_x + pad_relative_x - aux_origin_x
                    pad_y = module_y + pad_relative_y - aux_origin_y

                net = [i for i in pad if isinstance(i, list) and i[0] == sexpdata.Symbol('net')][0][2]
                try:
                    net = net.value() #sometimes the net is a sexpdata.Symbol().
                except:
                    pass
                net = net.replace("(", "_")
                net = net.replace(")", "_")
                pads.append({"reference": module_reference, "x": pad_x, "y": pad_y, "net": net, "mod_pad_idx": pad_idx})
                # self.component_ports.append(Port(self, , ))


        return pads


    def munge_SPICE_nets(self, pads, spice_file_string, skip_source_creation_names):
        '''
        Renames SPICE nets and pad nets so each pad is only connected to its port, not other components,
        then inserts the voltage sources needed for SPICE<->FDTD coupling.

        Some pads could already have sources defined; we skip source creation for these.
        '''

        spice_file_array = spice_file_string.splitlines()

        for pad_idx,pad in enumerate(pads):
            new_net_name = "NET"+pad["reference"]+str(pad["mod_pad_idx"])
            if(not pad["reference"] in skip_source_creation_names):
                spice_file_array.insert(spice_file_array.index('//start vsources')+1,"Vs"+new_net_name + " " + new_net_name + " 0 0")

            for idx, line in enumerate(spice_file_array[0:spice_file_array.index('//start vsources')]):
                line_array = line.split()
                if(line_array and not "Vs" in line_array[0] and pad["reference"] in line_array[0]):
                    line_net_idx = line_array.index(pad["net"])
                    # new_net_name = pad["net"]+str(pad_idx)
                    line_array[line_net_idx] = new_net_name

                    spice_file_array[idx] = " ".join(line_array)

                    break

            pads[pad_idx]["net"] = new_net_name

        return pads, "\n".join(spice_file_array)

    def insert_ports(self, pads):
        for pad_idx,pad in enumerate(pads):
            self.component_ports.append(Port(self, pad["net"], pad['x'], pad['y']))

        # ngspyce.__init__("")
        # ngspyce.source('/tmp/wideband_LO_mod.cir')

    # def constrain_values(self):
    #     for port in self.component_ports:
    #         if(current > 0.5
            # port.voltage = np.clip(port.voltage, -40, 40)
            # port.current = np.clip(port.current, -1, 1)

    def step(self):

        self.forcings()

        self.to_taste()

        self.grid.update_E()

        self.zero_conductor_fields()
        self.compute_all_voltages()
        # self.constrain_values()

        self.grid.update_H()


        self.grid.time_steps_passed += 1
        self.time += self.grid.time_step # the adaptive
        self.times.append(self.time)


        # [abs(i.voltage i.voltage) for i in enumerate(pcb.component_ports)]


        # self = self.adaptive_timestep(failsafe_timestep)

    def forcings(self):
        for port in self.component_ports:
        # if(current > 0.5
        # port.voltage = np.clip(port.voltage, -40, 40)
            port.current = np.clip(port.current, -10, 10)

    def to_taste(self):
        #Using an adaptive timestep method as per [Ciampolini 1995]

        failsafe_port_voltages = []
        for idx,port in enumerate(self.component_ports):
            failsafe_port_voltages.append(port.voltage)
        # failsafe_ports = copy.deepcopy(self.component_ports)

        delta_v = 0

        # this coefficient is somewhat tricky.
        # higher, and the loop below will have to try more timesteps to find convergence.
        # lower, and changes in required timestep will take longer to propagate.
        self.set_time_step(self.grid.time_step*4.0)

        # a better convergence metric would be useful.
        while(True):


            # for port in self.component_ports:
            #     print(port.SPICE_net, port.voltage, port.current)
            #
            self.reset_spice()
            self.set_spice_voltages()
            self.run_spice_step()
            self.get_spice_currents()
            self.forcings()

            self.apply_all_currents()
            ngspyce.cmd("destroy all")
            #
            # for port in self.component_ports:
            #     print(port.SPICE_net, port.voltage, port.current)

            delta_vs = [abs(failsafe_port_voltages[idx]-val.voltage) for idx,val in enumerate(self.component_ports)]
            delta_v = max(delta_vs)
            fastest_net = self.component_ports[delta_vs.index(delta_v)].SPICE_net

            # print("Delta V:" , delta_v)
            convergence = delta_v < 0.01

            if(convergence):
                break
            else:
                self.set_time_step(self.grid.time_step*0.5)
                # print("Decreased timestep to " , self.grid.time_step)

                for idx,port in enumerate(self.component_ports):
                    port.voltage = failsafe_port_voltages[idx]
                    # port.current = failsafe_ports[idx].current

            # prev_convergence = copy.copy(new_convergence)


        self.save_voltages()

    def set_time_step(self, ts):
        self.grid.time_step = ts
        self.grid.courant_number = self.grid.time_step/(self.grid.grid_spacing / 3.0e8)

#
# def adaptive_timestep(pcb, failsafe_timestep):
#     # timestep of the simulation
#     convergence = True
#     for idx,port in enumerate(pcb.component_ports):
#         print(port.voltage-failsafe_timestep.component_ports[idx].voltage)
#         if(abs(port.voltage-failsafe_timestep.component_ports[idx].voltage) > 1):
#             convergence = False
#
#     # print(convergence)
#     # if(convergence):
#     #     pcb.set_time_step(pcb.grid.time_step*2.0)
#     #
#     #     del failsafe_timestep
#     #     gc.collect() #even works on pytorch tensors! amazing!
#     #     return pcb
#     # else:
#     failsafe_timestep.set_time_step(pcb.grid.time_step*0.01)
#     del pcb
#     gc.collect() #even works on pytorch tensors! amazing!
#
#     # print(id(failsafe_timestep.grid)) = None
#     return failsafe_timestep, convergence
