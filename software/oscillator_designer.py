import qucs.extract
from time import sleep
import numpy as np
from scipy.signal import cheby1
from scipy.signal import find_peaks
import matplotlib.pyplot as plt
from scipy.optimize import minimize
import math
from math import sin, cos, pi, sqrt,tan, atan
from pytexit import py2tex
import skrf as rf
from skrf.media import MLine
import subprocess
import os
import sys

def mW_to_dBm(milliwatts):
    return 10.0*math.log10(milliwatts)

Z1 = 25
Z2 = 85

width_1 = 4.139e-3 #25 ohms: "alpha", lowZ
width_2 = 0.501e-3 #85 ohms: "beta", highZ

schematic_file = "/home/arthurdent/Projects/covidinator/electronics/qucs/optimize/optimize_filter_1.sch"
net_file = "/mnt/qucs-tmpfs/tmp.net"
net_file_modified = "/mnt/qucs-tmpfs/mod.net"
data_file = "/mnt/qucs-tmpfs/output.dat"

os.system("QUCSDIR=/usr/local/ /usr/local/bin/qucs -n -i " + schematic_file + " -o " + net_file)


def electrical_to_physical_length(electrical_len, trace_width, frequency):
    return (effective_wavelength(trace_width, substrate_height, substrate_dielectric_constant, frequency) \
                            * (electrical_len/(2.0*pi)))


#
# made a temporary ramfs to avoid burning cycles on SSD - not sure if that's a real issue, but
#
# `sudo mount -t tmpfs -o size=100m tmpfs /mnt/qucs-tmpfs/`

def run_sim(x, C_varactor, net_file, data_file):

#     electrical_length_ratio = 0.625

#     electrical_length_beta = - (electrical_length_alpha*electrical_length_ratio/(electrical_length_ratio-1.0))

#     length_1 = electrical_to_physical_length(electrical_length_alpha, width_1, center_frequency)
#     length_2 = electrical_to_physical_length(electrical_length_beta, width_2, center_frequency)

#     print("Trying lengths: {:.4f} rad ({:.4f} m) | {:.4f} rad ({:.4f} m) ".format(electrical_length_alpha, length_1, beta, length_2))

    length_1 = x[0]
    length_2 = x[1]
    length_3 = x[2]
    C_1 = x[3]

    with open(net_file, 'r') as file:
      netlist = file.read()

    netlist = netlist.replace('length_1', str(length_1) + " mm")
    netlist = netlist.replace('length_2', str(length_2) + " mm")
    netlist = netlist.replace('length_3', str(length_3) + " mm")

    netlist = netlist.replace('C_1', str(C_1) + " pF")
    netlist = netlist.replace('C_varactor', str(C_varactor) + " pF")

    with open(net_file_modified, 'w') as file:
        file.write(netlist)

    sim_return = subprocess.run(['qucsator', '-i', net_file_modified, '-o', data_file], stdout = subprocess.DEVNULL,  check=True)

    extracted_data = qucs.extract.load_data(data_file)

    feedback_voltage = np.array([abs(i) for i in extracted_data.__dict__["Vfb_v"]])

    return np.array(extracted_data.__dict__["acfrequency"]), feedback_voltage, np.array(extracted_data.__dict__["phase_shift"]),\
                            np.array(extracted_data.__dict__["Vout_v"])


# varactor_start = 0.3 #pF
# varactor_end = 5.0 # pf

#parasitic inductance can vary as required to build the varactor biasing circuit from discretes
# simulated annealing?

# def varactor_sweep(x):
#
#     feedback_voltages = []
#     for varactor_capacitance in np.linspace(varactor_start,varactor_end,num=5):
#
#         freq, Vfb, phases, Vamp2 = run_sim(x, varactor_capacitance, net_file, data_file)
#         feedback_voltages.append(Vfb)
#         Vamp2.append(phases)
#
#
#
#     return peak_freqs, peak_phases, peak_gains
#

def analyze(freq, Vfb, phases, Vamp2):
        Vfb_magnitude = [abs(i) for i in Vfb]
        peak_indice = find_peaks(Vfb_magnitude, height = 0.1)[0][0]
        print(len(find_peaks(Vfb_magnitude, height = 0.1)[0]))
        peak_gains.append(Vfb_magnitude[peak_indice])
        peak_freqs.append(freq[peak_indice])
        peak_phases.append(phases[peak_indice])

# def cost_function(x, varactor_capacitance):
#
#     freq, Vfb, phases, Vamp2 = run_sim(x, varactor_capacitance, net_file, data_file)
#
#
#     th = signal > 0.5
#     th[1:][th[:-1] & th[1:]] = False
#     #peak_freqs, peak_phases, peak_gains = freq_sweep(x)
#
#
#
#
#
#     min_phase = min(peak_phases)
#     min_gains = min(peak_gains)
#     span = (max(peak_freqs) - min(peak_freqs))
#
#     center_freq = ((max(peak_freqs) - min(peak_freqs))/2.0) + min(peak_freqs)
#
#     Coeff1 = 1.0/360.0
#     Coeff2 = 1.0/4e9
#     Coeff3 = 1.0/8e9
#     Coeff4 = 1.0
#
#     print(min_phase)
#
#     sleep(0.1)
#
# #     cost = (Coeff1 * (360.0 - min_phase)) + (Coeff2 * abs((4e9 - span))) +  \
# #                 (Coeff3 * abs((8e9 - center_freq))) + (Coeff4 * abs((1.0 - min_gains)))
#     print(cost)
#     return cost

#for i in np.linspace(0.05, 2, 10):
#     peak_freqs, peak_phases, peak_gains = freq_sweep([2.955, 0.45, 0.01, i])
#     print(min(peak_phases))

const = 1.0

plt.figure()
plt.plot(freq, phases)
Vfb_magnitude = [abs(i) for i in Vfb]
Vamp2_magnitude = [abs(i) for i in Vamp2]
plt.figure()
plt.plot(freq, Vfb_magnitude)
plt.plot(freq, Vamp2_magnitude)

plt.show()


minimize(cost_function, [2.955, 0.45, 1, 0.17], bounds=[(0.5,5),(0.5,5.0),(0.1,10)], args=(0.3), options={"disp":True})
