from PCB_extensions import *

import time
import os

import copy
# fdtd.set_backend("torch.cuda.HalfTensor")
fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")

import matplotlib.pyplot as plt

#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject

#A good reference design on 1.6 mm FR4 is 10.1109/ATSIP.2016.7523197 [Werfelli 2016]

pcb = PCB(0.0001)
pcb.initialize_grid(0.001/pcb.grid_spacing, 0.001/pcb.grid_spacing, 0.001/pcb.grid_spacing)
pcb.create_planes(0.032e-3, 6e7)
pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)



def create_patch_antenna(patch_width, patch_length):


def create_U_patch_antenna(patch_width, patch_length, slot_length, slot_width, feed_x_position):
    # U-patch antenna from 10.1109/LAWP.2007.914122.
    MICROSTRIP_FEED_WIDTH = 1.5e-3


def compute_patch_dimensions():

print_step = 50

dump_step = 1000
i = 0
clock_time_before = 0
sim_time_before = 0

end_time = 500e-12

while(pcb.time < end_time):

    pcb.FDTD_step()
    pcb.compute_all_voltages()



    pcb.apply_all_currents()


    for port in pcb.component_ports:
        print(port.SPICE_net, port.voltage, port.current)

    if(i % dump_step == 0):
        pcb.dump_to_vtk('dumps/test',i)



for port in pcb.component_ports:
    np.savetxt("data/"+port.SPICE_net+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
