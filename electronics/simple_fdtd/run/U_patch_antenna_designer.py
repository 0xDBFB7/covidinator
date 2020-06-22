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

from pytexit import py2tex

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

pcb = fd.PCB(0.0002)
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


def gaussian_derivative(pcb, beta):
    dt = pcb.grid.time_step
    t = pcb.time
    s = 4.0/(beta*dt)
    b = (t - beta*dt)
    exponent_1 = -1.0*((s)**2.0)*((b)**2.0)
    part_one = exp(exponent_1)
    part_two = -2.0*(s**2.0)*b
    return part_one * part_two


def sim_VSWR(pcb, freqs):
    print_step = 50
    dump_step = None

    #A good reference design on 1.6 mm FR4 is 10.1109/ATSIP.2016.7523197 [Werfelli 2016]

    prev_dump_time = 0

    # end_time = (1.0 / frequency) * 0.1 # 5 periods of the sine
    end_time = 1000e-12 # the key phrase here is "If after all transients have dissipated."

    energy = 0
    pcb.grid.reset()
    fd.reset(pcb)


    voltages = []
    currents = []
    while(pcb.time < end_time):

        port = pcb.component_ports[0]

        source_voltage = gaussian_derivative(pcb, 32)

        pcb.grid.E[port.N_x,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,Z] = source_voltage / (pcb.cell_size)

        current = ((pcb.grid.H[port.N_x,port.N_y-1,pcb.component_plane_z-3:pcb.component_plane_z-2,X]-
                    pcb.grid.H[port.N_x,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,X])*pcb.cell_size)
        current += ((pcb.grid.H[port.N_x,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,Y]-
                    pcb.grid.H[port.N_x-1,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,Y])*pcb.cell_size)
        current = current.cpu()


        if(dump_step and (abs(pcb.time-prev_dump_time) > dump_step or pcb.grid.time_steps_passed == 0)):
            #paraview gets confused if the first number isn't zero.
            fd.dump_to_vtk(pcb,'dumps/test',pcb.grid.time_steps_passed)
            prev_dump_time = pcb.time

        fd.just_FDTD_step(pcb)

        if(pcb.grid.time_steps_passed % print_step == 0):
            print("%: ",(pcb.time/end_time)*100.0)


        voltages.append(source_voltage)
        currents.append(current)

    print("=========== Finished! ============")

    voltages = np.array(voltages)[::10]
    currents = np.array(currents)[::10]

    voltage_spectrum = np.fft.fft(voltages)
    spectrum_freqs = np.fft.fftfreq(len(voltages), d=end_time/len(voltages))

    current_spectrum = np.fft.fft(currents)

    # return spectrum_freqs, voltage_spectrum, current_spectrum

    begin_freq = np.abs(spectrum_freqs - 1e9).argmin()
    end_freq = np.abs(spectrum_freqs - 15e9).argmin()

    # plt.plot(pcb.times, voltages)
    # plt.plot(pcb.times, currents)
    # plt.plot(spectrum_freqs[begin_freq:end_freq], voltage_spectrum[begin_freq:end_freq])
    # plt.plot(spectrum_freqs[begin_freq:end_freq], current_spectrum[begin_freq:end_freq])
    power_spectrum = -1.0*voltage_spectrum[begin_freq:end_freq]*np.conj(current_spectrum[begin_freq:end_freq])
    power_spectrum /= np.linalg.norm(power_spectrum)
    plt.plot(spectrum_freqs[begin_freq:end_freq],power_spectrum)

    plt.show()

freqs = np.linspace(1e9, 6e9, 30)

create_patch_antenna(pcb, patch_width, patch_length)

sim_VSWR(pcb, freqs)


# for port in pcb.component_ports:
#     np.savetxt("data/"+str(port.SPICE_net)+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
#
# np.savetxt("data/times.csv", np.array(pcb.times).reshape(-1, 1), delimiter=",",fmt='%10.5f')
