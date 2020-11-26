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

        return -1.0 * np.arctan((2.0 * beta * 2*pi*self.mode_frequencies) /
            ((2*pi*resonant_frequency)**2.0 - (2*pi*self.mode_frequencies)**2.0))
        #angular frequencies?

        #mode_freq is not correct

    def analytic_oscillator_scaling(self, beta, resonant_frequency):
        p1 = ((2*pi*resonant_frequency)**2.0 - (2*pi*self.mode_frequencies)**2.0)**2.0
        p2 = (4.0 * (beta**2.0) * (2*pi*self.mode_frequencies)**2.0)

        #numpy uses weird normalization
        # undo_normalization = len(self.mode_frequencies ** 2.0)

        return 1/np.sqrt(p1+p2)

    # def dU_dx(U, t, E_field, charge):
    #     # Here U is a vector such that y=U[0] and z=U[1]. This function should return [y', z']
    #     k = *8.9e9
    #     return [U[1], -2*U[1] - 2*U[0] + E_field*charge]



class test_fourier(unittest.TestCase):

    # def test_sine_fourier(self):
    #
    #     sampling_frequency = 1000000
    #     input_frequency = 1000.0
    #     frequency_scale_factor = 1.0e6
    #     times = np.linspace(0, 1.0, sampling_frequency)
    #     input_data = np.zeros_like(times, dtype=np.float32)
    #     input_data = np.sin(2.0*pi*times*1000.0)
    #
    #     p = propagator()
    #     p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)
    #
    #     # plt.plot(p.mode_frequencies,p.a_n_coefficients)
    #     # plt.show()
    #     print(p.a_n_coefficients)
    #     print(p.mode_frequencies)
    #     print(times[-1])



    def test_fourier_reconstruction(self):
        sampling_frequency = 500000.0
        input_frequency = 1000.0
        frequency_scale_factor = 1
        times = np.linspace(0, 1.0, int(sampling_frequency), dtype=np.float64)
        times = np.tile(times, 5)
        input_data = np.zeros_like(times, dtype=np.float64)
        #input_data[:500] = np.sin(2.0*pi*times*input_frequency)[0:500]
        #input_data = np.tile(input_data, 2)
        input_data = np.sin(2.0*pi*times*input_frequency)


        # filename = 'globalsave.pkl'
        # try:
        #     dill.load_session(filename)
        # except:
        #     os.system("rm dumps/*")
        #     os.system("rm data/*")
        #     voltages, currents, currents_2 = sim_VSWR(pcb)
        #     dill.dump_session(filename)

        #plt.plot(input_data)
        #plt.show()

        p = propagator()
        p.fourier_transform(input_data, sampling_frequency, frequency_scale_factor)

        depth_in_tissue = 0.2

        # p.populate_tissue_properties(48)
        # spatial_phase = p.wavenumbers() * depth_in_tissue
        spatial_phase = np.zeros_like(p.mode_frequencies,dtype=np.float64)
        #p.attenuate(depth_in_tissue)


        output = p.fourier_sum(spatial_phase)

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


if __name__ == '__main__':
    unittest.main()
