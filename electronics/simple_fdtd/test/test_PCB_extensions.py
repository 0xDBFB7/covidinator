import pytest

from PCB_extensions import *

fdtd.set_backend("numpy")

def test_grid_creation():
    pcb = PCB(0.0002)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)


    # assert

def test_copper_creation():
    pcb = PCB(0.00015)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/test.svg')
    pcb.dump_to_vtk('test/dumps/test',0)


def test_ports():
    pcb = PCB(0.00015)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/test.svg')
    pcb.reference_port = Port(pcb, 0, X, 1.0, 10.0e-3, 10.0e-3, 1.5e-3, )
    pcb.dump_to_vtk('test/dumps/test',1)
