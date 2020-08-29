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

with serial.Serial(sys.argv[1], 115200, timeout=5) as ser:
    bin_width = 5000000
    freqs = sweep.create_freq_bins(1, 2000, bin_width)


    freq_slice = slice(np.abs(freqs - 6e9).argmin(),np.abs(freqs - 7e9).argmin())


    hackrf_sweep = sweep.run_sweep(freqs, bin_width, 0, 2000, 40, 0, 8192)

    peak_freqs, peak_values, peak_indices = sweep.peak_detect(hackrf_sweep[freq_slice], freqs[freq_slice])
    LO_freq = peak_freqs[0]
    LO_bleedthrough_power = peak_values[0]
    LO_index = np.abs(freqs - LO_freq).argmin()

    if(LO_bleedthrough_power < 15):
        print("Warning: LO not active. Reset HackRF and try again.")

    print(LO_freq)
    print(peak_freqs[0:5])
    print(peak_values[0:5])
