from math import sin, cos, pi, sqrt, e, log, isclose, exp
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, cm, pyplot as plt
from scipy.constants import epsilon_0, mu_0
import scipy.constants
from fdtd_PCB_extensions.tissue import cole_cole_4, complex_permittivity_to_er_and_sigma, electric_field_penetration_depth
from mpl_toolkits.mplot3d import Axes3D
from scipy.optimize import minimize, basinhopping
from fdtd_PCB_extensions.tissue import cole_cole_4, get_tissue_cole_cole_coefficients



omega_res = 2.0*pi*8e9

Z0 = 377.0
c0 = 3e8
m_reduced = 1.16e-19
q = 10e3 * 10e-19

picometer = 1e-12

t= 0.0
z = 0.08


Q = 2.0
gamma = omega_res / Q




def greens_function(omega):
    #see Feynman Lectures, volume 1 lecture 23 equation 8.
    return q/(m_reduced*(omega_res**2.0 - omega**2.0 + (1j*gamma*omega)))


#debye water coefficients
eps_inf = 4.0
eps_s = 75.0
tau_f = 5*10**-14
tau = 8*10**-12

def debye_refractive_index(omega):
    #refractive index is n = sqrt(mu/epsilon)
    return np.sqrt(eps_inf + (eps_s - eps_inf)/((1.0-1j*omega*tau)*(1.0-1j*omega*tau_f)))

#cole-cole refractive index
ef, sigma, deltas, alphas, taus = get_tissue_cole_cole_coefficients(48)


# def cole_refractive_index(omega):
#     '''
#     See "Compilation of the dielectric properties of body tissues at RF and microwave frequencies.", Gabriel 1996
#     Equation 3, page 12.
#     '''
#     angular_frequency = omega
#     complex_permittivity = complex(ef, 0)
#     for n in range(0, 4):
#         complex_permittivity += deltas[n] / (1.0 + ((complex(0, 1)*angular_frequency*taus[n])**(1.0-alphas[n])))
#
#     complex_permittivity[angular_frequency > 0] += (sigma/((complex(0, 1)*angular_frequency[angular_frequency > 0]*epsilon_0)))
#
#     n = np.sqrt(complex_permittivity)
#     return complex_permittivity


def propagate(F, omega, z):

    frequency_domain = np.fft.fft(F)
    # greens_function(omega) * q/m_reduced *

    n = np.sqrt(cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus))
    n[omega == 0] = 1
    propagated =  greens_function(omega) * frequency_domain * np.exp(-1j*(omega/c0)*n*z)
    # watch the sign here - fix if needed

    return np.fft.ifft(propagated)


#energy constraint always tends toward a step function

def cost_function(F, omega, z):
    return abs(-np.max(propagate(F, omega, z))/picometer) + np.max(F**2.0)

duration = 30e-10
samples = int(np.ceil(duration * omega_res * 2.0 * 5.0))
times = np.linspace(-duration,duration,samples)

F=np.ones(samples)
omega = 2*pi*np.fft.fftfreq(samples)*(samples/(duration*2))
print(f"Samples: {samples} | < 1e10: {np.count_nonzero(omega < 1e10)}")


# F[len(F)//2:-1] = 0
# F = np.sin(times*omega_res)

# output = propagate(F, omega, z)


output = minimize(cost_function, F, args=(omega, z), options={'disp': True}, tol=1e-10 )['x']

#"method": "Nelder-Mead",
# output = basinhopping(cost_function, F, minimizer_kwargs={"args":(omega, z)}, disp=True)['x']
# output = F

oscillation = propagate(output, omega, z)/picometer

transfer_ratio = (np.max(np.abs(np.real(oscillation)))-np.min(np.abs(np.real(oscillation)))) / (np.max(np.abs(np.real(output)))-np.min(np.abs(np.real(output))))

print(f"{(transfer_ratio * 800000)} pm at E-field limit, {3*275} pm desired")



plt.subplot(1,2,1)
plt.plot(times, output)
plt.subplot(1,2,2)
plt.plot(times, oscillation)
plt.show()
#
# n = cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)
# plt.plot(omega,np.real(n))
# plt.plot(omega,np.imag(n))
#
# plt.show()
