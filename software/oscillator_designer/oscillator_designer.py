import qucs.extract
from time import sleep
import numpy as np
from scipy.signal import cheby1
from scipy.signal import find_peaks
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.optimize import minimize,basinhopping
import time
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


schematic_file = "/home/arthurdent/Projects/covidinator/electronics/qucs/optimize/optimize_filter_1.sch"
net_file = "/mnt/qucs-tmpfs/tmp.net"
net_file_modified = "/mnt/qucs-tmpfs/mod.net"
data_file = "/mnt/qucs-tmpfs/output.dat"

os.system("QUCSDIR=/usr/local/ /usr/local/bin/qucs -n -i " + schematic_file + " -o " + net_file)

np.set_printoptions(precision=4)

def electrical_to_physical_length(electrical_len, trace_width, frequency):
    return (effective_wavelength(trace_width, substrate_height, substrate_dielectric_constant, frequency) \
                            * (electrical_len/(2.0*pi)))



def run_sim(x, net_file, data_file):

#     electrical_length_ratio = 0.625

#     electrical_length_beta = - (electrical_length_alpha*electrical_length_ratio/(electrical_length_ratio-1.0))

#     length_1 = electrical_to_physical_length(electrical_length_alpha, width_1, center_frequency)
#     length_2 = electrical_to_physical_length(electrical_length_beta, width_2, center_frequency)

#     print("Trying lengths: {:.4f} rad ({:.4f} m) | {:.4f} rad ({:.4f} m) ".format(electrical_length_alpha, length_1, beta, length_2))

    with open(net_file, 'r') as file:
      netlist = file.read()

    scale_factors = np.ones_like(x)
    scale_factors[0] *= 10.0

    for i in range(0,len(x)):
        netlist = netlist.replace('var_'+str(i), str(x[i]*scale_factors[i]))

    with open(net_file_modified, 'w') as file:
        file.write(netlist)

    print("---------------- QUCSATOR RUN ----------------")
    sim_return = subprocess.run(['qucsator', '-i', net_file_modified, '-o', data_file], stdout = subprocess.DEVNULL,  check=True)
    print("---------------- QUCSATOR FIN ----------------")

    extracted_data = qucs.extract.load_data(data_file)

    feedback_voltage = np.array([abs(i) for i in extracted_data.__dict__["Vfb_v"]])

    return np.array(extracted_data.__dict__["acfrequency"]), feedback_voltage, np.array(extracted_data.__dict__["phase_shift"]),\
                            np.array(extracted_data.__dict__["Vout_v"])




#parasitic inductance can vary as required to build the varactor biasing circuit from discretes

# def capacitor_costs(x, coefficient):
#     capacitor_indices = [1, 4] #
#     return coefficient * sum([i % 0.5 for i in x[capacitor_values]]) # distance from nearest 0.5


def cost_function(x, retained_values, retained_indices, desired_center_frequency, display = False):
    start = time.time()
    x[retained_indices] = retained_values[retained_indices]

    print("Trying: ", x)

    frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(x, net_file, data_file)

    # feedback_voltage_peak_indices = find_peaks(feedback_voltage)[0]
    # if(len(feedback_voltage_peak_indices) < 1):
    #     print("No peaks found, cost = 10")
    #     return 10.0
    #
    # fb_peak_values = feedback_voltage[feedback_voltage_peak_indices]
    # sorted_indices = np.argsort(fb_peak_values)[::-1]
    # fb_peak_values = fb_peak_values[sorted_indices]
    # feedback_voltage_peak_indices = feedback_voltage_peak_indices[sorted_indices]
    #
    # fb_peak_frequencies = frequency[feedback_voltage_peak_indices]
    #
    # if(len(feedback_voltage_peak_indices) > 1):
    #     fb_peak_ratio = fb_peak_values[1]/fb_peak_values[0]
    # else:
    #     fb_peak_ratio = 0.1
    #
    # phase_at_peak = phase_shift[feedback_voltage_peak_indices][0]

    # freq_coeff = 1
    # phase_coeff = 1.5
    # ratio_coeff = 0.5
    # insertion_loss_coeff = 0.2
    #
    # frequency_cost = freq_coeff * (abs(desired_center_frequency-fb_peak_frequencies[0])/1e9)
    # phase_cost = phase_coeff * abs(1.0 - phase_at_peak)
    # ratio_cost = ratio_coeff * fb_peak_ratio
    # insertion_loss_cost = (1.0 - fb_peak_values[0])*insertion_loss_coeff


    # cost = frequency_cost + phase_cost + fb_peak_ratio + insertion_loss_cost

    cost = abs(1.0 - phase_shift[np.abs(frequency-desired_center_frequency).argmin()]) + \
                                1.0/(feedback_voltage[np.abs(frequency-desired_center_frequency).argmin()])
    #
    # end = time.time()
    # if(display):
    #     print("Cost: {:.4f} (frequency: {:.4f} MHz ({:.4f} MHz desired), phase: {:.4f}, ratio: {:.4f},  |FB|: {:.4f}), took {:.4f} ms"
    #                                                                                     .format(cost,fb_peak_frequencies[0]/1e6,
    #                                                                                             desired_center_frequency/1e6,
    #                                                                                             phase_at_peak,
    #                                                                                             fb_peak_ratio, fb_peak_values[0],
    #                                                                                             (end - start)*1000.0))
    # else:
    #     print("Cost: ", cost)

    return cost

