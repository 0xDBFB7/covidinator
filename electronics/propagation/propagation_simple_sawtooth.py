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


    #filter
    frequency_domain[(omega/(2.0*pi)) < 1e9] = 0
    frequency_domain[(omega/(2.0*pi)) > 10e9] = 0


    propagated = frequency_domain * np.exp(-1j*(omega/c0)*n*z)
    # watch the sign here - fix if needed

    return np.fft.ifft(propagated)





duration = 30e-10
samples = int(np.ceil(duration * omega_res * 2.0 * 5.0))
times = np.linspace(-duration,duration,samples)

F=np.ones(samples)
omega = 2*pi*np.fft.fftfreq(samples)*(samples/(duration*2))
print(f"Samples: {samples} | < 1e10: {np.count_nonzero(omega < 1e10)}")

n = np.sqrt(cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)) #precompute cole-cole refractive index
n[omega == 0] = 1

# F[len(F)//2:-1] = 0
# F = np.sin(times*omega_res)

# output = propagate(F, omega, z)



#"method": "Nelder-Mead",
# output = basinhopping(cost_function, F, minimizer_kwargs={"args":(omega, z)}, disp=True)['x']
# output = F



for z in np.linspace(0, 0.3, 0.05):
    output = propagate(output, n, omega, z)
    plt.subplot(2,2,1)
    plt.plot(times, output)
    


numpy.savetxt("foo.csv", a, delimiter=",")


# plt.subplot(2,2,1)
# plt.plot(times, output)
# plt.subplot(2,2,2)
# plt.plot(times, (oscillation*1e7 / 1e-12))
# plt.title("Picometers oscillation amplitude per megavolt")
# plt.subplot(2,2,3)
# plt.plot(times, propagated_field)
# plt.savefig("muscle_pulse_8cm_minimize_test2.svg")
# plt.show()
#
# n = cole_cole_4(omega/(2.0*pi), ef, sigma, deltas, alphas, taus)
# plt.plot(omega,np.real(n))
# plt.plot(omega,np.imag(n))
#
# plt.show()
