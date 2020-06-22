import fdtd_PCB_extensions as fd
from fdtd_PCB_extensions import fdtd
from fdtd_PCB_extensions import X,Y,Z

import numpy as np
from math import sin, pi, pow, exp
import time
import os
import matplotlib.pyplot as plt
import copy
from scipy.signal import gausspulse
import dill
from pytexit import py2tex
import pickle
# fdtd.set_backend("torch.float32")
fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")




#Polycarb. permittivity @ 10 GHz: 2.9 [10.6028/jres.071C.014] - conductivity is very low, no need for absorb.
#Water permittivity @ 10 GHz: 65 - use AbsorbingObject

patch_width = 11.4e-3
patch_length = 8.7e-3
feed_length = 0.1e-3
substrate_thickness = 0.8e-3


# patch_width =  22.26e-3
# patch_length = 16.95e-3
# feed_length = 5e-3
# substrate_thickness = 1.6e-3


pcb = fd.PCB(0.0002)
fd.initialize_grid(pcb,int(patch_width/pcb.cell_size),int((patch_length+feed_length)/pcb.cell_size),
                                int(0.005/pcb.cell_size), courant_number = None)

fd.create_planes(pcb, 0.032e-3, 6e7)
fd.create_substrate(pcb, substrate_thickness, 4.4, 0.02, 9e9)



