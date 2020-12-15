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

eps_inf = 4.0
eps_s = 75.0
tau_f = 5*10**-14
tau = 8*10**-12
omega_res = 2.0*pi*8e9

Z0 = 377.0
c0 = 3e8
m_reduced = 1.16e-19
q = 10e4 * 10e-19

t= 0.0
z = 0.5


Q = 2.0
gamma = omega_res / Q

def greens_function(omega):
    return q/(m_reduced*(omega_res**2.0 - omega**2.0 + (1j*gamma*omega)))

def refractive_index(omega):
    #refractive index is n = sqrt(mu/epsilon)
    return np.sqrt(eps_inf + (eps_s - eps_inf)/((1.0-1j*omega*tau)*(1.0-1j*omega*tau_f)))

def propagate(F, omega, z):

    frequency_domain = np.fft.fft(F)
    # greens_function(omega) * q/m_reduced *
    propagated =  greens_function(omega) * frequency_domain * 
    # watch the sign here - fix if needed

    return np.fft.ifft(propagated)


def cost_function(F, omega, z):
    return abs(-np.max(propagate(F, omega, z)) + np.max(F**2.0))

duration = 100e-10
samples = 10000
times = np.linspace(-duration,duration,samples)

F=np.ones(samples)
omega = 2*pi*np.fft.fftfreq(samples)*(samples/(duration*2))

# F[len(F)//2:-1] = 0
F = np.sin(times*omega_res)

# output = propagate(F, omega, z)
#

# output = minimize(cost_function, F, args=(omega, z), options={'disp': True} )['x']

# output = basinhopping(cost_function, F, minimizer_kwargs={"method": "Nelder-Mead", "args":(omega, z)}, disp=True)['x']
output = F

plt.plot(times, output)
plt.plot(times, propagate(output, omega, z))
plt.show()

# plt.plot(omega,greens_function(omega)/1e-10)
# plt.show()
