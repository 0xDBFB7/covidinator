from dataclasses import dataclass
from math import pi, sqrt, e, log, isclose, exp
# from scipy.optimize import curve_fit
# import numpy as np
# import matplotlib.pyplot as plt
# import h5py
from scipy.constants import epsilon_0, mu_0


outer_radius_R = 0
membrane_thickness_d = 0
membrane_capacitance_Cm = 0


@dataclass
class Point:
    x: float
    y: float
    z: float = 0.0


'''
This is a verbatim implementation of
[1]:
Kotnik T, Miklavčič D, Slivnik T.
Time course of transmembrane voltage induced by time-varying electric fields—a method for theoretical analysis and its application.
Bioelectrochemistry and Bioenergetics 1998;45:3–16.
https://doi.org/10.1016/S0302-4598(97)00093-7.

If a truly arbitrary
the equivalent of the discrete fourier transform for the Laplace transform appears to be the Z-transform.

'''

def tau_1_f(b_1, b_2, b_3):
    #equation A6e in Kotnik
    return (2.0 * b_3) / (b_2 - sqrt(((b_2)**2.0) - ((4.0*b_1) * b_3)))

def tau_2_f(b_1, b_2, b_3):
    #equation A6f in Kotnik
    return (2.0 * b_3) / (b_2 + sqrt(((b_2)**2.0) - ((4.0*b_1) * b_3)))



def delta_transmembrane_trapezoidal(t, start_time, a_1, a_2, b_3, R):

    l_o = conductivity_extracellular # S/m
    l_i = conductivity_intracellular #S/m

    # epsilon_0

    sub1 = (3.0 * (R**2.0) - 3.0 * d * R + d**2.0)
    sub2 = (3.0 * d * R - d**2.0)

    a_1 = 3.0 * d * l_o * ((l_i * (sub1)) + l_n*(sub2)) #eq.9a
    a_2 = 3.0 * d * ((l_i * e_o + l_o * e_i) * sub1 + (l_m * e_0 + l_o * e_m) * sub2)
    a_3 = 3.0 * d * e_0 * (e_i * (sub1) + e_m * sub2)

    b_1 = 2.0 * R**3.0 * (l_m + 2.0*l_o) * (l_m + 0.5 * l_i) + 2.0 * (R-d)**3.0 * (l_m - l_o) * (l_i - l_m)

    b_2 = 2.0 * R**3.0 * (l_i * (0.5 * e_m + e_o) + l_m * (0.5*e_i + 2.0*e_m + 2*e_0) + l_0 * (e_i + 2.0 * e_m)) + (2.0 * (R - d)**3.0 * (l_i * (e_m - e_0) + l_m * (e_i - 2.0*e_m + e_o) - l_0 * (e_i - e_m))) # is this truly a multiply, or a cross?
    b_3 = 2.0 - R**3.0 * (e_m + 2.0*e_0) * (e_m + 0.5 * e_i) + 2.0 * (R-d)**3.0 * (e_m - e_0) * (e_i - e_m)

    tau_1 = tau_1_f(b_1, b_2, b_3)
    tau_2 = tau_2_f(b_1, b_2, b_3)

    delta_phi_m_t = (a_1 / b_1) * t * u
