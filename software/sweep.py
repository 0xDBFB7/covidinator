
from matplotlib import pyplot as plt
from subprocess import Popen, PIPE, STDOUT
import numpy as np
import math
from time import sleep

def run_sweep(start_freq, end_freq, bin_width, gain_db, samples_per_freq_multiplier, N_sweeps=1, LO_freq=0.0):
    '''
    start_freq, end_freq: freq in MHz.
    bin_width: FFT bin in Hz.
    gain_db: 0-40 dB. LNA and VGA are adjusted equally.
    samples_per_freq_multiplier:

    '''

    N_points = int(((end_freq-start_freq)*1e6)/bin_width)

    samples_per_freq = 8192*(2**samples_per_freq_multiplier)

    N_sweeps = (N_sweeps+1) * int(samples_per_freq/8192)
    #two sweeps are generally required to fill the entire spectrum.


    freqs = np.zeros(N_sweeps*N_points)
    data = np.zeros(N_sweeps*N_points)


    lna_gain = 0 + int(float(gain_db)/8.0)*8
    vga_gain = 0 + int(float((gain_db/40.0)*62.0)/2.0)*2
    command = 'hackrf_sweep -f {0}:{1} -a 0 -n{2} -w{3} -l {4} -g {5} -N{6}'.format(\
                        start_freq, end_freq, samples_per_freq, bin_width, lna_gain, vga_gain, N_sweeps)
    p = Popen(command, stdout = PIPE, shell = True)

    n = 0
    for line in p.stdout:
        try:
            new_input = np.array([float(i) for i in line.decode().split(',')[2:]])
            for i in range(0, (len(new_input))-4):
                freq = (new_input[0] + ((new_input[1] - new_input[0]) / (len(new_input)-4))*i) + LO_freq
                data[n] = new_input[i+4]
                freqs[n] = freq #lines are often out of order.
                n+=1
        except Exception as e:
            print(e)
            print(line)
            pass

    data = data[freqs.argsort()]
    freqs = freqs[freqs.argsort()]

    _, indices = np.unique(freqs, return_index=True)
    print(len(freqs))

    data = data[indices]
    freqs = freqs[indices]

    print(len(freqs))

    return freqs, data


peak_interval = 20

averaged_data = np.zeros()
freqs = np.zeros()

for i in range(0,5):
    x, data = run_sweep(1, 6000, 10000, 30.0, 0)
    if(not averaged_data):
        averaged_data = data
        freqs = x
    else:
            averaged_data += np.argwhere(x)

    # peaks_data = np.array([max(data[i:i+peak_interval]) for i in range(0, len(data), peak_interval)])
    # peaks_freqs = [x[i] for i in range(0, len(data), peak_interval)]


print(data)
# plt.plot(x,data)
plt.plot(peaks_freqs,peaks_data)
plt.show()
