from math import sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth, get_tissue_cole_cole_coefficients, tissue_properties
from mpl_toolkits.mplot3d import Axes3D


import unittest


class propagator:
    def __init__(self):
        pass


    def fourier_transform(self, input_data, sampling_frequency, frequency_scale_factor):
        self.input_fft = np.fft.rfft(input_data)

        self.a_n_coefficients = self.input_fft.real
        self.b_n_coefficients = self.input_fft.imag

        # duration =
        # self.base_period = sampling_frequency/len(input_data)

        frequency_step = (sampling_frequency * frequency_scale_factor)/len(self.a_n_coefficients)
        self.times = np.linspace(0, len(self.a_n_coefficients)*(1.0/(sampling_frequency*frequency_scale_factor)), len(self.a_n_coefficients))
        self.mode_frequencies = np.linspace(frequency_step, (len(self.a_n_coefficients)/2)*frequency_step, len(self.a_n_coefficients))

        # return fft, self.a_n_coefficients, self.b_n_coefficients, base_period



    def attenuate(a_n, b_n, E_penetration_depth, distance):
        attenuation = exp(-distance/E_penetration_depth)
        return a_n*attenuation, b_n*attenuation



    def wavenumber(n, base_period, dielectric_constants):
         return self.modes*(base_period)*2*pi*np.sqrt(mu_0*dielectric_constants*epsilon_0)

        #
        #
        # fft, a_n, b_n, base_period = fourier_transform(input_data)
        #
        # #split into the two phases
        #
        # # 1000
        #
        # a_n, b_n = attenuate(a_n, b_n, 1,0.5)
        #
        # output = np.zeros_like(ts)
        #
        # plt.plot(input_data)
        #
        # #
        # # ef, sigma, deltas, alphas, taus = get_tissue_cole_cole_coefficients(100)
        # # dielectric_constants = np.ones_like(input_data)
        # # penetration_depth = np.ones_like(input_data)
        #
        # for i in range(0, len(input_data)):
        #     center_frequency = n*(base_period)
        #     print(center_frequency)
        #     dielectric_constants[i], penetration_depth[i] = tissue_properties(center_frequency, ef, sigma, deltas, alphas, taus)
        #
        #
        # for j,z in enumerate(np.linspace(0,100)):
        #     spatial_phase = wavenumber(n, base_period, dielectric_constant)*z
        #
        #     for i,t in enumerate(ts):
        #         print(i)
        #         output[i] = fourier_sum(spatial_phase, i, n, a_n, b_n, base_period)
        #
        #         # plt.plot(fft)
        #     plt.plot(output)
        #
        # plt.show()

    def fourier_sum(self, spatial_phase, t):

        temporal_phase = self.mode_frequencies*2*pi*t
        # np.outer(,t)
        # [1]Luebbers R, Uno T, Kumagai K. Comments with reply, on \
        # “Pulse propagation in a linear, causally dispersive medium” by K.E. Oughstun. Proceedings of the IEEE
        # 1993;81:631–9. https://doi.org/10.1109/5.219349.


        phase = spatial_phase + temporal_phase
        # temporal_phase = 1
        sum = self.a_n_coefficients*np.cos(phase) + self.b_n_coefficients*np.sin(phase)

        output = np.sum(sum, axis=0) #1

        output /= len(self.mode_frequencies)

        return output


    # def optimal_frequency():
        # arccos

    # def analytic_oscillator_fourier_sum():


class test_fourier(unittest.TestCase):

    def test_sine_fourier(self):

        sampling_frequency = 50000
        input_frequency = 1000.0
        frequency_scale_factor = 1.0e6
        times = np.linspace(0, 1.0, sampling_frequency)
        input_data = np.zeros_like(times)
        input_data = np.sin(2.0*pi*times*1000.0)

        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)

        # plt.plot(p.mode_frequencies,p.a_n_coefficients)
        # plt.show()
        print(p.a_n_coefficients)
        print(p.mode_frequencies)
        print(times[-1])

    def test_fourier_reconstruction(self):
        sampling_frequency = 5000
        input_frequency = 1000.0
        frequency_scale_factor = 1e6
        times = np.linspace(0, 1.0, sampling_frequency)
        input_data = np.zeros_like(times)
        input_data = np.sin(2.0*pi*times*input_frequency)

        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)


        times = np.linspace(0, 1.0/frequency_scale_factor, int(sampling_frequency)*10)
        output = np.zeros_like(times)

        z = np.zeros_like(p.mode_frequencies)
        for i,t in enumerate(times):
            output[i] = p.fourier_sum(z,t)


        # plt.plot(p.fourier_sum(, times))
        plt.plot(times, output)
        plt.show()







if __name__ == '__main__':
    unittest.main()
