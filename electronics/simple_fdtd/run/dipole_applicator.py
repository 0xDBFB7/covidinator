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
from fdtd_PCB_extensions import tissue
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

import sys
#
# sys.path.append('/home/arthurdent/covidinator/biology/FDTD/')
# import tissue

# fdtd.set_backend("numpy")

#include store.py
sys.path.append('/home/arthurdent/covidinator/electronics/')
import store

os.system("rm dumps/*")
os.system("rm data/*")

N_x = 100
N_y = 100
N_z = 100

pcb = fd.PCB(0.002, xy_margin=15, z_margin=15)
fd.initialize_grid(pcb,N_x,N_y,N_z, courant_number = 0.4)

f = 9e9

fd.dump_to_vtk(pcb,'dumps/test',0)

dipole_length = int(0.01/pcb.cell_size) #cells
dipole_source_position = np.array([10,10,10])
dipole_source_position += pcb.xy_margin
z_slice = slice(dipole_source_position[Z],dipole_source_position[Z]+1)

raw = tissue.import_raw_voxel_file('/home/arthurdent/covidinator/biology/FDTD/chunks/2mm_100x100x100_left_lung_5.raw', [100,100,100])
inverse_permittivity, absorption_factor, active_tissue = tissue.voxel_to_fdtd_grid_import(pcb.grid, raw, [0,0,0], 0.002, pcb.cell_size, f)


print_step = 500
dump_step = 2e-12

prev_dump_time = 0

while(pcb.time < (2.0 * 2.0 * pi * f)):

    source_voltage = sin(pcb.time * 2.0 * pi * f)
    print(source_voltage)

    current = ((pcb.grid.H[dipole_source_position[X],dipole_source_position[Y]-1,z_slice,X]-
                pcb.grid.H[dipole_source_position[X],dipole_source_position[Y],z_slice,X])*pcb.cell_size)
    current += ((pcb.grid.H[dipole_source_position[X],dipole_source_position[Y],z_slice,Y]-
                pcb.grid.H[dipole_source_position[X]-1,dipole_source_position[Y],z_slice,Y])*pcb.cell_size)

    current = float(current.cpu())
    current /= (pcb.cell_size/sqrt(mu_0))
    #field normalized according to Flaport's thesis, chapter 4.1.6


    #[Luebbers 1996]

    #update equation from 'fdtd' - otherwise we'd need thousands of AbsorbingObjects!
    print(np.shape(absorption_factor[active_tissue]))
    print(np.shape(pcb.grid.E))
    pcb.grid.E[active_tissue,:] *= (1 - absorption_factor[active_tissue]) / (1 + absorption_factor[active_tissue])
    pcb.grid.E[active_tissue,:] += (
        pcb.grid.courant_number
        * inverse_permittivity[active_tissue]
        * curl_H[active_tissue]
        / (1 + absorption_factor[active_tissue])
    )


    source_resistive_voltage = (50.0 * current)

    pcb.grid.E[dipole_source_position[X]:dipole_source_position[X]+1,\
                dipole_source_position[Y]:dipole_source_position[Y]+1,\
                    dipole_source_position[Z]+1:dipole_source_position[Z]+1+dipole_length,:] = 0 # zero dipole arm voltage

    pcb.grid.E[dipole_source_position[X]:dipole_source_position[X]+1,\
                dipole_source_position[Y]:dipole_source_position[Y]+1,\
                    dipole_source_position[Z]-1:dipole_source_position[Z]-1-dipole_length,:] = 0 # zero dipole arm voltage


    pcb.grid.E[dipole_source_position[X],dipole_source_position[Y],z_slice,Z] = sqrt(epsilon_0) * ((source_voltage + source_resistive_voltage) / (pcb.cell_size))




    print(current)

    if((dump_step and abs(pcb.time-prev_dump_time) > dump_step) or pcb.grid.time_steps_passed == 0):
        #paraview gets confused if the first number isn't zero.
        fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
        prev_dump_time = pcb.time

    fd.just_FDTD_step(pcb)
