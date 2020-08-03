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

bin_width = 5000000
freqs = sweep.create_freq_bins(1, 12000, bin_width)
v = 0
while(True):

    background = np.zeros_like(freqs)
    LO = np.zeros_like(freqs)

    averages = 2

    for i in range(0, averages):
        LO_power(link, 0)
        LO_tune(link, 0.4)
        # set_VCO(link, 5, v, 8, 0)
        sleep(0.5)
        background += sweep.run_sweep(freqs, bin_width, 4000, 7250, 40, 0, 8192)

        LO_power(link, 1)
        # set_VCO(link, 5, v, 8, 1)
        sleep(0.5)
        LO += sweep.run_sweep(freqs, bin_width, 4000, 7250, 40, 0, 8192)

    background /= averages
    LO /= averages
    LO -= background


    peak_freqs, peak_values = sweep.peak_detect(LO, freqs)
    print(peak_freqs[0:5])
    print(peak_values[0:5])

    v += 2

    LO_power(link, 0)

    plt.clf()
    plt.plot(freqs,LO)
    plt.draw()
    plt.pause(0.01)
