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
X = 0
Y = 1
Z = 2

class PCB:
    def __init__(self, cell_size, z_height=10e-3, xy_margin=15, z_margin=15, pml_cells=10):

        self.grid = None
        self.cell_size = cell_size

        self.z_height = z_height
        self.xy_margin = xy_margin
        self.z_margin = z_margin

        self.pml_cells = pml_cells

        self.ground_plane_z_top = None
        self.component_plane_z = None


    def initialize_grid(self, N_x, N_y, N_z):
        grid = fdtd.Grid(
            (N_x,N_y,N_z),
            grid_spacing=self.cell_size,
            permittivity=1.0,
            permeability=1.0
        )

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

        self.grid[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.z_margin:(self.z_margin+N_ground_plane)] \
                            = fdtd.AbsorbingObject(permittivity=1.0, conductivity=conductor_conductivity, name="ground_plane")

        self.ground_plane_z_top = self.z_margin+N_ground_plane


    def create_substrate(self, substrate_thickness, substrate_permittivity, loss_tangent, loss_tangent_frequency):

        N_substrate = ceil(substrate_thickness / self.cell_size)

        substrate_conductivity = loss_tangent * (2.0*pi) * loss_tangent_frequency * epsilon_0 * substrate_permittivity;

        self.grid[self.xy_margin:-self.xy_margin, self.xy_margin:-self.xy_margin, self.ground_plane_z_top:(self.ground_plane_z_top+N_substrate)] \
                            = fdtd.AbsorbingObject(permittivity=substrate_permittivity, conductivity=substrate_conductivity, name="substrate")

        self.component_plane_z = self.ground_plane_z_top + N_substrate



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

    def construct_copper_geometry_from_svg(self, svg_file):

        image_data = io.BytesIO(svg2png(url=svg_file, output_width=self.board_N_x, output_height=self.board_N_y))
        image = Image.open(image_data)
        pix = image.load()



    def e_field_integrate(grid, positive_port, reference_port):
        '''
        Determine the potential difference between two ports.

        Doesn't matter how you integrate.

        '''

        # np.sum(G.E[x, positive_port.ycoord, positive_port.zcoord][X

        # potential_difference = 0
        # if(positive_port.xcoord > reference_port.xcoord):
        #     step = -1
        # else:
        #     step = 1
        # for x in range(positive_port.xcoord,reference_port.xcoord, step):
        #     potential_difference += G.Ex[x, positive_port.ycoord, positive_port.zcoord] * G.dx * step
        #
        # if(positive_port.ycoord > reference_port.ycoord):
        #     step = -1
        # else:
        #     step = 1
        # for y in range(positive_port.ycoord,reference_port.ycoord, step):
        #     potential_difference += G.Ey[positive_port.xcoord, y , positive_port.zcoord] * G.dy * step
        #
        # if(positive_port.zcoord > reference_port.zcoord):
        #     step = -1
        # else:
        #     step = 1
        # for z in range(positive_port.zcoord,reference_port.zcoord, step):
        #     potential_difference += G.Ez[positive_port.xcoord, positive_port.ycoord, z] * G.dz * step

        return potential_difference



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


    def compute_voltages(self):
        for port in self.component_ports:
            port.voltage = e_field_integrate(G, port, self.reference_port)
            port.voltage_history.append(port.voltage)


    def E_magnitude(self):
        return np.sqrt(self.grid.E[:,:,:,X]**2.0 + self.grid.E[:,:,:,Y]**2.0 + self.grid.E[:,:,:,Z]**2.0)


    def dump_to_vtk(self, filename, iteration):
        '''
        Extension is automatically chosen, you don't need to supply it

        thanks
        https://pyscience.wordpress.com/2014/09/06/numpy-to-vtk-converting-your-numpy-arrays-to-vtk-arrays-and-files/

        Paraview needs a 'theshold' operation to view the objects correctly.
        '''
        x = np.arange(0, self.grid.Nx+1)
        y = np.arange(0, self.grid.Ny+1)
        z = np.arange(0, self.grid.Nz+1)

        objects = np.zeros_like(self.grid.E[:,:,:,X])
        for obj in self.grid.objects:
            if(obj.name == "substrate"):
                objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 1
            else:
                objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 2


        Ex = np.ascontiguousarray(self.grid.E[:,:,:,X])
        Ey = np.ascontiguousarray(self.grid.E[:,:,:,Y])
        Ez = np.ascontiguousarray(self.grid.E[:,:,:,Z])
        Emag = np.ascontiguousarray(self.E_magnitude()) # gridToVTK expects a contiguous array.

        gridToVTK(filename + str(iteration), x, y, z, cellData = {'Ex': Ex,
                                                                     'Ey': Ey,
                                                                     'Ez': Ez,
                                                                     '|E|': Emag,
                                                                     'objects': objects})
