import fdtd

from cairosvg import svg2png
import lxml.etree as etree

X = 0
Y = 1
Z = 2

def import_svg(svg_file, cell_size, pml_cells=10):

    svg = etree.parse(svg_file).getroot()
    width = float(svg.attrib['width'].strip('cm')) / 100.0 #to meters
    height = float(svg.attrib['height'].strip('cm')) / 100.0 #to meters
    print("Imported {} | width: {} | height: {}".format(svg_file, width, height))

    cairosvg.svg2png(url=svg_file, parent_width, parent_height)

    grid = fdtd.Grid(
        (10,10,10),
        grid_spacing=cell_size,
        permittivity=1.0,
        permeability=1.0
    )

    fdtd.PML(1e-8, # stability factor
        None)

    grid[0:pml_cells, :, :] = fdtd.PML(name="pml_xlow")
    grid[-pml_cells:, :, :] = fdtd.PML(name="pml_xhigh")
    grid[:, 0:pml_cells, :] = fdtd.PML(name="pml_ylow")
    grid[:, -pml_cells:, :] = fdtd.PML(name="pml_yhigh")
    grid[:, : ,0:pml_cells] = fdtd.PML(name="pml_zlow")
    grid[:, : ,-pml_cells:] = fdtd.PML(name="pml_zhigh")

    return grid


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
# "Incorporating non-linear lumped elements in FDTD: the equivalent source method"
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