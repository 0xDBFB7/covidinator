from math import atan,sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth, get_tissue_cole_cole_coefficients, tissue_properties
from mpl_toolkits.mplot3d import Axes3D

def average(arr, n):
    end =  n * int(len(arr)/n)
    return np.mean(arr[:end].reshape(-1, n), 1)

import unittest


class propagator:
    def __init__(self):
        pass


    def fourier_transform(self, input_data, sampling_frequency, frequency_scale_factor):
        self.input_fft = np.fft.rfft(input_data)

        self.a_n_coefficients = self.input_fft.real
        self.b_n_coefficients = self.input_fft.imag

        frequency_step = (sampling_frequency * frequency_scale_factor)/len(self.a_n_coefficients)
        
        self.times = np.linspace(0, len(self.a_n_coefficients)*(1.0/(sampling_frequency*frequency_scale_factor)), len(self.a_n_coefficients))
        self.mode_frequencies = np.linspace(frequency_step, (len(self.a_n_coefficients)/2)*frequency_step, len(self.a_n_coefficients))


        

    def attenuate(self,distance):
        attenuation = np.exp(-distance/self.E_penetration_depth)
        self.a_n_coefficients*=attenuation
        self.b_n_coefficients*=attenuation



    def wavenumbers(self):
         return self.mode_frequencies*2*pi*np.sqrt(mu_0*self.dielectric_constants*epsilon_0)

    def populate_tissue_properties(self, tissue_id):
         self.ef, self.sigma, self.deltas, self.alphas, self.taus = get_tissue_cole_cole_coefficients(tissue_id)
         self.dielectric_constants = np.ones_like(self.mode_frequencies)
         self.E_penetration_depth = np.ones_like(self.mode_frequencies)
         for i in range(0, len(self.mode_frequencies)):
            self.dielectric_constants[i], self.E_penetration_depth[i] = tissue_properties(self.mode_frequencies[i], self.ef, self.sigma, self.deltas, self.alphas, self.taus)

        #
        #
        #
        # a_n, b_n = attenuate(a_n, b_n, 1,0.5)
        #


    def fourier_sum(self, phase_shift):
#        temporal_phase = np.outer(self.mode_frequencies*2*pi,t).T

        # np.outer(,t)
        # [1]Luebbers R, Uno T, Kumagai K. Comments with reply, on \
        # “Pulse propagation in a linear, causally dispersive medium” by K.E. Oughstun. Proceedings of the IEEE
        # 1993;81:631–9. https://doi.org/10.1109/5.219349.


 #       phase = spatial_phase + temporal_phase + aux_phase

        # temporal_phase = 1

  #      sum = self.a_n_coefficients*np.cos(phase) + self.b_n_coefficients*np.sin(phase)

  #      output = np.sum(sum, axis=1) #1

   #     output /= len(self.mode_frequencies)
        complex_frequency = self.a_n_coefficients + (1j * self.b_n_coefficients)
        complex_frequency *= np.cos(phase_shift) + 1j * np.sin(phase_shift)
        output = np.fft.ifft(complex_frequency)

        return output.real


    def analytic_oscillator_phase(self, beta, resonant_frequency):

        return np.arctan((2.0 * beta * 2*pi*self.mode_frequencies) / 
            ((2*pi*resonant_frequency)**2.0 - (2*pi*self.mode_frequencies)**2.0))
        #angular frequencies?
        
        #mode_freq is not correct

    def analytic_oscillator_scaling(self, beta, resonant_frequency):
        p1 = ((2*pi*resonant_frequency)**2.0 - (2*pi*self.mode_frequencies)**2.0)**2.0
        p2 = (4.0 * (beta**2.0) * (2*pi*self.mode_frequencies)**2.0)
        return 1/np.sqrt(p1+p2)
        
    
class test_fourier(unittest.TestCase):

    def test_sine_fourier(self):

        sampling_frequency = 1000000
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
        times = np.linspace(0, 1.0, sampling_frequency, dtype=np.float64)
        times = np.tile(times, 5)
        input_data = np.zeros_like(times, dtype=np.float64)
        #input_data[:500] = np.sin(2.0*pi*times*input_frequency)[0:500]
        #input_data = np.tile(input_data, 2)
        input_data = np.sin(2.0*pi*times*input_frequency)
        

        #plt.plot(input_data)
        #plt.show()

        print(len(input_data))
        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)
        
        p.populate_tissue_properties(39)
        spatial_phase = p.wavenumbers() * 0.2
        #spatial_phase = np.zeros_like(p.mode_frequencies,dtype=np.float32)
        #p.attenuate(0.2)

        
        output = p.fourier_sum(spatial_phase)

        #assert(output - input == 0)

        plt.plot(p.times, output)
#        plt.plot(p.times, input_data)
        
        #Damping ratio: dimensionless number
        #Damping constant:

        osc_freq = 1000e6

        k = 1e-7
        charge = 1e7  * k
        

        #turn the E field into a force
        p.a_n_coefficients *= charge
        p.b_n_coefficients *= charge

        Q_factor = 100.0
        b = 1/(2*Q_factor)

        mass = 120 * 1.66e-21 #kg
        
        beta = b/(2*mass)

        p.a_n_coefficients *= p.analytic_oscillator_scaling(beta, osc_freq)
        p.b_n_coefficients *= p.analytic_oscillator_scaling(beta, osc_freq)
        osc_phase = p.analytic_oscillator_phase(beta, osc_freq)
        oscillator_output = p.fourier_sum(spatial_phase + osc_phase)

        oscillator_output /= 1e-12

        plt.plot(p.times, oscillator_output)
        plt.show()


if __name__ == '__main__':
    unittest.main()
