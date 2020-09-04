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


fdtd.set_backend("torch.cuda.float32")


sys.path.append('/home/arthurdent/covidinator/biology/FDTD/')
import tissue

# fdtd.set_backend("numpy")

#include store.py
import sys
sys.path.append('/home/arthurdent/covidinator/electronics/')
import store

os.system("rm dumps/*")
os.system("rm data/*")

#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject


pcb = fd.PCB(0.002, xy_margin=15, z_margin=15)
fd.initialize_grid(pcb,int((sim_width)/pcb.cell_size),int((microstrip_length)/pcb.cell_size),
                                int(0.0025/pcb.cell_size), courant_number = 0.4)



fd.dump_to_vtk(pcb,'dumps/test',0)

dipole_source_position = 0

print_step = 500
dump_step = 2e-12

prev_dump_time = 0

f = 8e9
while(pcb.time < (2.0 * 2.0 * pi * f)):

    source_voltage = sin(pcb.time * 2.0 * pi * f)
    print(source_voltage)

    current = pcb.component_ports[0].get_current(pcb)
    #[Luebbers 1996]

    source_resistive_voltage = (50.0 * current)


    pcb.component_ports[0].set_voltage(pcb, source_voltage + source_resistive_voltage)

    pcb.component_ports[1].set_voltage(pcb, 0 + (pcb.component_ports[1].get_current(pcb)*50.0))


    print(current)

    if((dump_step and abs(pcb.time-prev_dump_time) > dump_step) or pcb.grid.time_steps_passed == 0):
        #paraview gets confused if the first number isn't zero.
        fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
        prev_dump_time = pcb.time

    fd.just_FDTD_step(pcb)
