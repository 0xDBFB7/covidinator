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

from fdtd.backend import NumpyBackend

X = 0
Y = 1
Z = 2


class Port:
    def __init__(self, pcb, SPICE_net, F_x, F_y):

        self.SPICE_net = SPICE_net

        self.N_x = pcb.xy_margin+int((F_x)/pcb.cell_size)
        self.N_y = pcb.xy_margin+int((F_y)/pcb.cell_size)



        #add via
        pcb.grid[self.N_x:self.N_x+1, self.N_y:self.N_y+1, pcb.ground_plane_z_top:pcb.component_plane_z-1] \
                        = fdtd.PECObject(name=None)

        # copper_above = False
        # for obj in pcb.grid.objects:
        #     if(obj.x.start == self.N_x and obj.y.start == self.N_y):
        #         copper_above = True
        #
        # if(not copper_above):
        #     print("Warning: No copper above {}".format(SPICE_net))
        # if(F_conductor_height == None):
        #     F_conductor_height = (pcb.component_plane_z-pcb.ground_plane_z_top)*pcb.cell_size
        # # A contour around the conductor must be created.
        # self.N_contour_width_div2 = int(ceil((F_conductor_width/2)/pcb.cell_size))
        # self.N_contour_height_div2 = int(ceil((F_conductor_height/2)/pcb.cell_size))

        # self.axis = axis
        # self.current_direction = current_direction

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



    def create_planes(self, ground_plane_thickness, conductor_conductivity):
        '''
        Using thick copper planes only seems to affect the impedance by about 3%.
        This should be okay, but might affect interdigital filters etc.
        '''

        N_ground_plane = ceil(ground_plane_thickness / self.cell_size)
        # 
        # self.grid[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.z_margin:(self.z_margin+N_ground_plane)] \
        #                     = fdtd.PECObject(name="ground_plane")

        self.ground_plane_z_top = self.z_margin+N_ground_plane


    def create_substrate(self, substrate_thickness, substrate_permittivity, loss_tangent, loss_tangent_frequency):

        N_substrate = ceil(substrate_thickness / self.cell_size)

        substrate_conductivity = loss_tangent * (2.0*pi) * loss_tangent_frequency * epsilon_0 * substrate_permittivity;

        self.grid[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.ground_plane_z_top:(self.ground_plane_z_top+N_substrate)] \
                            = fdtd.AbsorbingObject(permittivity=substrate_permittivity, conductivity=substrate_conductivity, name="substrate")

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
        print(self.board_N_x*self.cell_size)
        print(self.board_N_y*self.cell_size)
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
                    self.grid[self.xy_margin+x:self.xy_margin+x+1, self.xy_margin+(y):self.xy_margin+(y)+1, z_slice] \
                                        = fdtd.PECObject(name=None)


    #
    # def e_field_integrate(self, positive_port, reference_port):
    #     '''
    #     Determine the potential difference between two ports.
    #
    #     Doesn't matter how you integrate.
    #
    #     '''
    #
    #
    #     # np.sum(G.E[positive_port.xcoord:reference_port., positive_port.ycoord, positive_port.zcoord][X
    #
    #     potential_difference = 0
    #     if(positive_port.xcoord > reference_port.xcoord):
    #         step = -1
    #     else:
    #         step = 1
    #     for x in range(positive_port.xcoord,reference_port.xcoord, step):
    #         potential_difference += [x, positive_port.ycoord, positive_port.zcoord] * G.dx * step
    #
    #     if(positive_port.ycoord > reference_port.ycoord):
    #         step = -1
    #     else:
    #         step = 1
    #     for y in range(positive_port.ycoord,reference_port.ycoord, step):
    #         potential_difference += G.Ey[positive_port.xcoord, y , positive_port.zcoord] * G.dy * step
    #
    #     if(positive_port.zcoord > reference_port.zcoord):
    #         step = -1
    #     else:
    #         step = 1
    #     for z in range(positive_port.zcoord,reference_port.zcoord, step):
    #         potential_difference += G.Ez[positive_port.xcoord, positive_port.ycoord, z] * G.dz * step
    #
    #     return potential_difference



    # def apply_current_equivalent_source(self, current, port):


        # ports = np.zeros_like(self.grid.E[:,:,:,X])
        # for port in [i for i in self.component_ports + [self.reference_port] if i]:
        #     ports[port.N_x-(port.N_contour_width_div2)-1:port.N_x+(port.N_contour_width_div2)+1,
        #             port.N_y:port.N_y+1,
        #             port.N_z-(port.N_contour_height_div2)-1:port.N_z+(port.N_contour_height_div2)+1] = 3
        #     ports[port.N_x-(port.N_contour_width_div2):port.N_x+(port.N_contour_width_div2),
        #             port.N_y-1:port.N_y+1,
        #             port.N_z-(port.N_contour_height_div2):port.N_z+(port.N_contour_height_div2)] = 0
        #     ports[port.N_x,port.N_y,port.N_z] = 4
        # cellData['ports'] = ports

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

    # def PEC(self):
    #     for obj in self.grid.objects:
    #         if(not obj.name == "substrate"):
    #             self.grid.E[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop,:] = 0

    def compute_all_voltages(self):
        for port in self.component_ports:
            # port.voltage = e_field_integrate(G, port, self.reference_port)
            port.voltage = self.grid.E[port.N_x,port.N_y,self.component_plane_z-1,Z]*self.cell_size
            self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-1] = 0
            # port.voltage_history.append(port.voltage)

