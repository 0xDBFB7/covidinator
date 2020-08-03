
from subprocess import Popen, PIPE, STDOUT, DEVNULL
import numpy as np
import math
from time import sleep
import functions
from scipy.signal import find_peaks
#do a https://numpy.org/doc/stable/reference/generated/numpy.correlate.html
# to determine VCO shift

def create_freq_bins(start_freq, end_freq, bin_width):
    '''
    start_freq, end_freq: freq in MHz.
    bin_width: FFT bin in Hz.
    '''
    N_points = int(((end_freq-start_freq)*1e6)/bin_width)

    freqs = np.linspace(start_freq*1e6, end_freq*1e6, N_points)

    return freqs

#pickle and save background?

def run_sweep(freqs, bin_width, start_freq, end_freq, lna_gain, vga_gain, samples_per_freq):
    '''
    start_freq, end_freq: freq in MHz.
    bin_width: FFT bin in Hz.
    gain_db: 0-40 dB. LNA and VGA are adjusted equally.
    samples_per_freq_multiplier:

    hackrf_sweep doesn't seem to be particularly deterministic;
    frequency ranges can be left out, the start of a sweep can happen anywhere, etc.
    '''

    start_indice = int((start_freq*1e6) / bin_width)
    end_indice = int((end_freq*1e6) / bin_width)
    # N_points = int(((end_freq-start_freq)*1e6)/len(freqs))

    # samples_per_freq = *(2**samples_per_freq_multiplier)

    # N_sweeps = (N_sweeps+1) * int(samples_per_freq/8192)
    #two sweeps are generally required to fill the entire spectrum.


    # freqs = np.zeros(N_sweeps*N_points)

    data = np.zeros_like(freqs)
    hits = np.zeros_like(freqs)

    N_sweeps = 2

    # lna_gain = 0 + int(float(gain_db)/8.0)*8
    # vga_gain = 0 + int(float((gain_db/40.0)*62.0)/2.0)*2
    command = 'hackrf_sweep -f {0}:{1} -a 0 -n{2} -w{3} -l {4} -g {5} -N{6}'.format(\
                        start_freq, end_freq, samples_per_freq, bin_width, lna_gain, vga_gain, N_sweeps)
    p = Popen(command, stdout = PIPE, shell = True)

    n = 0
    for line in p.stdout:
        try:
            new_input = np.array([float(i) for i in line.decode().split(',')[2:]])
            for i in range(0, (len(new_input))-4):
                freq = (new_input[0] + ((new_input[1] - new_input[0]) / (len(new_input)-4))*i)
                indice = np.abs(freqs - freq).argmin()
                val = new_input[i+4]
                if(not np.isnan(val) and np.isfinite(val)):
                    # hackrf_sweep does not seem to be totally deterministic.
                    # so we sort into bins.
                    data[indice] = val
                    hits[indice] = 1
                # else:
                #     data[indice] = 0
                #     hits[indice] = 0

            percent_hit = hits[start_indice:end_indice].sum() / (end_indice-start_indice)
            # if(percent_hit == 1.0):
            #     break

        except Exception as e:
            print(e)
            print(line)
            pass



    print(f"Hit {percent_hit*100.0}% of the requested frequencies.")
    return data

def remove_naughty(data):
    #set all naughty values to the average of the neighboring values.
    noise_floor = np.mean(data[np.logical_not(naughty)])
    # data[naughty] = (data[np.roll(naughty,1)] + data[np.roll(naughty,-1)])/2
    # naughty = np.logical_or(np.isnan(data), np.isinf(data))
    data[naughty] = noise_floor
    return data

def peak_detect(data, freqs):

    # peak_indices = data.argsort()[-3:][::-1]
    # peak_freqs = freqs[peak_indices]
    # peak_values = data[peak_indices]
    naughty = np.logical_or(np.isnan(data), np.isinf(data))

    peak_indices = find_peaks(data[np.logical_not(naughty)])[0]
    peak_indices = (peak_indices[np.argsort(data[peak_indices])])[::-1]
    peak_freqs = freqs[peak_indices]
    peak_values = data[peak_indices]

    return peak_freqs, peak_values

# def peak_detect(data, freqs, peak_interval=50):
#     peaks_data = np.array([max(data[i:i+peak_interval]) for i in range(0, len(data), peak_interval)])
#     peaks_freqs = [freqs[i] for i in range(0, len(data), peak_interval)]
#     return peaks_freqs, peaks_data




# def take_sample(freqs, averages, *args, **kwargs):
#     averaged_data = np.zeros(0)
#
#     for i in range(0,averages):
#         x, data = run_sweep(*args, **kwargs)
#         if(not len(averaged_data)):
#             averaged_data = data
#         if(not len(freqs)):
#             freqs = x
#         else:
#             averaged_data[np.where(np.isin(x,freqs))] += data[np.where(np.isin(x,freqs))]
#
#     averaged_data /= averages
#
#     return freqs, averaged_data
