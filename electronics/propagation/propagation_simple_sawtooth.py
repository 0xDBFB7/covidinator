from math import sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
from scipy.signal import sawtooth
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth
from mpl_toolkits.mplot3d import Axes3D
from scipy.optimize import minimize, basinhopping
from fdtd_PCB_extensions.tissue import cole_cole_4, get_tissue_cole_cole_coefficients
import pickle
import dill
import sys
from fdtd_PCB_extensions import X,Y,Z, normalized_gaussian_pulse, normalized_gaussian_derivative_pulse
import os

import sys
sys.path.append('/home/arthurdent/covidinator/electronics/')
import store

# rm pretty_output_*.csv && python propagation_simple_sawtooth.py && gnuplot plot_spectrum.plt

muscle_id = 48
lung_id = 41
#cole-cole refractive index
ef, sigma, deltas, alphas, taus = get_tissue_cole_cole_coefficients(muscle_id)
c0 = 3e8


#     '''
#     See "Compilation of the dielectric properties of body tissues at RF and microwave frequencies.", Gabriel 1996
#     Equation 3, page 12.
#     '''

def normalized_gaussian_pulse(t,fwhm):
    #todo: replace the versions in sources.py with this class-agnostic and np version.
    sigma = fwhm/2.355
    return np.exp(-((t**2.0)/(2.0*(sigma**2.0))))

def propagate(F, n, omega, z, oscillator=True):

    frequency_domain = np.fft.fft(F)


    #filter
    # frequency_domain[(omega/(2.0*pi)) < 1e9] = 0
    frequency_domain[(omega/(2.0*pi)) > 300e9] = 0


    propagated = frequency_domain * np.exp(-1j*(omega/c0)*n*z)
    # watch the sign here - fix if needed

    return np.fft.ifft(propagated)



sf = 30e9 * 2 * pi

duration = 30e-10
samples = int(np.ceil(duration * sf * 2.0 * 5.0))
times = np.linspace(-duration,duration,samples)

F=np.ones(samples)
omega = 2*pi*np.fft.fftfreq(samples)*(samples/(duration*2))
print(f"Samples: {samples} | < 1e10: {np.count_nonzero(omega < 1e10)}")

x = [sf]
s = np.array(x)
correction_speed = np.sqrt(cole_cole_4(s/(2.0*pi), ef, sigma, deltas, alphas, taus))*c0

n = np.sqrt(cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)) #precompute cole-cole refractive index
n[omega == 0] = 1

# F[len(F)//2:-1] = 0

# F = sawtooth(times*f)

# output = propagate(F, omega, z)

os.system("rm pretty_output_*.csv")


#"method": "Nelder-Mead",
# output = basinhopping(cost_function, F, minimizer_kwargs={"args":(omega, z)}, disp=True)['x']
# output = F

depths = 30
max_depth = 0.08
# snippet_samples = samples // 2 # samples in the middle
beginning_samples = 0
end_samples = samples
snippet_samples = end_samples - beginning_samples

bigtable = np.zeros(((depths*snippet_samples), 3))

plot_indexes = [29]


angular_f = 10e9 * 2 * pi

ylim = 0.02
# F = np.sin(times*f)
F = normalized_gaussian_pulse(times,1/(2*pi*10e9))
for idx,z in enumerate(np.linspace(0, max_depth, depths)):
    output = propagate(F, n, omega, z)
    if(idx == 0):
        plt.subplot(2,4,1)
        plt.plot(times, output,'r')
    if(idx in plot_indexes):
        plt.subplot(2,4,2)
        plt.ylim((-ylim,ylim))
        plt.plot(times, output,'r')
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),0] = times[beginning_samples:end_samples]
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),1] = z
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),2] = output[beginning_samples:end_samples]
    with open("pretty_output_1.csv", "ab") as fi:
        np.savetxt(fi, bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),:], delimiter=",")
        fi.write(b"\n\n")

F[:] = 0
F[200*3:800*3] = sawtooth(times[200*3:800*3] * angular_f)
for idx,z in enumerate(np.linspace(0, max_depth, depths)):
    output = propagate(F, n, omega, z)
    if(idx == 0):
        plt.subplot(2,4,3)
        plt.plot(times, output,'g')
    if(idx in plot_indexes):
        plt.subplot(2,4,4)
        plt.ylim((-ylim,ylim))
        plt.plot(times, output,'g')
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),0] = times[beginning_samples:end_samples]
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),1] = z
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),2] = output[beginning_samples:end_samples]
    with open("pretty_output_2.csv", "ab") as fi:
        np.savetxt(fi, bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),:], delimiter=",")
        fi.write(b"\n\n")

F[:] = 0
F[200*3:800*3] = np.sin(times[200*3:800*3]*angular_f)
# F[200:400] = -np.sin(times[200:400]* 1e9 * 2 * pi)
for idx,z in enumerate(np.linspace(0, max_depth, depths)):
    output = propagate(F, n, omega, z)
    if(idx == 0):
        plt.subplot(2,4,5)
        plt.plot(times, output,'b')
    if(idx in plot_indexes):
        plt.subplot(2,4,6)
        plt.ylim((-ylim,ylim))
        plt.plot(times, output,'b')
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),0] = times[beginning_samples:end_samples]
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),1] = z
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),2] = output[beginning_samples:end_samples]
    with open("pretty_output_3.csv", "ab") as fi:
        np.savetxt(fi, bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),:], delimiter=",")
        fi.write(b"\n\n")

F[:] = 0
F = np.sin(times*angular_f)
for idx,z in enumerate(np.linspace(0, max_depth, depths)):
    output = propagate(F, n, omega, z)
    if(idx == 0):
        plt.subplot(2,4,7)
        plt.plot(times, output,'y')
    if(idx in plot_indexes):
        plt.subplot(2,4,8)
        plt.ylim((-ylim,ylim))
        plt.plot(times, output,'y')
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),0] = times[beginning_samples:end_samples]
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),1] = z
    bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),2] = output[beginning_samples:end_samples]
    with open("pretty_output_4.csv", "ab") as fi:
        np.savetxt(fi, bigtable[(idx*snippet_samples):((idx+1)*snippet_samples),:], delimiter=",")
        fi.write(b"\n\n")

plt.draw()
plt.pause(0.001)
plt.savefig("propagated_waveforms_detail.svg")

os.system("gnuplot plot_spectrum.plt")
os.system("eog propagated_waveforms.svg")

files = ['propagation_simple_sawtooth.py', "propagated_waveforms.svg"]
store.ask(files)
