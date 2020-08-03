import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppenwolf/host/')

import device_comms
import sweep
import numpy as np
from matplotlib import pyplot as plt
from functions import *
from time import sleep
link = device_comms.connect()

averages = 5

#this could be put into gnuradio as an embedded python block; however,
# I don't much feel like doing that.

bin_width = 5000000
freqs = sweep.create_freq_bins(1, 12000, bin_width)
v = 0
while(True):

    background = np.zeros_like(freqs)
    LO = np.zeros_like(freqs)
    VCO = np.zeros_like(freqs)

    averages = 2

    set_VCO(link, 1.2, 5, 5, 0)

    for i in range(0, averages):
        LO_power(link, 0)
        LO_tune(link, 0.4)
        # set_VCO(link, 5, v, 8, 0)
        sleep(0.5)
        background += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)


        LO_power(link, 1)
        # set_VCO(link, 5, v, 8, 1)
        sleep(0.5)
        LO += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

    background /= averages
    LO /= averages
    LO -= background

    freq_slice = slice(np.abs(freqs - 6e9).argmin(),np.abs(freqs - 7e9).argmin())

    peak_freqs, peak_values = sweep.peak_detect(LO[freq_slice], freqs)
    LO_freq = peak_freqs[0]
    LO_index = np.where(LO == peak_values[0])[0]


    print(LO_freq)
    # print(peak_freqs[0:5])
    # print(peak_values[0:5])


    for i in range(0, averages):
        set_VCO(link, 1.2, 5, 5, 1)
        sleep(0.5)
        VCO += sweep.run_sweep(freqs, bin_width, 0, 7250, 40, 0, 8192)

    VCO /= averages
    VCO -= background
    VCO -= LO
    VCO = np.roll(VCO, LO_index)

    v += 2

    LO_power(link, 0)
    set_VCO(link, 1.2, 5, 5, 0)

    plt.clf()
    plt.figure(0)
    plt.plot(freqs,LO)
    plt.figure(1)
    plt.plot(freqs,VCO)
    plt.draw()
    plt.pause(0.01)
