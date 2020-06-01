import pytest

from PCB_extensions import *
# torch.set_num_threads(14)

fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")

def DISABLED_test_grid_creation():
    pcb = PCB(0.0002)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)


    # assert

def DISABLED_test_copper_creation():
    pcb = PCB(0.00015)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/test.svg')
    # pcb.dump_to_vtk('test/dumps/test',0)


def DISABLED_test_ports():
    pcb = PCB(0.00015)
    pcb.initialize_grid_with_svg('test/test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/test.svg')
    pcb.reference_port = Port(pcb, 0, X, 1.0, 10.0e-3, 10.0e-3, 1.5e-3)
    pcb.dump_to_vtk('test/test_ports/dumps/test',0)


def test_SPICE():
    pcb = PCB(0.0002)
    pcb.initialize_grid_with_svg('test/basic_test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/basic_test.svg')
    # pcb.reference_port = Port(pcb, 0, X, 1.0, 10.0e-3, 10.0e-3, 1.5e-3, )
    pcb.component_ports.append(Port(pcb, 0, 11.8e-3, 11.4e-3))
    pcb.component_ports.append(Port(pcb, 1, 7.4e-3, 11.4e-3))

    # pcb.component_ports[0].current = 1.0
    for i in range(0,300):
        print(pcb.grid.time_passed)
        # pcb.PEC()
        pcb.grid.step()
        # pcb.PEC()
        pcb.compute_all_voltages()
        pcb.apply_all_currents()
        pcb.dump_to_vtk('test/test_spice/dumps/test',i)
        print("Step {}".format(i))
        print(pcb.component_ports[0].voltage)
        print(pcb.component_ports[1].voltage)
