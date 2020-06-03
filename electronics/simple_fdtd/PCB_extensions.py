import fdtd

from cairosvg import svg2png
import lxml.etree as etree
from PIL import Image
import io
import math
from pyevtk.hl import gridToVTK
from math import pi, ceil
from scipy.constants import epsilon_0
import numpy as np
import torch

# import subprocess
import sys
# import signal

import ngspyce


from fdtd.backend import NumpyBackend
from fdtd.backend import backend as bd

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
    def __init__(self, cell_size, z_height=3e-3, xy_margin=15, z_margin=15, pml_cells=10):

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

        self.SPICE_instance = None


    def initialize_grid(self, N_x, N_y, N_z):
        grid = fdtd.Grid(
            (N_x,N_y,N_z),
            grid_spacing=self.cell_size,
            permittivity=1.0,
            permeability=1.0)
            # courant_number = 0.2        )

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

        self.copper_mask = bd.zeros((N_x,N_y,N_z)).bool()



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

    def initialize_grid_with_svg(self, svg_file):
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

        self.initialize_grid(N_x, N_y, N_z)

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


    # class LumpedComponent(object):
    # """
    #
    # See "The use of SPICE lumped circuits as sub-grid models for FDTD analysis", doi:10.1109/75.289516
    # which deals with lumped elements of a single-cell size, and

    # "Incorporating non-linear lumped elements in FDTD: the equivalent source method", Jason Mix
    # http://ecee.colorado.edu/microwave/docs/publications/1999/IJNM_JMjdMPM_99.pdf
    # which deals with objects of arbitrary size.
    #
    # You can use this 'equivalent source method' either by line-integrating the currents around a conductor
    # and setting the electric field, or by line-integrating the voltage and setting the magnetic field.
    #
    # I chose the latter because it seems to make more sense to set a voltage initial-condition in SPICE than a current.
    #
    # 1. Normal electric field update.
    # 2. Obtain terminal voltages by an electric field line integration from one port to another.
    # 3. Normal magnetic field update.
    # 4. Obtain the lumped currents from the voltages - either via SPICE or via analytic expressions for each component
    # 5. Set H along a contour enclosing the conductor to net_current / Lc
    # 6. ...
    # 7. Profit!
    #
    #
    # """

    def compute_all_voltages(self):
        for port in self.component_ports:
            # port.voltage = self.e_field_integrate(port, self.reference_port)
            #since all conductors have zero electric field, this is a reasonable approximation -
            #
            port.voltage = float(sum(self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z,Z])*self.cell_size)
            port.voltage_history.append(port.voltage)

#permittivity might have to be cubed
#is there a bug in fdtd/grid/permittivity? Seems like it's not updated unless it's an array

    def apply_all_currents(self):
        for port in self.component_ports:
            # port.voltage = e_field_integrate(G, port, self.reference_port)
            # math.sin(self.grid.time_steps_passed/50.0)* (100.0/self.cell_size)
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-1,Z] += (port.current*self.cell_size / C) * self.grid.time_step
            #(self.component_plane_z-self.ground_plane_z_top)
            self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-1,Z] = 0
            self.grid.E[port.N_x,port.N_y,self.component_plane_z-1:self.component_plane_z,Z] = port.voltage / (self.cell_size)


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

        Paraview needs a theshold operation to view the objects correctly.

        '''


        x = np.linspace(0, self.cell_size*self.grid.Nx, self.grid.Nx+1) #there might be an off-by-one error here.
        y = np.linspace(0, self.cell_size*self.grid.Ny, self.grid.Ny+1)
        z = np.linspace(0, self.cell_size*self.grid.Nz, self.grid.Nz+1)

        cellData = {}

        if(not isinstance(fdtd.backend, NumpyBackend)):
            E_copy = self.grid.E.cpu()
        else:
            E_copy = self.grid.E

        if(objects_dump):
            objects = np.zeros_like(E_copy[:,:,:,X])
            for obj in self.grid.objects:
                if(obj.name == "substrate"):
                    objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 1
                else:
                    objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 2
            objects += self.copper_mask.cpu().numpy()*2
            cellData['objects'] = objects

        if(ports_dump):
            ports = np.zeros_like(E_copy[:,:,:,X])
            for port in [i for i in self.component_ports if i]:
                    ports[port.N_x,port.N_y,self.component_plane_z-1] = 4
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
            print(i)
            sys.exit()

    def init_SPICE(self, SPICE_binary, source_file):
        ngspyce.source(source_file)



    def set_spice_voltages(self):
        for port in self.component_ports:
            self.set_spice_voltage(port.SPICE_net, port.voltage)

    def get_spice_voltages(self):
        for port in self.component_ports:
            port.voltage = self.get_spice_voltage(port.SPICE_net)


    def get_spice_voltage(self, SPICE_net):
        return float(ngspyce.cmd('print v(' + SPICE_net + ')[1000000]')[0].split()[2])

    def set_spice_voltage(self, SPICE_net, voltage):
        self.error(ngspyce.cmd('alter c' + SPICE_net + ' IC = ' + str(voltage)))

    def reset_spice(self):
        # resets simulation without reloading file from disk
        self.error(ngspyce.cmd('reset'))
        C = 6.0*(self.cell_size**2.0)*(self.substrate_permittivity)/self.cell_size
        self.error(ngspyce.cmd('alter cstd = {}'.format(C)))

    def run_spice_step(self):
        ngspyce.cmd('tran {} {} uic'.format(self.grid.time_step, self.grid.time_step))


#
