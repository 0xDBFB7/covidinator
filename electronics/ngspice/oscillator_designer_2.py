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

import store

import ngspyce

source_file = 'oscillator.cir'

ngspyce.source(source_file)

def run_sim(varactor_voltage):

    ngspyce.cmd(f'alterparam varactor_bias_voltage = {varactor_voltage}')
    ngspyce.cmd('reset')
    ngspyce.cmd('tran 1p 100000ps uic')

    timesteps = ngspyce.vector('time')
    v_collector = ngspyce.vector('v(collector)')
    v_base = ngspyce.vector('v(Base)')
    varactor_bias = ngspyce.vector('v(Varbias)')

    stable_running_point = -1*len(v_collector)//3
    v_collector_trimmed = v_collector[stable_running_point:] # lots of noise on startup. we want to trim that out of the FFT.
    spectrum = np.fft.fft(v_collector_trimmed)
    spectrum_freqs = np.fft.fftfreq(len(v_collector_trimmed), d=(timesteps[-1]-timesteps[stable_running_point])/len(v_collector_trimmed))


    spectrum_begin_indice = np.abs(spectrum_freqs - 100e6).argmin()
    spectrum_end_indice = np.abs(spectrum_freqs - 20e9).argmin()
    fft_cleaned = spectrum[spectrum_begin_indice:spectrum_end_indice].clip(min=0)/ \
                        np.linalg.norm(spectrum[spectrum_begin_indice:spectrum_end_indice].clip(min=0))
    spectrum_freqs = spectrum_freqs[spectrum_begin_indice:spectrum_end_indice]

    return np.array(np.abs(fft_cleaned)), np.array(spectrum_freqs)

spectra = []
spectra_freqs = []

values = []
for v in np.linspace(0.1, 21, 1):
    spectrum, spectrum_freqs = run_sim(v)
    if(not spectra):
        spectra = spectrum.reshape(-1, 1)
    else:
        spectra = np.append( spectra, spectrum.reshape(-1, 1), axis=1)
    # spectra = np.append( np.array(spectra), spectrum, axis=0)
    # spectra_freqs = np.append( np.array(spectra_freqs), spectrum_freqs, axis=0)
    # values = np.append( np.array(values),  np.array([v]*len(spectrum)), axis=0)
    # print(spectra)

#
spectra = np.repeat(spectra, repeats=50, axis=1)
fig,(ax1) = plt.subplots(1,1)
ax1.imshow(np.transpose(spectra))
tick_num = 10
idx = np.round(np.linspace(0, len(spectra) - 1, tick_num)).astype(int)
ax1.set_xticks(idx)
ax1.set_xticklabels(["{:.2E}".format(i) for i in spectrum_freqs[idx]])

# np.savetxt("/tmp/data.csv", np.append(np.append(spectra_freqs.reshape(-1, 1), spectra.reshape(-1, 1), axis=1), values.reshape(-1, 1),axis=1) , delimiter=",",fmt='%10.5f')

#os.system('gnuplot plot.gpl')

# DC_REJECT = 10
# spectrum_indice = np.abs(freq - 20e9).argmin()
# plt.subplot(2,2,1)
# plt.title("Collector freq. spectrum")
# fft_cleaned = spectrum[DC_REJECT:spectrum_indice].clip(min=0)/np.linalg.norm(spectrum[DC_REJECT:spectrum_indice].clip(min=0))
# plt.plot(freq[DC_REJECT:spectrum_indice],fft_cleaned)
# plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
# plt.ylabel("mag")
# plt.xlabel("F (GHz)")
#
# plt.subplot(2,2,2)
# plt.ylabel("V")
# plt.xlabel("T (nanoseconds)")
# plt.plot(timesteps,v_collector, label="Collector voltage")
# plt.plot(timesteps,varactor_bias, label="Varactor voltage")
# plt.plot(timesteps,v_base, label="Base voltage")
# plt.ticklabel_format(style='sci', axis='x', scilimits=(-9,-9))
# plt.legend()

# plt.subplot(2,2,3)
# plt.title("ENHANCE collector waveform.")
# plt.ylabel("V")
# plt.xlabel("T (nanoseconds)")
# plt.plot(timesteps[-300:],v_collector[-300:])
#
plt.draw()
plt.pause(0.001)



spectrum_file = '/tmp/spectrum.svg'
source_file = 'oscillator_designer_2.py'
SPICE_file = 'oscillator.cir'
spectrum_3d = '/tmp/3d_spectrum.png'

plt.savefig(spectrum_file)

#save to lab notebook
files = [spectrum_file, source_file, SPICE_file, spectrum_3d]
store.ask(files)