def create_patch_antenna(pcb, patch_width, patch_length):
    MICROSTRIP_FEED_WIDTH = 1.5e-3
    MICROSTRIP_FEED_LENGTH = 5e-3

    z_slice = slice(pcb.component_plane_z,(pcb.component_plane_z+1))

    #wipe copper
    pcb.copper_mask[:, :, z_slice] = 0
    pcb.copper_mask[:,:,pcb.ground_plane_z_top:pcb.component_plane_z] = 0 # vias

    #rectangle
    p_N_x = int(patch_width / pcb.cell_size)
    p_N_y = int(patch_length / pcb.cell_size)
    pcb.copper_mask[pcb.xy_margin:pcb.xy_margin+p_N_x, pcb.xy_margin:pcb.xy_margin+p_N_y, z_slice] = 1
    #
    # #feedport
    # fp_N_x = int(MICROSTRIP_FEED_WIDTH/pcb.cell_size)
    # fp_N_y = int(MICROSTRIP_FEED_LENGTH/pcb.cell_size)
    # pcb.copper_mask[pcb.xy_margin+(p_N_x//2 - (fp_N_x//2)):pcb.xy_margin+(p_N_x//2 + (fp_N_x//2)),  \
    #                                     pcb.xy_margin+p_N_y:pcb.xy_margin+p_N_y+fp_N_y, z_slice] = 1

    pcb.component_ports = [] # wipe ports
    pcb.component_ports.append(fd.Port(pcb, 0, ((p_N_x//2)-1)*pcb.cell_size, (p_N_y-1)*pcb.cell_size))



    # pcb.copper_mask[self.xy_margin+x:self.xy_margin+x+1, self.xy_margin+(y):self.xy_margin+(y)+1, z_slice] = 1

# def create_U_patch_antenna(patch_width, patch_length, slot_length, slot_width, feed_x_position):
#     # U-patch antenna from 10.1109/LAWP.2007.914122.
#     MICROSTRIP_FEED_WIDTH = 1.5e-3
#
#
# def compute_patch_dimensions():


def gaussian_derivative_pulse(pcb, dt, beta):
    t = pcb.time
    s = 4.0/(beta*dt)
    b = (t - beta*dt)
    exponent_1 = -1.0*((s)**2.0)*((b)**2.0)
    part_one = exp(exponent_1)
    part_two = -2.0*(s**2.0)*b
    return part_one * part_two


def sim_VSWR(pcb):
    print_step = 50
    dump_step = None

    # print(pcb.grid.time_step)
    #A good reference design on 1.6 mm FR4 is 10.1109/ATSIP.2016.7523197 [Werfelli 2016]

    prev_dump_time = 0

    # end_time = 1500e-12 # the key phrase here is "If after all transients have dissipated."
    #they use 2000 timesteps at 1.8 ps each.

    pcb.grid.reset()
    fd.reset(pcb)


    voltages = np.array([])
    currents = np.array([])
    while(True):

        port = pcb.component_ports[0]

        source_voltage = gaussian_derivative_pulse(pcb, 4e-12, 32)/26.804e9


        z_slice = slice(pcb.component_plane_z-3,pcb.component_plane_z-2)
        pcb.grid.E[port.N_x,port.N_y,z_slice,Z] = source_voltage / (pcb.cell_size)

        current = ((pcb.grid.H[port.N_x,port.N_y-1,z_slice,X]-
                    pcb.grid.H[port.N_x,port.N_y,z_slice,X])*pcb.cell_size)
        current += ((pcb.grid.H[port.N_x,port.N_y,z_slice,Y]-
                    pcb.grid.H[port.N_x-1,port.N_y,z_slice,Y])*pcb.cell_size)
        current = current.cpu()


        if((dump_step and abs(pcb.time-prev_dump_time) > dump_step) or pcb.grid.time_steps_passed == 0):
            #paraview gets confused if the first number isn't zero.
            fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
            prev_dump_time = pcb.time

        fd.just_FDTD_step(pcb)

        if(pcb.grid.time_steps_passed % print_step == 0):
            # print("%: ",(pcb.time/end_time)*100.0)
            print(sum(abs(currents[-300:-1])))
        voltages = np.append(voltages, source_voltage)
        currents = np.append(currents, current)

        if(sum(abs(currents[-300:-1])) < 0.05 and len(currents) > 300):
            break


    print("=========== Finished! ============")

    voltages = np.array(voltages)
    currents = np.array(currents)

    return voltages, currents


create_patch_antenna(pcb, patch_width, patch_length)

filename = 'globalsave.pkl'
try:
    dill.load_session(filename)
except:
    os.system("rm dumps/*")
    os.system("rm data/*")
    voltages, currents = sim_VSWR(pcb)
    dill.dump_session(filename)

desired_res = 300 #100 points below F_max
fft_F_max = 15e9
required_length = int(desired_res / (fft_F_max * pcb.grid.time_step))
print(required_length)

voltages = np.pad(voltages, (0, required_length), 'edge')
currents = np.pad(currents, (0, required_length), 'edge')

times_padded = np.pad(pcb.times, (0, required_length), 'edge')

voltage_spectrum = np.fft.fft(voltages)
# spectrum_freqs = np.fft.fftfreq(len(voltages), d=pcb.time/len(voltages))
spectrum_freqs = np.fft.fftfreq(len(voltages), d=pcb.grid.time_step)

current_spectrum = np.fft.fft(currents)

# return spectrum_freqs, voltage_spectrum, current_spectrum

begin_freq = np.abs(spectrum_freqs - 1e9).argmin()
end_freq = np.abs(spectrum_freqs - 15e9).argmin()

plt.plot(times_padded, voltages)
plt.figure()
plt.plot(times_padded, currents)
plt.figure()
# plt.plot(spectrum_freqs[begin_freq:end_freq], voltage_spectrum[begin_freq:end_freq])
# plt.plot(spectrum_freqs[begin_freq:end_freq], current_spectrum[begin_freq:end_freq])
power_spectrum = -1.0*((voltage_spectrum[begin_freq:end_freq]*np.conj(current_spectrum[begin_freq:end_freq])).real)
power_spectrum /= np.linalg.norm(power_spectrum)

plt.plot(spectrum_freqs[begin_freq:end_freq],power_spectrum)

plt.figure()
plt.plot(spectrum_freqs[begin_freq:end_freq],(voltage_spectrum[begin_freq:end_freq]/current_spectrum[begin_freq:end_freq]))

plt.show()


# for port in pcb.component_ports:
#     np.savetxt("data/"+str(port.SPICE_net)+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
#
# np.savetxt("data/times.csv", np.array(pcb.times).reshape(-1, 1), delimiter=",",fmt='%10.5f')
