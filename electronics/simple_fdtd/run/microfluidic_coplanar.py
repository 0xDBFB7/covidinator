# import torch
# import numpy as np
# import gc
# torch.cuda.empty_cache()
#
# gc.collect()

# np.seterr(all='raise')
# torch.autograd.set_detect_anomaly(True)
import fdtd_PCB_extensions as fd
from fdtd_PCB_extensions import fdtd
from fdtd_PCB_extensions import X,Y,Z, gaussian_derivative_pulse
from scipy.constants import mu_0, epsilon_0
import scipy.constants
from math import sin, pi, pow, exp, sqrt
import time
import os
import matplotlib.pyplot as plt
import copy
from scipy.signal import gausspulse
import dill
from pytexit import py2tex
import pickle

import numpy as np
import math


fdtd.set_backend("torch.cuda")


# fdtd.set_backend("numpy")

#include store.py
import sys
sys.path.append('/home/arthurdent/covidinator/electronics/')
import store

os.system("rm dumps/*")
os.system("rm data/*")

#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject

substrate_thickness = 0.79e-3
substrate_dielectric_constant = 4.4


microstrip_width = 1e-3
microstrip_length = 0.6e-3

fluid_dielectric_constant = 65


sim_width = 6e-3

pcb = fd.PCB(0.1e-3, xy_margin=15, z_margin=15)
fd.initialize_grid(pcb,int((sim_width)/pcb.cell_size),int((microstrip_length)/pcb.cell_size),
                                int(0.003/pcb.cell_size), courant_number = 0.4)

#depends on timestep courant number!

fd.create_planes(pcb, 0.032e-3, 6e7)
fd.create_substrate(pcb, substrate_thickness, substrate_dielectric_constant, 0.02, 9e9)


z_slice = slice(pcb.component_plane_z,(pcb.component_plane_z+1))


centerline = int((sim_width / pcb.cell_size ) / 2.0) + pcb.xy_margin


#wipe copper
# pcb.copper_mask[:, :, z_slice] = 0
# pcb.copper_mask[:, :, pcb.ground_plane_z_top:pcb.component_plane_z] = 0



microstrip_gap = 0.2e-3 # distance to ground plane
#microstrip line
m_w_N = int((microstrip_width/2)/pcb.cell_size)

#stitch ends of coplanar
# pcb.copper_mask[centerline+m_w_N+int(microstrip_gap/pcb.cell_size)+1, pcb.xy_margin+2,pcb.ground_plane_z_top:pcb.component_plane_z] = 1 # vias
# pcb.copper_mask[centerline-m_w_N-int(microstrip_gap/pcb.cell_size)-1, pcb.xy_margin+2,pcb.ground_plane_z_top:pcb.component_plane_z] = 1 # vias
# pcb.copper_mask[centerline+m_w_N+int(microstrip_gap/pcb.cell_size)+1, -pcb.xy_margin-2,pcb.ground_plane_z_top:pcb.component_plane_z] = 1 # vias
# pcb.copper_mask[centerline-m_w_N-int(microstrip_gap/pcb.cell_size)-1, -pcb.xy_margin-2,pcb.ground_plane_z_top:pcb.component_plane_z] = 1 # vias
#

# pcb.copper_mask[centerline-m_w_N-int(microstrip_gap/pcb.cell_size)-2:centerline+m_w_N+int(microstrip_gap/pcb.cell_size)+2,  -pcb.xy_margin-2:-pcb.xy_margin,0:pcb.ground_plane_z_top] = 1 # vias
# pcb.copper_mask[centerline-m_w_N-int(microstrip_gap/pcb.cell_size)-2:centerline+m_w_N+int(microstrip_gap/pcb.cell_size)+2,  pcb.xy_margin:pcb.xy_margin+2,0:pcb.ground_plane_z_top] = 1 # vias



# pcb.copper_mask[0:-1, pcb.xy_margin+1:-pcb.xy_margin-2, 0:pcb.ground_plane_z_top] = 0
# pcb.copper_mask[0:-1, pcb.xy_margin+1:-pcb.xy_margin-2, 0:pcb.ground_plane_z_top] = 0
#
#


