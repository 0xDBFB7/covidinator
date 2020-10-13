from math import sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth, get_tissue_cole_cole_coefficients
from mpl_toolkits.mplot3d import Axes3D


import unittest



def fourier_transform(input_data):
    fft = np.fft.fft(input_data)

    a_n = fft.real
    b_n = fft.imag

    base_period = 1.0/len(input_data)
    return fft, a_n, b_n, base_period


def fourier_sum(z, t, n, a_n, b_n, base_period):
    temporal_phase = n*(1.0/len(n))*2*pi*t

    sum = a_n*np.cos(temporal_phase) + b_n*np.sin(temporal_phase)

    output = np.sum(sum, axis=0)

    output /= len(n)

    return output


# def optimal_frequency():
    # arccos

# def analytic_oscillator_fourier_sum():


class test_fourier(unittest.TestCase):

    def test_sine_fourier(self):

        ts = np.linspace(0, 50, 300)
        n = np.arange(0, 300)
        input_data = np.sin(ts)
        fft, a_n, b_n, base_period = fourier_transform(input_data)

        #split into the two phases



        output = np.zeros_like(ts)
        for i,t in enumerate(ts):
            output[i] = fourier_sum(0, t, n, a_n, b_n, base_period)


        plt.plot(output)
        plt.plot(fft)
        plt.plot(input_data + 1)
        plt.show()

if __name__ == '__main__':
    unittest.main()
