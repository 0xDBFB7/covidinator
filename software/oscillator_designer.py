import qucs.extract
from time import sleep
import numpy as np
from scipy.signal import cheby1
from scipy.signal import find_peaks
import matplotlib.pyplot as plt
from scipy.optimize import minimize,basinhopping

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

np.set_printoptions(precision=4)

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

    with open(net_file, 'r') as file:
      netlist = file.read()

    netlist = netlist.replace('var_0', str(x[0]))
    netlist = netlist.replace('var_1', str(x[1]))
    netlist = netlist.replace('var_2', str(x[2]))
    netlist = netlist.replace('var_3', str(x[3]))
    netlist = netlist.replace('var_4', str(x[4]*10.0))
    netlist = netlist.replace('var_5', str(x[5]))
    netlist = netlist.replace('var_6', str(x[6]))

    # netlist = netlist.replace('C_1', str(C_1))
    netlist = netlist.replace('C_varactor', str(C_varactor))

    with open(net_file_modified, 'w') as file:
        file.write(netlist)

    print("---------------- QUCSATOR RUN ----------------")
    sim_return = subprocess.run(['qucsator', '-i', net_file_modified, '-o', data_file], stdout = subprocess.DEVNULL,  check=True)
    print("---------------- QUCSATOR FIN ----------------")

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

# def analyze(feedback_voltage, phase_shift):


def cost_function(x, desired_center_frequency, varactor_capacitance):
    print("Trying: ",x)

    frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(x, varactor_capacitance, net_file, data_file)


    feedback_voltage_peak_indices = find_peaks(feedback_voltage)[0]
    if(len(feedback_voltage_peak_indices) < 1):
        return 10.0

    fb_peak_values = feedback_voltage[feedback_voltage_peak_indices]
    sorted_indices = np.argsort(fb_peak_values)[::-1]
    fb_peak_values = fb_peak_values[sorted_indices]
    feedback_voltage_peak_indices = feedback_voltage_peak_indices[sorted_indices]

    fb_peak_frequencies = frequency[feedback_voltage_peak_indices]

    fb_peak_ratio = fb_peak_values[1]/fb_peak_values[0]

    phase_at_peak = phase_shift[feedback_voltage_peak_indices][0]

    Coeff1 = 1.0
    Coeff2 = 1.0
    Coeff3 = 0.5
    Coeff4 = 1.0

    frequency_cost = Coeff1 * (abs(desired_center_frequency-fb_peak_frequencies[0])/desired_center_frequency)
    phase_cost = Coeff2 * abs(1.0 - phase_at_peak)
    ratio_cost = Coeff3 * fb_peak_ratio
    insertion_loss_cost = (1.0 - fb_peak_values[0])*0.2

    cost = frequency_cost + phase_cost + fb_peak_ratio + insertion_loss_cost

    print("Cost: {:.4f} (frequency: {:.4f} MHz, phase: {:.4f}, ratio: {:.4f},  |FB|: {:.4f})".format(cost,fb_peak_frequencies[0]/1e6,
                                                                                                phase_at_peak, fb_peak_ratio, fb_peak_values[0]))

    return cost

initial_guess = [2.955, 0.45, 1, 0.17]
bounds = [(0.5,5),(0.1,5.0),(0.5,3),(0.1,10)]

initial_guess = [1,1,1,1,1,1,1]
bounds = [(0.1,10),(0.1,10),(0.1,10),(0.1,10),(0.1,10),(0.1,10),(0.1,10)]


# you may not like it, but this is the
# ideal_values = minimize(cost_function, [2.955, 0.45, 10, 0.17], bounds=bounds, method="Nelder-Mead", args=(6e9, 0.3), options={"disp":True, "maxiter":100})["x"]

desired_center_frequency = 6e9
varactor_capacitance = 0.3
minimizer_kwargs = dict(method="L-BFGS-B", bounds=bounds, args=(desired_center_frequency, varactor_capacitance), options={"disp":True, "maxiter":3})

ideal_values = basinhopping(cost_function, initial_guess, niter=6, minimizer_kwargs=minimizer_kwargs, disp=True, niter_success=5)["x"]
print("Solution: ", ideal_values)

cost_function(ideal_values, desired_center_frequency, varactor_capacitance)

frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(ideal_values, 0.3, net_file, data_file)

plt.figure()
plt.plot(frequency, phase_shift)
plt.figure()
plt.plot(frequency, feedback_voltage)
# plt.plot(frequency, output_amplitude)

plt.show()


# for i in np.linspace(0.05, 2, 10):
#     peak_freqs, peak_phases, peak_gains = freq_sweep([2.955, 0.45, 0.01, i])
#     print(min(peak_phases))
#
# const = 1.0
