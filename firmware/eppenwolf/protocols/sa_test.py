import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppenwolf/host/')

import device_comms
import sweep
import numpy as np
from matplotlib import pyplot as plt
from functions import *
from time import sleep
link = device_comms.connect()
import dill

averages = 5

#this could be put into gnuradio as an embedded python block; however,
# I don't much feel like doing that.

bin_width = 5000000
freqs = sweep.create_freq_bins(1, 12000, bin_width)
v = 0

downconverter_max = 4e9
DC_IF_gap = 0.5e8

VCO_voltage = 3
VCO_supply_voltage = 10
VCO_base_voltage = 3

spectrum = np.zeros_like(freqs)


for b in range(0, 1):

    background = np.zeros_like(freqs)
    LO = np.zeros_like(freqs)
    low_range = np.zeros_like(freqs)
    high_range = np.zeros_like(freqs)

    averages = 2

    set_VCO(link, VCO_base_voltage, VCO_voltage, VCO_supply_voltage, 0)

    for i in range(0, averages):
        LO_power(link, 0)
        LO_tune(link, 0.35)
        sleep(0.2)
        background += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

        LO_power(link, 1)
        sleep(0.2)
        LO += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

    background /= averages
    LO /= averages
    LO -= background

    freq_slice = slice(np.abs(freqs - 6e9).argmin(),np.abs(freqs - 7e9).argmin())

    peak_freqs, peak_values, peak_indices = sweep.peak_detect(LO[freq_slice], freqs[freq_slice])
    LO_freq = peak_freqs[0]
    LO_bleedthrough_power = peak_values[0]
    LO_index = np.abs(freqs - LO_freq).argmin()

    if(LO_bleedthrough_power < 15):
        print("Warning: LO not active. Reset HackRF and try again.")

    print(LO_freq)
    print(peak_freqs[0:5])
    print(peak_values[0:5])

    set_VCO(link, VCO_base_voltage, VCO_voltage, VCO_supply_voltage, 1)
    sleep(0.5)
    for i in range(0, averages):
        high_range += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

    high_range /= averages
    high_range -= background
    high_range -= LO

    high_range[int(DC_IF_gap/bin_width):0] = 0
    high_range[int((downconverter_max) / bin_width):-1] = 0
    high_range = np.roll(high_range, LO_index)
    high_range[0:LO_index] = 0

    LO_power(link, 0)
    set_VCO(link, VCO_base_voltage, VCO_voltage, VCO_supply_voltage, 1)
    sleep(0.5)
    for i in range(0, averages):
        low_range += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

    low_range /= averages
    low_range -= background

    spectrum += (high_range + low_range)

    LO_power(link, 0)
    set_VCO(link, VCO_base_voltage, VCO_voltage, VCO_supply_voltage, 0)

    # plt.figure(0)
    # plt.clf()
    # plt.plot(freqs,LO)
    # plt.figure(1)
    # plt.clf()
    # # plt.plot(freqs,low_range)
    # # plt.plot(freqs,high_range)
    # plt.draw()
    # plt.pause(0.01)

spectrum /= 1

# dill.dump_session('globalsave.pkl')

plt.plot(freqs, spectrum)
plt.show()
