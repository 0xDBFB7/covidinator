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


    def fourier_transform(self, input_data, sampling_frequency, frequency_scale_factor, threshold_amplitude = 1e-4):
        self.input_fft = np.fft.rfft(input_data)

        self.a_n_coefficients = self.input_fft.real
        self.b_n_coefficients = self.input_fft.imag

        # duration =
        # self.base_period = sampling_frequency/len(input_data)

        frequency_step = (sampling_frequency * frequency_scale_factor)/len(self.a_n_coefficients)
        self.times = np.linspace(0, len(self.a_n_coefficients)*(1.0/(sampling_frequency*frequency_scale_factor)), len(self.a_n_coefficients))
        self.mode_frequencies = np.linspace(frequency_step, (len(self.a_n_coefficients)/2)*frequency_step, len(self.a_n_coefficients))

        print(len(self.mode_frequencies))
        magnitudes = np.sqrt(self.a_n_coefficients**2.0 + self.b_n_coefficients**2.0)
        filted_indices = magnitudes > threshold_amplitude*np.max(magnitudes)
        self.mode_frequencies = self.mode_frequencies[filted_indices]
        self.a_n_coefficients = self.a_n_coefficients[filted_indices]
        self.b_n_coefficients = self.b_n_coefficients[filted_indices]
        print(len(self.mode_frequencies))
        # return fft, self.a_n_coefficients, self.b_n_coefficients, base_period



    def attenuate(a_n, b_n, E_penetration_depth, distance):
        attenuation = exp(-distance/E_penetration_depth)
        return a_n*attenuation, b_n*attenuation



    def wavenumber(self):
         return self.mode_frequencies*2*pi*np.sqrt(mu_0*self.dielectric_constants*epsilon_0)

    def populate_tissue_properties(self, tissue_id):
         self.ef, self.sigma, self.deltas, self.alphas, self.taus = get_tissue_cole_cole_coefficients(tissue_id)
         self.dielectric_constants = np.ones_like(self.mode_frequencies)
         self.penetration_depth = np.ones_like(self.mode_frequencies)
         for i in range(0, len(self.mode_frequencies)):
            self.dielectric_constants[i], self.penetration_depth[i] = tissue_properties(self.mode_frequencies[i], self.ef, self.sigma, self.deltas, self.alphas, self.taus)

        #
        #
        #
        # a_n, b_n = attenuate(a_n, b_n, 1,0.5)
        #


    def fourier_sum(self, spatial_phase, aux_phase, t):
        print(len(self.mode_frequencies))
        temporal_phase = np.outer(self.mode_frequencies*2*pi,t).T

        # np.outer(,t)
        # [1]Luebbers R, Uno T, Kumagai K. Comments with reply, on \
        # “Pulse propagation in a linear, causally dispersive medium” by K.E. Oughstun. Proceedings of the IEEE
        # 1993;81:631–9. https://doi.org/10.1109/5.219349.


        phase = spatial_phase + temporal_phase + aux_phase

        # temporal_phase = 1

        sum = self.a_n_coefficients*np.cos(phase) + self.b_n_coefficients*np.sin(phase)

        output = np.sum(sum, axis=1) #1

        output /= len(self.mode_frequencies)

        return output


    # def optimal_frequency():
        # arccos

    def analytic_oscillator_excitation(self, damping_beta):
        aux_phase = atan((2.0* damping_beta * self.mode_frequencies) / ())



class test_fourier(unittest.TestCase):

    def test_sine_fourier(self):

        sampling_frequency = 50000
        input_frequency = 1000.0
        frequency_scale_factor = 1.0e6
        times = np.linspace(0, 1.0, sampling_frequency)
        input_data = np.zeros_like(times, dtype=np.float32)
        input_data = np.sin(2.0*pi*times*1000.0)

        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)

        # plt.plot(p.mode_frequencies,p.a_n_coefficients)
        # plt.show()
        print(p.a_n_coefficients)
        print(p.mode_frequencies)
        print(times[-1])



    def test_fourier_reconstruction(self):
        sampling_frequency = 50000
        input_frequency = 1000.0
        frequency_scale_factor = 1e6
        times = np.linspace(0, 1.0, sampling_frequency, dtype=np.float32)
        times = np.tile(times, 5)
        input_data = np.zeros_like(times, dtype=np.float32)
        input_data[0:500] = np.sin(2.0*pi*times*input_frequency)[0:500]
        input_data = np.tile(input_data, 5)



        print(len(input_data))
        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor, threshold_amplitude=0.1)


        times = np.linspace(0, 100*(1.0/(frequency_scale_factor*input_frequency)), int(sampling_frequency)*10)


        # p.populate_tissue_properties(39)
        # spatial_phase = p.wavenumber()
        spatial_phase = np.zeros_like(p.mode_frequencies,dtype=np.float32)

        aux_phase = np.zeros_like(spatial_phase,dtype=np.float32)
        output = p.fourier_sum(spatial_phase, aux_phase, times)

        assert(output - input == 0)

        plt.plot(times,output)
        plt.show()







if __name__ == '__main__':
    unittest.main()
