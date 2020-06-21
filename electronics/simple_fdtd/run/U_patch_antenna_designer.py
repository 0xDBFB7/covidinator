import fdtd_PCB_extensions as fd
from fdtd_PCB_extensions import fdtd

from math import sin, pi
import time
import os
import matplotlib.pyplot as plt
import copy

# fdtd.set_backend("torch.cuda.HalfTensor")
fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")

os.system("rm dumps/*")
os.system("rm data/*")


#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject


pcb = fd.PCB(0.0002)
fd.initialize_grid(pcb,int(0.015/pcb.cell_size),int(0.025/pcb.cell_size), int(0.01/pcb.cell_size), courant_number = None)

fd.create_planes(pcb,0.032e-3, 6e7)
fd.create_substrate(pcb,0.8e-3, 4.4, 0.02, 9e9)



def create_patch_antenna(pcb, patch_width, patch_length):
    MICROSTRIP_FEED_WIDTH = 1.5e-3
    MICROSTRIP_FEED_LENGTH = 10e-3

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

print_step = 50

#dump_step = 1e-12
i = 0
clock_time_before = 0
sim_time_before = 0

end_time = 1250e-12

frequency = 8e9

create_patch_antenna(pcb, 0.005, 0.005)
#A good reference design on 1.6 mm FR4 is 10.1109/ATSIP.2016.7523197 [Werfelli 2016]
prev_dump_time = 0
while(pcb.time < end_time):

    if(abs(pcb.time-prev_dump_time) > dump_step or pcb.grid.time_steps_passed == 0):
        #paraview gets confused if the first number isn't zero.
        fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
        prev_dump_time = pcb.time

    # print("Period:",2.0*pi*pcb.time*frequency)
    source_voltage = sin(2.0*pi*pcb.time*frequency)
    # source_voltage = 1.0
    source_current = (source_voltage - pcb.component_ports[0].voltage) / 50.0

    

    pcb.component_ports[0].current = source_current

    fd.FDTD_step(pcb)



    for port in pcb.component_ports:
        print(port.SPICE_net, port.voltage, port.current)


    print("T:",pcb.time)

for port in pcb.component_ports:
    np.savetxt("data/"+str(port.SPICE_net)+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
