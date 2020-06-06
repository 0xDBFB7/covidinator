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
v_collector= ngspyce.vector('v(collector)')
print(v_collector)
spectrum = np.fft.fft(v_collector)
freq = np.fft.fftfreq(len(v_collector), d=(timesteps[-1]-timesteps[0])/len(v_collector))

# plt.plot(v_collector)
DC_REJECT = 10
spectrum_indice = np.abs(freq - 20e9).argmin()
plt.subplot(2,1,1)
fft_cleaned = spectrum[DC_REJECT:spectrum_indice].clip(min=0)/np.linalg.norm(spectrum[DC_REJECT:spectrum_indice].clip(min=0))
plt.plot(freq[DC_REJECT:spectrum_indice],fft_cleaned)
plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
plt.subplot(2,1,2)
plt.plot(timesteps,v_collector)
plt.draw()
plt.pause(0.001)


spectrum_file = '/tmp/spectrum.png'
source_file = 'oscillator_designer_2.py'
SPICE_file = 'oscillator.cir'

plt.savefig(spectrum_file)

files = [spectrum_file, source_file, SPICE_file]
store.ask(files)
