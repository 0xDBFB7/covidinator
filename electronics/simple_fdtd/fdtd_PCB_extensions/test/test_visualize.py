import pytest
import fdtd_PCB_extensions as fd



@pytest.fixture()
def setup_visualize():
    pcb = fd.PCB(0.0002)
    fd.initialize_grid_with_svg(pcb, 'test_files/basic_test.svg')
    fd.create_planes(pcb, 0.032e-3, 6e7)
    fd.create_substrate(pcb, 0.8e-3, 4.4, 0.02, 9e9)
    return pcb

def test_vtk_dump(setup_visualize):
    pcb = setup_visualize

    DUMP_FOLDER = '../../run/dumps'
    DUMP_FOLDER += "test"
    fd.dump_to_vtk(pcb, DUMP_FOLDER, 1)
