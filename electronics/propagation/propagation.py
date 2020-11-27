from math import sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth
from mpl_toolkits.mplot3d import Axes3D
from propagation_lib import propagator




#
# waveform = np.genfromtxt("NLTL_input_tone/NLTL-6275_cleaned.csv", delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)
#
# waveform[:,0] = waveform[:,0] * 1e-12 #picoseonds
#
# input_frequency = 10e9
# sampling_frequency = 1000.0*input_frequency
#
# times = np.linspace(0, 1.0/input_frequency, 1000)
# input_data = np.interp(times, waveform[:,0], waveform[:,1])
#
# input_data -= np.mean(input_data) #remove the stupid zero reject
# input_data /= np.max(input_data) # normalize
#
# input_cycles = 10
#
# input_data = np.tile(input_data, 2)
# input_data[len(input_data/2):] = 0
#
# input_data = np.tile(input_data, input_cycles)
#


input_frequency = 9000.0e6
sampling_frequency = 1000.0*input_frequency
frequency_scale_factor = 1
times = np.linspace(0, 100*1.0/input_frequency, 100*1000)
# times = np.tile(times, 5)
input_data = np.zeros_like(times, dtype=np.float64)
input_data = np.sin(2.0*pi*times*input_frequency)
# input_data = np.tile(input_data, 2)

input_cycles = 2

p = propagator()
p.fourier_transform(input_data, sampling_frequency, 1.0)


depth_in_tissue = 0.1

p.populate_tissue_properties(48) #muscle

#
# for idx, depth_in_tissue in enumerate(np.arange(0, 0.1, 0.001)):
#     p.fourier_transform(input_data, sampling_frequency, 1.0)
#
#     spatial_phase = p.wavenumbers() * depth_in_tissue
#     # spatial_phase = np.zeros_like(p.mode_frequencies,dtype=np.float64)
#     p.attenuate(depth_in_tissue) # this global doesn't make any sense. pretty stupid design.
#
#     output = p.fourier_sum(spatial_phase)
#     output -= np.mean(output)
#     # print(depth_in_tissue, 1/np.max(output))
#     plt.plot(output[0:int(len(output)/(input_cycles/2))])
# plt.show()

# spatial_phase = p.wavenumbers() * depth_in_tissue
spatial_phase = np.zeros_like(p.mode_frequencies,dtype=np.float64)
p.attenuate(depth_in_tissue) # this global doesn't make any sense. pretty stupid design.

output = p.fourier_sum(spatial_phase)
output -= np.mean(output)
# print(depth_in_tissue, 1/np.max(output))
plt.plot(output)
plt.show()

#assert(output - input == 0)

# plt.plot(p.times, output)
#        plt.plot(p.times, input_data)

#Damping ratio: dimensionless number
#Damping constant:

osc_freq = 1000.0

# k = 1e-7
# charge = 1e7 * k


#turn the E field into a force
# p.a_n_coefficients *= charge
# p.b_n_coefficients *= charge

Q_factor = 100.0
# damping_force_coefficient = #N s/m


# mass = 120 * 1.66e-21 #kg
effective_mass = 120 * 1.66e-21 #kg #fix!

# beta = damping_force_coefficient/(2*effective_mass)
# beta = (osc_freq * 2*pi) / (2.0*Q_factor)
beta = 0.00000000000000001
# beta =/

# analytic_oscillator_scaling

print(p.analytic_oscillator_scaling(0.1, 1.0))

#beta is an exponential time constant, units /s.

print(p.mode_frequencies)
scale_factor = p.analytic_oscillator_scaling(beta, osc_freq)
print(scale_factor)

# plt.plot(p.mode_frequencies, p.a_n_coefficients)
plt.plot(p.mode_frequencies, scale_factor*p.a_n_coefficients)
plt.show()
#
p.a_n_coefficients *= scale_factor
p.b_n_coefficients *= scale_factor
osc_phase = p.analytic_oscillator_phase(beta, osc_freq)
oscillator_output = p.fourier_sum(spatial_phase + osc_freq)
#
# # oscillator_output /= 1e-12
#
plt.plot(p.times, oscillator_output)
plt.show()
