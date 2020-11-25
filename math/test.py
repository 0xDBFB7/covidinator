from math import pi

#Adair's method:

membrane_area = 4 * pi * ((120e-9)/2.0)**2.0

amplitude = 0.1e-9

density = 1000.0
thickness = 50e-9
freq = 8e9
top = (1/8.0)*density*membrane_area*thickness*(2*pi*freq*amplitude)**2
bottom = (1500.0) * membrane_area * density * (2*pi*freq*amplitude)**2

print(top / bottom)


#Stokes' law:

#https://ri.conicet.gov.ar/bitstream/handle/11336/73253/CONICET_Digital_Nro.b9347fe7-bf0a-43dd-a1a6-40972cdfd4d9_A.pdf?sequence=2

viscosity = 8e-4

M = 1.328e-19
r = 120e-9 / 2
damping_coefficient = (3.0 * pi * r * viscosity) / M

Q_factor = ((2 * pi * freq) / damping_coefficient) /2 # this is wrong. Fix it.



#equation 6, breathing mode, in Persson 1986
# and http://farside.ph.utexas.edu/teaching/315/Waves/node13.html
mu = 1e-3 # viscosity

damping_ratio = (4.0 * mu / ((r**2.0)) * density)


print(((2 * pi * freq) / damping_ratio))

# there are two conventions for the damping ratio, with omega_r and without?
# is that right? Double check.


# the location of 'density' is somewhat ambiguous. 
# Q should be dimensionless.
# (2*pi*8e9 Hz) / (4 * 1e-3 (newton*second)/m^2 / ((120 nm / 2)^2 * 1000 kg/m^3 ))


def damping_ratio(frequency, viscosity, density, radius):
    mass = density*(4.0/3.0)*pi*(radius**3.0)
    critical_damping_coefficient = 2 * mass * (2*pi*frequency)
    
    damping_constant = (2*pi*frequency) / (4 * viscosity / ((radius)**2 * density))
    return damping_constant / critical_damping_coefficient
    
def resonant_frequency(density_water,density_solid,wave_speed, radius):
    return np.sqrt((density_water/density_solid)*(wave_speed**2.0)/(radius**2.0))/(2*pi)

import numpy as np
import matplotlib.pyplot as plt
radius = np.linspace(1e-9, 1000e-9, 100)

density = 1000.0
wave_speed = 800.0
viscosity = 1e-3
fres = resonant_frequency(density,density, wave_speed, radius)
damp = damping_ratio(fres, viscosity, density, radius)


plt.plot(radius, 1/(2*damp))
plt.show()
