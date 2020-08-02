import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppenwolf/host/')

import device_comms
import sweep
import numpy as np
from matplotlib import pyplot as plt


averages = 5

bin_width = 1000000
freqs = sweep.create_freq_bins(1, 12000, bin_width)



background = sweep.run_sweep(freqs, bin_width, 1, 6000, 30.0, 0)

# freqs, averaged_data = sweep.take_sample(freqs, averages, 1, 6000, bin_width, 30.0, 0)
#
# averaged_data -= background
#
# freqs, averaged_data = peak_detect(averaged_data, freqs)
#
#
# file = input("filename? > ")
# if file:
#     plt.savefig("../media/" + file + ".png")
#
plt.plot(freqs,background)
plt.show()