# #ground 2
# pcb.copper_mask[centerline+m_w_N+int(microstrip_gap/pcb.cell_size):-pcb.xy_margin, \
#                     pcb.xy_margin:int(pcb.xy_margin+(int(microstrip_length/pcb.cell_size))), z_slice] = 1
#
# #ground 1
# pcb.copper_mask[pcb.xy_margin:centerline-m_w_N-int(microstrip_gap/pcb.cell_size), \
#                     pcb.xy_margin:int(pcb.xy_margin+(int(microstrip_length/pcb.cell_size))), z_slice] = 1

# defect_length = 1.5e-3
# defect_width =
# pcb.copper_mask[,int((microstrip_length/2.0)/pcb.cell_size):int((microstrip_length/2.0+defect_length)/pcb.cell_size), z_slice] = 1


# radius = int(1e-3 / pcb.cell_size)
# for x in range(0, int((sim_width)/pcb.cell_size)+pcb.xy_margin):
#     for y in range(0, int((microstrip_length)/pcb.cell_size)):
#
#         pcb.copper_mask[x, y, z_slice] = (pcb.copper_mask[x, y, z_slice] or math.sqrt((x-centerline)**2.0 + ( (y-((int((microstrip_length/2.0)/pcb.cell_size))+pcb.xy_margin)) - radius)**2.0 ) < radius)
#


pcb.copper_mask[centerline-m_w_N:centerline+m_w_N, \
                    pcb.xy_margin:int(pcb.xy_margin+(int((microstrip_length )/pcb.cell_size))), z_slice] = 1



#fluid
conductivity_scaling = 1.0/(pcb.cell_size / epsilon_0) #again, flaport's thesis.
#
# pcb.grid[centerline+m_w_N:(centerline+m_w_N+int(microstrip_gap/pcb.cell_size)), int((microstrip_length*0.25)/pcb.cell_size):int((microstrip_length*0.75)/pcb.cell_size), \
#             int(pcb.component_plane_z-(0.1e-3//pcb.cell_size)): pcb.component_plane_z+2 ] \
#                         = fdtd.AbsorbingObject(conductivity=0.010*conductivity_scaling, permittivity=fluid_dielectric_constant, name="fluid")
#

fd.dump_to_vtk(pcb,'dumps/test',0)
pcb.component_ports = [] # wipe ports
pcb.component_ports.append(fd.Port(pcb, 0, int((sim_width / pcb.cell_size ) / 2.0)*pcb.cell_size, (microstrip_length)-pcb.cell_size))
pcb.component_ports.append(fd.Port(pcb, 0, int((sim_width / pcb.cell_size ) / 2.0)*pcb.cell_size, (microstrip_length)-pcb.cell_size))
# pcb.component_ports.append(fd.Port(pcb, 0, int((sim_width / pcb.cell_size ) / 2.0)*pcb.cell_size, pcb.cell_size*3))

voltages = np.array([])

currents = np.array([])

print_step = 500
dump_step = 2e-12

prev_dump_time = 0

f = 100e9
while(pcb.time < (2.0 * 2.0 * pi * f)):

    try:
        # source_voltage = gaussian_derivative_pulse(pcb, 4e-12, 32)/(26.804e9)
        source_voltage = (pcb.time*f)/((pcb.time*f)+1)
        # source_voltage = sin(pcb.time * 2.0 * pi * f)
        # print(source_voltage)

        z_slice = slice(pcb.component_plane_z-1,pcb.component_plane_z)

        current = pcb.component_ports[0].get_current(pcb)
        #[Luebbers 1996]

        source_resistive_voltage = (50.0 * current)

        pcb.component_ports[0].set_voltage(pcb, source_voltage + source_resistive_voltage)

        # port_2_voltage = (pcb.component_ports[1].get_current(pcb)*50.0)
        # pcb.component_ports[1].set_voltage(pcb, 0)


        print(pcb.component_ports[0].get_current(pcb))
        print(pcb.component_ports[1].get_current(pcb))

        # print(pcb.component_ports[1].get_current(pcb))
        # # print(port_2_voltage)
        print(pcb.component_ports[0].get_voltage(pcb))
        print(pcb.component_ports[1].get_voltage(pcb))

        # voltages = np.append(voltages, source_voltage)
        # currents = np.append(currents, current)
        #
        # if((dump_step and abs(pcb.time-prev_dump_time) > dump_step) or pcb.grid.time_steps_passed == 0):
        #     #paraview gets confused if the first number isn't zero.
        #     fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
        #     prev_dump_time = pcb.time

        fd.just_FDTD_step(pcb)
    except KeyboardInterrupt:
        dill.dump_session("data/microfluidic.pkl")
        break
