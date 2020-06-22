import fdtd_PCB_extensions as fd
from fdtd_PCB_extensions import fdtd

import numpy as np
from math import sin, pi
import time
import os
import matplotlib.pyplot as plt
import copy

# fdtd.set_backend("torch.float32")
fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")

os.system("rm dumps/*")
os.system("rm data/*")


#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject

patch_width = 0.0222
patch_length = 0.017
feed_length = 0.005

pcb = fd.PCB(0.0005)
fd.initialize_grid(pcb,int(patch_width/pcb.cell_size)+2*(pcb.xy_margin),int((patch_length+feed_length)/pcb.cell_size)+2*(pcb.xy_margin),
                                int(0.01/pcb.cell_size), courant_number = None)

fd.create_planes(pcb,0.032e-3, 6e7)
fd.create_substrate(pcb,1.6e-3, 4.4, 0.02, 9e9)



def create_patch_antenna(pcb, patch_width, patch_length):
    MICROSTRIP_FEED_WIDTH = 3.1e-3
    MICROSTRIP_FEED_LENGTH = 5e-3

    z_slice = slice(pcb.component_plane_z,(pcb.component_plane_z+1))

    #wipe copper
    pcb.copper_mask[:, :, z_slice] = 0
    pcb.copper_mask[:,:,pcb.ground_plane_z_top:pcb.component_plane_z] = 0 # vias

    #rectangle
    p_N_x = int(patch_width / pcb.cell_size)
    p_N_y = int(patch_length / pcb.cell_size)
    pcb.copper_mask[pcb.xy_margin:pcb.xy_margin+p_N_x, pcb.xy_margin:pcb.xy_margin+p_N_y, z_slice] = 1

    #feedport
    fp_N_x = int(MICROSTRIP_FEED_WIDTH/pcb.cell_size)
    fp_N_y = int(MICROSTRIP_FEED_LENGTH/pcb.cell_size)
    pcb.copper_mask[pcb.xy_margin+(p_N_x//2 - (fp_N_x//2)):pcb.xy_margin+(p_N_x//2 + (fp_N_x//2)),  \
                                        pcb.xy_margin+p_N_y:pcb.xy_margin+p_N_y+fp_N_y, z_slice] = 1

    pcb.component_ports = [] # wipe ports
    pcb.component_ports.append(fd.Port(pcb, 0, ((p_N_x//2)-1)*pcb.cell_size, (p_N_y+fp_N_y-1)*pcb.cell_size))



    # pcb.copper_mask[self.xy_margin+x:self.xy_margin+x+1, self.xy_margin+(y):self.xy_margin+(y)+1, z_slice] = 1

# def create_U_patch_antenna(patch_width, patch_length, slot_length, slot_width, feed_x_position):
#     # U-patch antenna from 10.1109/LAWP.2007.914122.
#     MICROSTRIP_FEED_WIDTH = 1.5e-3
#
#
# def compute_patch_dimensions():


#Using the VSWR method from [Penney 1994],



def sim_VSWR(pcb, freqs):
    print_step = 50
    # dump_step = 2e-12
    dump_step = None

    create_patch_antenna(pcb, patch_width, patch_length)
    #A good reference design on 1.6 mm FR4 is 10.1109/ATSIP.2016.7523197 [Werfelli 2016]
    prev_dump_time = 0

    delivered_power = np.zeros_like(freqs)

    # end_time = (1.0 / frequency) * 0.1 # 5 periods of the sine
    end_time = 500e-12

    energy = 0
    pcb.grid.reset()
    fd.reset(pcb)
    power = 0
    while(pcb.time < end_time):
    # while(pcb.grid.time_steps_passed < 10):

        pcb.grid.E[port.N_x,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,Z] = port.voltage / (pcb.cell_size)

        if(dump_step and (abs(pcb.time-prev_dump_time) > dump_step or pcb.grid.time_steps_passed == 0)):
            #paraview gets confused if the first number isn't zero.
            fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
            prev_dump_time = pcb.time

        # print("Period:",2.0*pi*pcb.time*frequency)
        source_voltage = sin(2.0*pi*pcb.time*frequency)
        # source_voltage = 1.0
        source_current = (source_voltage - pcb.component_ports[0].voltage) / 50.0

        pcb.component_ports[0].current = source_current

        fd.FDTD_step(pcb)
        #

        if(abs(source_voltage - pcb.component_ports[0].voltage) > power):
            power = abs(source_voltage - pcb.component_ports[0].voltage)
        # energy += power * pcb.grid.time_step

        for port in pcb.component_ports:
            print(port.SPICE_net, port.voltage, port.current)


        if(pcb.grid.time_steps_passed % print_step == 0):

            # print("T: ",pcb.time)
            print("%: ",(pcb.time/end_time)*100.0)
            print(power)

    print("=========== Finished {:.3e} ============".format(frequency))
    delivered_power[f_idx] = power

    return delivered_power


freqs = np.linspace(1e9, 6e9, 30)

delivered_power = sim_VSWR(pcb, freqs)
plt.plot(freqs, delivered_power)
plt.show()

# for port in pcb.component_ports:
#     np.savetxt("data/"+str(port.SPICE_net)+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
#
# np.savetxt("data/times.csv", np.array(pcb.times).reshape(-1, 1), delimiter=",",fmt='%10.5f')
