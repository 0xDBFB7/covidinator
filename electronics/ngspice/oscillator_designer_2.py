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
from matplotlib.colors import SymLogNorm

#include store.py
import sys
sys.path.append('/home/arthurdent/covidinator/electronics/')
import store

import ngspyce

source_file = 'oscillator.cir'

ngspyce.source(source_file)

def run_sim(varactor_voltage):

    ngspyce.cmd(f'alterparam varactor_bias_voltage = {varactor_voltage}')
    ngspyce.cmd('reset')
    # ngspyce.cmd('stop after 10000')
    step_ps = 1 #not always obeyed - ngspice sets its own timestep.
    sim_duration = 300000
    n_steps = sim_duration/step_ps
    # ngspyce.cmd(" ")
    ngspyce.cmd(f'tran {step_ps}p {sim_duration}ps uic')

    timesteps = ngspyce.vector('time')
    v_collector = ngspyce.vector('v(E1)')
    v_base = ngspyce.vector('v(Base)')
    varactor_bias = ngspyce.vector('v(Vvaractor)')
    output = ngspyce.vector('v(output)')

    stable_running_point = -1*len(v_collector)//3
    v_collector_trimmed = v_collector[stable_running_point:] # lots of noise on startup. we want to trim that out of the FFT.
    spectrum = np.fft.fft(v_collector_trimmed)
    spectrum_freqs = np.fft.fftfreq(len(v_collector_trimmed), d=(timesteps[-1]-timesteps[stable_running_point])/len(v_collector_trimmed))

    spectrum_begin_indice = np.abs(spectrum_freqs - 100e6).argmin()
    spectrum_end_indice = np.abs(spectrum_freqs - 25e9).argmin()
    #normalize
    spectrum_norm = np.linalg.norm(spectrum[spectrum_begin_indice:spectrum_end_indice].clip(min=0))
    if(spectrum_norm):
        fft_cleaned = spectrum[spectrum_begin_indice:spectrum_end_indice].clip(min=0)/spectrum_norm
    else:
        fft_cleaned = np.zeros_like(spectrum[spectrum_begin_indice:spectrum_end_indice])
    spectrum_freqs = spectrum_freqs[spectrum_begin_indice:spectrum_end_indice]

    fft_cleaned = fft_cleaned[:int(600)] # trim all spectra to the same length 2ps,800, 5ps, 600
    spectrum_freqs = spectrum_freqs[:int(600)]
    return [np.array(np.abs(fft_cleaned)), np.array(spectrum_freqs), timesteps, v_collector, v_base, varactor_bias, output]

spectra = []
values = []

# values = []

# NUM_SPECTRA = 30
NUM_SPECTRA = 2

for i,v in enumerate(np.linspace(0, 20, NUM_SPECTRA)):
    values.append(run_sim(v))
    spectrum = values[i][0]
    if(not len(spectra)):
        spectra = spectrum.reshape(-1, 1)
    else:
        spectra = np.append(spectra, spectrum.reshape(-1, 1), axis=1)
    # spectra = np.append( np.array(spectra), spectrum, axis=0)
    # spectra_freqs = np.append( np.array(spectra_freqs), spectrum_freqs, axis=0)
    # values = np.append( np.array(values),  np.array([v]*len(spectrum)), axis=0)
    # print(spectra)

#

spectrum_freqs = values[0][1]
spectra = np.repeat(spectra, repeats=20, axis=1) # make each slice wide enough to be visible
fig,(ax1) = plt.subplots(1,1)
ax1.imshow(np.transpose(spectra), norm=SymLogNorm(0.1))
tick_num = 10
idx = np.round(np.linspace(0, len(spectra) - 1, tick_num)).astype(int)
plt.title("Collector freq. waterfall against varactor voltage")
ax1.set_xticks(idx)
ax1.set_xticklabels(["{:1.1f}e9".format(i/1.0e9) for i in spectrum_freqs[idx]])
# ax1.set_yticks(idx)
ax1.set_yticklabels(["{:1.1f}".format(i) for i in values[0][:][5]])
plt.draw()
plt.pause(0.001)
# np.savetxt("/tmp/data.csv", np.append(np.append(spectra_freqs.reshape(-1, 1), spectra.reshape(-1, 1), axis=1), values.reshape(-1, 1),axis=1) , delimiter=",",fmt='%10.5f')
#os.system('gnuplot plot.gpl')
fig.savefig('/tmp/spectrum.svg')


plt.figure()
for i in values[0], values[-1]:
    spectrum = i[0]
    spectrum_freqs = i[1]

    plt.subplot(2,2,1)
    plt.title("Collector freq. spectrum")
    plt.plot(spectrum_freqs,spectrum)
    plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
    plt.ylabel("mag")
    plt.xlabel("F (GHz)")

    plt.subplot(2,2,2)
    plt.title("Collector freq. spectrum")
    plt.ylabel("V")
    plt.xlabel("T (nanoseconds)")
    plt.plot(i[2],i[3], label="Collector voltage")
    plt.plot(i[2],i[5], label="Varactor voltage")
    plt.plot(i[2],i[4], label="Base voltage")
    plt.ticklabel_format(style='sci', axis='x', scilimits=(-9,-9))
    plt.legend()

    plt.subplot(2,2,3)
    plt.title("ENHANCE collector waveform.")
    plt.ylabel("V")
    plt.xlabel("T (nanoseconds)")
    plt.plot(i[2][-300:],i[3][-300:])
    print(np.max(i[6][-1*(len(i[6])//3):]))#voutput
    print(np.min(i[6][-1*(len(i[6])//3):]))
    print(np.max(i[3][-300:]))
    print(np.min(i[3][-300:]))#vcollector
    plt.draw()
    plt.pause(0.001)




plt.savefig('/tmp/plots.svg')

for i in values:
    #https://www.rfcafe.com/references/electrical/pwr2volts.htm
    avg_voltage = np.mean(i[6][-1*(len(i[6])//3):])
    rms_voltage = np.sqrt(np.mean((i[6][-1*(len(i[6])//3):] - avg_voltage)**2.0))
    rms_output_power = np.sqrt(rms_voltage)**2.0 / 50.0
    print("V, P: ",rms_voltage, rms_output_power)

spectrum_file = '/tmp/spectrum.svg'
plot_file = '/tmp/plots.svg'

source_file = 'oscillator_designer_2.py'
SPICE_file = 'oscillator.cir'
# spectrum_3d = '/tmp/3d_spectrum.png'


#save to lab notebook
files = [spectrum_file, source_file, SPICE_file, plot_file]
store.ask(files)
