

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
