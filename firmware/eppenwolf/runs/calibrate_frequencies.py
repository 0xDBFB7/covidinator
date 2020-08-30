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

with serial.Serial('/dev/ttyUSB1', 115200, timeout=30) as ser:
    while(True):
        voltage = ser.readline().decode().split(',')[0]
        bin_width = 5000000
        freqs = sweep.create_freq_bins(1, 2000, bin_width)

        # freq_slice = slice(np.abs(freqs - 6e9).argmin(),np.abs(freqs - 7e9).argmin())

        hackrf_sweep = sweep.run_sweep(freqs, bin_width, 0, 2000, 40, 0, 8192)

        peak_freqs, peak_values, peak_indices = sweep.peak_detect(hackrf_sweep, freqs)
        print(voltage, ',', peak_freqs[0]*8.0)
        # LO_bleedthrough_power = peak_values[0]
        # LO_index = np.abs(freqs - LO_freq).argmin()