#permittivity might have to be cubed
#is there a bug in fdtd/grid/permittivity? Seems like it's not updated unless it's an array

    def apply_all_currents(self):
        for port in self.component_ports:
            # port.voltage = e_field_integrate(G, port, self.reference_port)
            C = 6.0*(self.cell_size**2.0)*(self.substrate_permittivity)
            # math.sin(self.grid.time_steps_passed/50.0)* (100.0/self.cell_size)
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-1,Z] += (port.current*self.cell_size / C) * self.grid.time_step
            if(port.SPICE_net == 0):
                self.grid.E[port.N_x,port.N_y,self.component_plane_z-1,Z] -= 100.0/self.cell_size

                 # = 100/(self.cell_size * epsilon_0)
            # Iz = G.dx * (Hx[x, y - 1, z] - Hx[x, y, z]) + G.dy * (Hy[x, y, z] - Hy[x - 1, y, z])

            # port.voltage_history.append(port.voltage)


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
            cellData['objects'] = objects

        if(ports_dump):
            ports = np.zeros_like(E_copy[:,:,:,X])
            for port in [i for i in self.component_ports if i]:
                    ports[port.N_x,port.N_y,self.component_plane_z-1] = 4
            cellData['ports'] = ports
            # ports[port.N_x,port.N_y,port.N_z] = 4
        #     ports = np.zeros_like(self.grid.E[:,:,:,X])
        #     for port in [i for i in self.component_ports + [self.reference_port] if i]:
        #         ports[port.N_x-(port.N_contour_width_div2)-1:port.N_x+(port.N_contour_width_div2)+1,
        #                 port.N_y:port.N_y+1,
        #                 port.N_z-(port.N_contour_height_div2)-1:port.N_z+(port.N_contour_height_div2)+1] = 3
        #         ports[port.N_x-(port.N_contour_width_div2):port.N_x+(port.N_contour_width_div2),
        #                 port.N_y-1:port.N_y+1,
        #                 port.N_z-(port.N_contour_height_div2):port.N_z+(port.N_contour_height_div2)] = 0
        #         ports[port.N_x,port.N_y,port.N_z] = 4
        #     cellData['ports'] = ports


        if(Ex_dump):
            cellData['Ex'] = np.ascontiguousarray(E_copy[:,:,:,X])
        if(Ey_dump):
            cellData['Ey'] = np.ascontiguousarray(E_copy[:,:,:,Y])
        if(Ez_dump):
            cellData['Ez'] = np.ascontiguousarray(E_copy[:,:,:,Z])
        if(Emag_dump):
            cellData['Emag'] = np.ascontiguousarray(self.E_magnitude(E_copy)) # gridToVTK expects a contiguous array.


        gridToVTK(filename + str(iteration), x, y, z, cellData = cellData)



    # def (self, filename, iteration):


#self.time_step
