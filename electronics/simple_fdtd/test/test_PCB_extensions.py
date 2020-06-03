import pytest

from PCB_extensions import *
# torch.set_num_threads(14)

SPICE_binary = '/home/arthurdent/Programs/ngspice-32/install/bin/ngspice'


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


def DISABLED_test_Simple():
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



def DISABLED_test_spice():
    SPICE_source_file = 'test/test_spice/txline_fdtd_spice.cir'

    pcb = PCB(0.0002)
    pcb.initialize_grid_with_svg('test/basic_test.svg')
    pcb.create_planes(0.032e-3, 6e7)
    pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
    pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/basic_test.svg')

    pcb.reference_port = Port(pcb, 0, 0, 0)
    pcb.component_ports.append(Port(pcb, 0, 11e-3, 11.3e-3))
    pcb.component_ports.append(Port(pcb, 1, 9e-3, 11.3e-3))

    pcb.init_SPICE(SPICE_binary, SPICE_source_file)

    dump_step = 20
    for i in range(0,10000):
        pcb.grid.update_E()

        pcb.zero_conductor_fields()
        pcb.apply_all_currents()
        pcb.compute_all_voltages()
        pcb.grid.update_H()
        pcb.grid.time_steps_passed += 1

        if(i % dump_step == 0):
            pcb.dump_to_vtk('test/test_spice/dumps/test',i)
        print("Step {}".format(i))
        print(pcb.grid.time_passed)
        print(pcb.component_ports[0].voltage)
        print(pcb.component_ports[1].voltage)


def test_spice_alone():
        SPICE_source_file = '/home/arthurdent/covidinator/electronics/simple_fdtd/'
        SPICE_source_file += 'test/test_spice/txline_fdtd_spice.cir'

        pcb = PCB(0.0002)
        pcb.initialize_grid_with_svg('test/basic_test.svg')
        pcb.create_planes(0.032e-3, 6e7)
        pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
        pcb.component_ports.append(Port(pcb, 0, 11e-3, 11.3e-3))
        pcb.component_ports.append(Port(pcb, 1, 9e-3, 11.3e-3))

        pcb.init_SPICE(SPICE_binary, SPICE_source_file)
        pcb.reset_spice()
        pcb.set_spice_voltage('input_terminated',10)
        pcb.set_spice_voltage('output',10)
        # pcb.reset_spice()
        pcb.run_spice_step()
        print(pcb.get_spice_voltage('input_terminated'))
        print(pcb.get_spice_voltage('output'))



def disabled_test_spice():
        SPICE_source_file = '/home/arthurdent/covidinator/electronics/simple_fdtd/'
        SPICE_source_file += 'test/test_spice/txline_fdtd_spice.cir'

        pcb = PCB(0.0002)
        pcb.initialize_grid_with_svg('test/basic_test.svg')
        pcb.create_planes(0.032e-3, 6e7)
        pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
        pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/basic_test.svg')

        pcb.component_ports.append(Port(pcb, 'input_terminated', 11e-3, 11.3e-3))
        pcb.component_ports.append(Port(pcb, 'output', 9e-3, 11.3e-3))

        pcb.init_SPICE(SPICE_binary, SPICE_source_file)
        pcb.reset_spice()

        dump_step = 20
        for i in range(0,10000):

            pcb.grid.update_E()

            pcb.zero_conductor_fields()
            pcb.compute_all_voltages()
            print("V1, {} V2 {} ".format(pcb.component_ports[0].voltage,
                                                                    pcb.component_ports[1].voltage))
            pcb.reset_spice()
            pcb.set_spice_voltages()
            pcb.reset_spice()

            pcb.run_spice_step()

            pcb.get_spice_voltages()

            pcb.apply_all_currents()

            pcb.grid.update_H()
            pcb.grid.time_steps_passed += 1

            if(i % dump_step == 0):
                pcb.dump_to_vtk('test/test_spice/dumps/test',i)
            print("Step {}".format(i))

            print("V1, {} V2 {}, SPice V1 {}, SPice V2 {} ".format(pcb.component_ports[0].voltage,
                                                                    pcb.component_ports[1].voltage,
                                                                    pcb.get_spice_voltage('input_terminated'),
                                                                    pcb.get_spice_voltage('output')))