#
# def sweep_cost(x, desired_frequency_range, varactor_capacitance_range):
#
#     os.system('clear')
#     # sys.stdout.flush()
#
#     total_cost = 0
#
#     # add "distance from standard value" cost!
#
#     for i in range(0, len(varactor_capacitance_range)):
#         total_cost += cost_function(x, desired_frequency_range[i], varactor_capacitance_range[i])
#         sys.stdout.flush()
#
#     print("\n")
#     # sys.stdout.flush()
#
#     return total_cost


def optimize(bounds, initial_guess, retained_values, retained_indices, desired_frequency, stochastic_iterations = 7, gradient_iterations = 4, polish_iterations = 10):
    args = (retained_values, retained_indices, desired_frequency)

    minimizer_kwargs = dict(method="L-BFGS-B", bounds=bounds, args=args, options={"disp":True, "maxiter":gradient_iterations})

    tubthumper = basinhopping
    ideal_values = tubthumper(cost_function, initial_guess, niter=stochastic_iterations, minimizer_kwargs=minimizer_kwargs, disp=True, niter_success=5)["x"]
    # you may not like it, but this is the ideal

    #then polish
    ideal_values = minimize(cost_function, ideal_values, bounds=bounds, method="L-BFGS-B", args=args, options={"disp":True, "maxiter":polish_iterations})["x"]


    return ideal_values


# could also run two sims at extremes and average retained inductance values


num_vars = 3
initial_guess = [1]*num_vars
bounds = [(0.2,10)]*num_vars

bounds[1] = (0.3,2) #SMV2019
# bounds[3] = (0.3,2)
# bounds[5] = (0.3,2)

# bounds[6] = (0.3,2)
# bounds[7] = (0.3,2)

# initial_guess[4] = 0.2
# initial_guess[3] = 0.2

#
# retained_values = np.array([])
# retained_indices = []
#
# frequency_sweep = [10e9,9e9,8e9,7e9]
#
# ideal_values = [[]]*len(frequency_sweep)
# ideal_values[0] = initial_guess
# ideal_values.append(initial_guess)

# import cProfile
# cProfile.run('optimize(bounds, initial_guess, retained_values, retained_indices, frequency_sweep[0]     )')
# 28 s in load_data,
# 53 s in qucs,

# for i in range(0, len(frequency_sweep)):
#     ideal_values[i] = (optimize(bounds, initial_guess, retained_values, retained_indices, frequency_sweep[i]))
#
#     ideal_values[i] = np.array(np.round(ideal_values[i],1))

    # retained_values = ideal_values[i]
    # retained_indices = np.array([0,2])

##Sweep all varactor values, determine points with minimum distance to ideal frequency,

