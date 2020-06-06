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


timesteps = ngspyce.vector('time')
v_collector = ngspyce.vector('v(collector)')
v_base = ngspyce.vector('v(Base)')
varactor_bias = ngspyce.vector('v(Varbias)')

stable_running_point = -1*len(v_collector)//3
v_collector_trimmed = v_collector[stable_running_point:] # lots of noise on startup.
spectrum = np.fft.fft(v_collector_trimmed)
freq = np.fft.fftfreq(len(v_collector_trimmed), d=(timesteps[-1]-timesteps[stable_running_point])/len(v_collector_trimmed))

DC_REJECT = 10
spectrum_indice = np.abs(freq - 20e9).argmin()
plt.subplot(2,2,1)
plt.title("Collector freq. spectrum")
fft_cleaned = spectrum[DC_REJECT:spectrum_indice].clip(min=0)/np.linalg.norm(spectrum[DC_REJECT:spectrum_indice].clip(min=0))
plt.plot(freq[DC_REJECT:spectrum_indice],fft_cleaned)
plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
plt.ylabel("mag")
plt.xlabel("F (GHz)")

plt.subplot(2,2,2)
plt.ylabel("V")
plt.xlabel("T (nanoseconds)")
plt.plot(timesteps,v_collector, label="Collector voltage")
plt.plot(timesteps,varactor_bias, label="Varactor voltage")
plt.plot(timesteps,v_base, label="Base voltage")
plt.ticklabel_format(style='sci', axis='x', scilimits=(-9,-9))
plt.legend()


plt.subplot(2,2,3)
plt.title("ENHANCE collector waveform.")
plt.ylabel("V")
plt.xlabel("T (nanoseconds)")
plt.plot(timesteps[-300:],v_collector[-300:])

plt.draw()
plt.pause(0.001)

# numpy.savetxt("foo.csv", a, delimiter=",",fmt='%10.5f')


spectrum_file = '/tmp/spectrum.svg'
source_file = 'oscillator_designer_2.py'
SPICE_file = 'oscillator.cir'

plt.savefig(spectrum_file)

files = [spectrum_file, source_file, SPICE_file]
store.ask(files)
