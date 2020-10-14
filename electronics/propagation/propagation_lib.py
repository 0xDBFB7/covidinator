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



def fourier_transform(input_data):
    fft = np.fft.fft(input_data)

    a_n = fft.real
    b_n = fft.imag

    base_period = 1.0/len(a_n)
    return fft, a_n, b_n, base_period


def attenuate(a_n, b_n, E_penetration_depth, distance):
    attenuation = exp(-distance/E_penetration_depth)
    return a_n*attenuation, b_n*attenuation



def wavenumber(n, base_period, dielectric_constants):
     return n*(base_period)*2*pi*np.sqrt(mu_0*dielectric_constants*epsilon_0)



def fourier_sum(spatial_phase, t, n, a_n, b_n, base_period):
    temporal_phase = n*(base_period)*2*pi*t

    phase = temporal_phase + spatial_phase
    # temporal_phase = 1
    sum = a_n*np.cos(phase) + b_n*np.sin(phase)

    output = - np.sum(sum, axis=0)

    output /= len(n)

    return output


# def optimal_frequency():
    # arccos

# def analytic_oscillator_fourier_sum():


class test_fourier(unittest.TestCase):

    def test_sine_fourier(self):

        ts = np.linspace(0, 100, 1000)
        n = np.arange(0, 1000)

        input_data = np.zeros_like(ts)
        input_data[0:300] = np.sin(2.0*pi*ts[0:300])

        fft, a_n, b_n, base_period = fourier_transform(input_data)

        #split into the two phases

        # 1000

        a_n, b_n = attenuate(a_n, b_n, 1,0.5)

        output = np.zeros_like(ts)

        plt.plot(input_data)


        ef, sigma, deltas, alphas, taus = get_tissue_cole_cole_coefficients(100)
        dielectric_constants = np.ones_like(input_data)
        penetration_depth = np.ones_like(input_data)

        for i in range(0, len(input_data)):
            center_frequency = n*(base_period)
            print(center_frequency)
            dielectric_constants[i], penetration_depth[i] = tissue_properties(center_frequency, ef, sigma, deltas, alphas, taus)


        for j,z in enumerate(np.linspace(0,100)):
            spatial_phase = wavenumber(n, base_period, dielectric_constant)*z

            for i,t in enumerate(ts):
                print(i)
                output[i] = fourier_sum(spatial_phase, i, n, a_n, b_n, base_period)

                # plt.plot(fft)
            plt.plot(output)

        plt.show()

if __name__ == '__main__':
    unittest.main()
