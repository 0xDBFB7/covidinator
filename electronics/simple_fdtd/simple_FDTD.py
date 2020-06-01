from PCB_extensions import *

# torch.set_num_threads(14)

fdtd.set_backend("torch.cuda.float32")

pcb = PCB(0.0002)
pcb.initialize_grid_with_svg('test/basic_test.svg')
pcb.create_planes(0.032e-3, 6e7)
pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
# pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/basic_test.svg')
# pcb.reference_port = Port(pcb, 0, X, 1.0, 10.0e-3, 10.0e-3, 1.5e-3, )
pcb.component_ports.append(Port(pcb, 0, 11e-3, 11.3e-3))
pcb.component_ports.append(Port(pcb, 1, 9e-3, 11.3e-3))


# pcb.component_ports[0].current = 1.0
dump_step = 20
for i in range(0,10000):
    print(pcb.grid.time_passed)

    # pcb.grid.E[:,:,:,pcb.component_plane_z:pcb.component_plane_z+1] = 0

    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,X] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,Y] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,Z] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,X] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,Y] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,Z] = 0
    pcb.compute_all_voltages()

    # pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,Y] = 0
    pcb.grid.update_E()

    # pcb.PEC()
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,X] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,Y] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.component_plane_z:pcb.component_plane_z+1,Z] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,X] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,Y] = 0
    pcb.grid.E[pcb.xy_margin:-pcb.xy_margin,pcb.xy_margin:-pcb.xy_margin,pcb.ground_plane_z_top-1:pcb.ground_plane_z_top,Z] = 0
    pcb.apply_all_currents()
    pcb.compute_all_voltages()

    pcb.grid.update_H()
    pcb.grid.time_steps_passed += 1

    if(i % dump_step == 0):
        pcb.dump_to_vtk('test/test_spice/dumps/test',i)
    print("Step {}".format(i))
    print(pcb.component_ports[0].voltage)
    print(pcb.component_ports[1].voltage)
