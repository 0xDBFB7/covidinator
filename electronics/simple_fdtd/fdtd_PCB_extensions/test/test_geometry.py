import fdtd_PCB_extensions as fd


def test_grid_creation():
    pcb = fd.PCB(0.0002)
    pcb.initialize_grid_with_svg(pcb, 'test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
