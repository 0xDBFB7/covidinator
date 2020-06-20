import fdtd

from cairosvg import svg2png
import lxml.etree as etree
from PIL import Image
import io
import math
from pyevtk.hl import gridToVTK
from math import pi, ceil, cos, sin, log
from scipy.constants import mu_0,epsilon_0
import numpy as np
import torch

from importlib import reload

import gc


# import subprocess
import sys
# import signal

import copy

import ngspyce
from ngspyce.sharedspice import *


from fdtd.backend import NumpyBackend
from fdtd.backend import backend as bd


from numpy import array


import sexpdata #hehe
# from pykicad.pcb import *
# from pykicad.module import * unfortunately, got an error immediately with this. probably for a different version of kicad.



X = 0
Y = 1
Z = 2


class PCB:
    def __init__(self, cell_size, z_height=2e-3, xy_margin=15, z_margin=11, pml_cells=10):

        self.time = 0
        self.grid = None
        self.cell_size = cell_size

        self.z_height = z_height
        self.xy_margin = xy_margin
        self.z_margin = z_margin

        self.pml_cells = pml_cells

        self.ground_plane_z_top = None
        self.component_plane_z = None

        # self.reference_port = None
        self.component_ports = []
        self.substrate_permittivity = None

        self.copper_mask = None

        self.times = []
        self.time_step_history = []




    def compute_all_voltages(self):
        for port in self.component_ports:
            # port.voltage = self.e_field_integrate(port, self.reference_port)
            #since all conductors have zero electric field, this is a reasonable approximation -
            #
            port.voltage = float(sum(self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z,Z])*self.cell_size)
            # port.voltage_history.append(port.voltage)

#permittivity might have to be cubed
#is there a bug in fdtd/grid/permittivity? Seems like it's not updated unless it's an array

    def create_source_vias(self):
        for port in self.component_ports:

            self.copper_mask[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-3] = 1 #make a conductor
            self.copper_mask[port.N_x,port.N_y,self.component_plane_z-2:self.component_plane_z] = 1 #make a conductor

                # self.copper_mask[port.N_x:port.N_x+1,port.N_y:port.N_y+1,self.ground_plane_z_top:self.component_plane_z] = 1 # for good measure



    def compute_all_currents(self):
        for idx, port in enumerate(self.component_ports):

            #
            # self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-3,Z] = 0 #make a conductor
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-2:self.component_plane_z,Z] = 0 #make a conductor
            #
            # C = epsilon_0*(self.cell_size**2.0)*(self.substrate_permittivity)/(1.0*self.cell_size)
            # # print(C)
            #
            # # C *= 10.0
            #
            # dvdt = (port.current / C)
            #
            # port.voltage += (dvdt * self.grid.time_step)
            #
            # self.grid.E[port.N_x,port.N_y,self.component_plane_z-3:self.component_plane_z-2,Z] = port.voltage / (self.cell_size)

            #equation 4, 5 in [Toland 1993]
            # self.current = 1.0
            z_slice = slice(self.component_plane_z-3,self.component_plane_z-2)

            perm_factor = ((self.substrate_permittivity * 8.85e-12)/self.grid.time_step)
            E_n = self.grid.E[port.N_x,port.N_y,z_slice,Z]*perm_factor

            L_H =  ((self.grid.H[port.N_x,port.N_y-1,z_slice,X] - self.grid.H[port.N_x,port.N_y,z_slice,X]) / self.cell_size)
            L_H += ((self.grid.H[port.N_x,port.N_y,z_slice,Y] - self.grid.H[port.N_x-1,port.N_y,z_slice,Y]) / self.cell_size)

            I = -1.0*(port.old_current+port.current)/(2.0*(self.cell_size**2.0))
            print(E_n, L_H, I)
            E_new =  E_n
            E_new += L_H
            E_new -= I

            E_new /= perm_factor

            self.grid.E[port.N_x,port.N_y,z_slice,Z] = E_new


            print("E_new",E_new)

            port.old_current = port.current


    def zero_conductor_fields(self):
        self.grid.E[self.copper_mask] = 0



    def E_magnitude(self, E):
        return np.sqrt(E[:,:,:,X]**2.0 + E[:,:,:,Y]**2.0 + E[:,:,:,Z]**2.0)


    def step(self):

        self.forcings()



        # self.to_taste()

        self.FDTD_step()

        self.compute_all_voltages()


        # [abs(i.voltage i    pcb.apply_all_currents()

        # self = self.adaptive_timestep(failsafe_timestep)

    def FDTD_step(self):
        self.grid.update_E()

        self.zero_conductor_fields()

        self.apply_all_currents()
        # self.constrain_values()
        self.grid.update_H()

        self.grid.time_steps_passed += 1
        self.time += self.grid.time_step # the adaptive
        self.times.append(self.time)

    def forcings(self):
        for port in self.component_ports:
        # if(current > 0.5
        # port.voltage = np.clip(port.voltage, -40, 40)
            port.current = np.clip(port.current, -10, 10)

    def to_taste(self):
        #Using an adaptive timestep method as per [Ciampolini 1995]

        z_slice = slice(self.component_plane_z-3,self.component_plane_z-2)

        failsafe_port_voltages = []
        failsafe_port_currents = []
        failsafe_port_old_currents = []

        for idx,port in enumerate(self.component_ports):
            failsafe_port_voltages.append(self.grid.E[port.N_x,port.N_y,z_slice,Z].cpu())
            failsafe_port_currents.append(port.current)
            failsafe_port_old_currents.append(port.old_current)
        # failsafe_ports = copy.deepcopy(self.component_ports)

        delta_v = 0



        # we know the dV/dt, just compute the timestep directly.

        # this coefficient is somewhat tricky.
        # higher, and the loop below will have to try more timesteps to find convergence.
        # lower, and changes in required timestep will take longer to propagate.
        self.set_time_step(self.grid.time_step*4.0)

        # a better convergence metric would be useful.
        while(True):


            # for port in self.component_ports:
            #     print(port.SPICE_net, port.voltage, port.current)
            #

            self.apply_all_currents()
            self.compute_all_voltages()
            #
            # for port in self.component_ports:
            #     print(port.SPICE_net, port.voltage, port.current)

            delta_vs = [abs(failsafe_port_voltages[idx]-val.voltage) for idx,val in enumerate(self.component_ports)]
            delta_v = max(delta_vs)
            fastest_net = self.component_ports[delta_vs.index(delta_v)].SPICE_net
            print("DV",delta_v)
            # print("Delta V:" , delta_v)
            convergence = delta_v < 0.1

            if(convergence):
                break
            else:
                self.set_time_step(self.grid.time_step*0.5)
                print("Decreased timestep to " , self.grid.time_step)

                for idx,port in enumerate(self.component_ports):
                    self.grid.E[port.N_x:port.N_x+1,port.N_y:port.N_y+1,z_slice,Z] = failsafe_port_voltages[idx]
                    print("AAAAAAAA",self.grid.E[port.N_x,port.N_y,z_slice,Z])
                    port.current = failsafe_port_currents[idx]
                    port.old_current = failsafe_port_old_currents[idx]

            # prev_convergence = copy.copy(new_convergence)


    def set_time_step(self, ts):
        self.grid.time_step = ts
        self.grid.courant_number = self.grid.time_step/(self.grid.grid_spacing / 3.0e8)
