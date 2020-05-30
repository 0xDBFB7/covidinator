
import fdtd


grid = fdtd.Grid(
    (10,10,10),
    grid_spacing=0.01,
    permittivity=1.0,
    permeability=1.0
)

fdtd.set_backend('numpy')

fdtd.PML(1e-8, # stability factor
    None)

# x boundaries
grid[0:10, :, :] = fdtd.PML(name="pml_xlow")
grid[-10:, :, :] = fdtd.PML(name="pml_xhigh")
grid[:, 0:10, :] = fdtd.PML(name="pml_ylow")
grid[:, -10:, :] = fdtd.PML(name="pml_yhigh")
grid[:, : ,0:10] = fdtd.PML(name="pml_zlow")
grid[:, : ,-10:] = fdtd.PML(name="pml_zhigh")

grid.run(50, progress_bar=True)


grid.visualize(
    grid,
    x=0.0,
    y=0.0,
    z=1.0,
    cmap="Blues",
    pbcolor="C3",
    pmlcolor=(0, 0, 0, 0.1),
    objcolor=(1, 0, 0, 0.1),
    srccolor="C0",
    detcolor="C2",
    show=True)
