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
import pickle
import dill
import sys


omega_res = 2.0*pi*30e9

electron_charge = 1.602e-19 # Coulomb
Z0 = 377.0
c0 = 3e8


m_reduced = 1.16e-19 #kg
q = 10e3 * electron_charge # effective charge -


picometer = 1e-12

t= 0.0
z = 0.06


Q = 1.5
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

muscle_id = 48
lung_id = 41
#cole-cole refractive index
ef, sigma, deltas, alphas, taus = get_tissue_cole_cole_coefficients(lung_id)


#     '''
#     See "Compilation of the dielectric properties of body tissues at RF and microwave frequencies.", Gabriel 1996
#     Equation 3, page 12.
#     '''



def propagate(F, n, omega, z, oscillator=True):

    frequency_domain = np.fft.fft(F)
    # greens_function(omega) * q/m_reduced *



    # frequency_domain[(omega/(2.0*pi)) < 1e9] = 0
    # frequency_domain[(omega/(2.0*pi)) > 10e9] = 0


    oscillator_amplitude = greens_function(omega) if oscillator else 1
    propagated = oscillator_amplitude * frequency_domain * np.exp(-1j*(omega/c0)*n*z)
    # watch the sign here - fix if needed

    return np.fft.ifft(propagated)



#energy constraint always tends toward a step function

def cost_function(F, n, omega, z):
    return abs(-np.max(propagate(F, n, omega, z))/picometer) + np.max(F**2.0)


duration = 30e-10
samples = int(np.ceil(duration * omega_res * 2.0 * 5.0))
times = np.linspace(-duration,duration,samples)

print("Sample time: ",times[1]-times[0])
print("Window duration: ",times[-1]-times[0])


F=np.ones(samples)
omega = 2*pi*np.fft.fftfreq(samples)*(samples/(duration*2))
print(f"Samples: {samples} | < 1e10: {np.count_nonzero(omega < 1e10)}")

n = np.sqrt(cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)) #precompute cole-cole refractive index
n[omega == 0] = 1

# F[len(F)//2:-1] = 0
# F = np.sin(times*omega_res)

# output = propagate(F, omega, z)



try:
    f = open("output.pkl",'rb')
    output = pickle.load(f)
    f.close()
except:

    output = minimize(cost_function, F, args=(n, omega, z), options={'disp': True}, tol=1e-10 )['x']

    f = open("output.pkl","wb")
    pickle.dump(output,f)
    f.close()




#"method": "Nelder-Mead",
# output = basinhopping(cost_function, F, minimizer_kwargs={"args":(omega, z)}, disp=True)['x']
# output = F




output = propagate(output, n, omega, 0, oscillator=False) #if a filter is enabled

input_amplitude = (np.max(np.abs(np.real(output)))-np.min(np.abs(np.real(output))))

output = output-np.mean(output)
output /= input_amplitude


oscillation = propagate(output, n, omega, z)
propagated_field = propagate(output, n, omega, z, oscillator=False)

transfer_ratio = (np.max(np.abs(np.real(oscillation)))-np.min(np.abs(np.real(oscillation)))) / input_amplitude

print(f"{(transfer_ratio * 800000)} pm at E-field limit, {3.0*275.0} pm desired")


plt.subplot(2,2,1)
plt.plot(times, output)
plt.subplot(2,2,2)
plt.plot(times, (oscillation*1e7 / 1e-12))
plt.title("Picometers oscillation amplitude per megavolt")
plt.subplot(2,2,3)
plt.plot(times, propagated_field)
plt.savefig("muscle_pulse_8cm_minimize_test2.svg")
plt.show()
#
# n = cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)
# plt.plot(omega,np.real(n))
# plt.plot(omega,np.imag(n))
#
# plt.show()