# ideal_values[0] = np.array([0.2, 0.3, 0.9, 1.3, 0.6, 0.3, 1. ])
#
# ideal_values[1] = np.array([0.2, 0.4, 0.9, 0.6, 0.6, 0.9, 1. ])
#
# print(ideal_values)
#
# # print('='*40)
# # print("Solution: ", ideal_value)
# # print('='*40)`
#
# frequencies = []
# phase_shifts = []
#
varactor_values = []
#
# N_interpolations = 2
#
#
# fig, ax1 = plt.subplots()
# ax2 = ax1.twinx()
# for i in range(0, len(frequency_sweep)):
#     # freq = desired_frequency_range[0] + ((desired_frequency_range[-1]-desired_frequency_range[0])/N_interpolations)*i
#     # varactor_capacitance = varactor_capacitance_range[0] + ((varactor_capacitance_range[-1]-varactor_capacitance_range[0])/N_interpolations)*i
#     # varactor_values.append(varactor_capacitance)
#     # print(varactor_capacitance)
#
#     ideal_value = ideal_values[i]
#
#     cost_function(ideal_value, retained_values, retained_indices, frequency_sweep[i], display = True)
#
#     frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(ideal_value, net_file, data_file)
#     # np.concatenate([frequency,frequencies])
#     np.concatenate([phase_shift,phase_shifts])
#
#     # np.concatenate([[varactor_capacitance]*len(phase_shift),varactor_values])
#     #plt.subplot(2, 1, 1, projection='3d')
#     # plt.subplot(2, 1, 1)
#     # plt.title("Phase shift (factor of 360 deg, including active device)")
#
#     ax1.plot(frequency, phase_shift)
#     # plt.xlabel("frequency")
#     # plt.subplot(2, 1, 2)
#     # plt.title("Feedback voltage")
#     # plt.xlabel("frequency")
#     ax2.plot(frequency, feedback_voltage)



retained_values = np.array([])
retained_indices = []
# fig, ax1 = plt.subplots()
# ax2 = ax1.twinx()

high_resistance = 500.0
low_resistance = 10.0

vfb = []
freq = []
code = []
for i in range(0, 2**3):

    values = np.zeros(9)
    # values[2] = 0.5

    binary_code = [float(i) for i in list(bin(i)[2:])]
    binary_code = [0]*(3-len(binary_code))+binary_code
    binary_code = binary_code[::-1]
    binary_code = np.array(binary_code)
    values[3::2] = high_resistance - (binary_code*(high_resistance-low_resistance))
    values[4::2] = low_resistance + (binary_code*(high_resistance-low_resistance))
    values[1] = 0.3
    frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(values, net_file, data_file)

    plt.subplot(4,2,1)
    plt.title("Phase shift")
    plt.plot(frequency, phase_shift)
    plt.subplot(4,2,2)
    plt.title("Feedback voltage")
    plt.plot(frequency, feedback_voltage)

    values[1] = 2
    frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(values, net_file, data_file)

    plt.subplot(4,2,1)
    plt.title("Phase shift")
    plt.plot(frequency, phase_shift)
    plt.subplot(4,2,2)
    plt.title("Feedback voltage")
    plt.plot(frequency, feedback_voltage)


    for v in np.geomspace(0.31, 2, 10):
        values[1] = v

        # cost_function(values, retained_values, retained_indices, frequency_sweep[i], display = True)
        frequency, feedback_voltage, phase_shift, output_amplitude = run_sim(values, net_file, data_file)
        # np.concatenate([frequency,frequencies])
        # np.concatenate([phase_shift,phase_shifts])



        vfb.append(feedback_voltage[np.abs(phase_shift-1.0).argmin()])
        freq.append(frequency[np.abs(phase_shift-1.0).argmin()])
        code.append(i)
        varactor_values.append(v)


# ax1.plot([0,frequency[-1]], [1,1], 'k-', lw=2) # line at phase = 1

# ax1.plot(vfb)
# ax2.plot(freq)

plt.subplot(4,2,3)
plt.plot(range(0,len(vfb)),vfb)
plt.title("Feedback voltage")
plt.subplot(4,2,4)
plt.plot(np.array(freq)[np.array(vfb) > 0.1])
plt.title("Frequency sweep")
plt.subplot(4,2,5)
plt.title("PIN switch values")
plt.plot(code)
plt.plot(varactor_values)


plt.savefig("/home/arthurdent/Downloads/export.png")
plt.show()

# for i in np.linspace(0.05, 2, 10):
#     peak_freqs, peak_phases, peak_gains = freq_sweep([2.955, 0.45, 0.01, i])
#     print(min(peak_phases))
#
# const = 1.0
