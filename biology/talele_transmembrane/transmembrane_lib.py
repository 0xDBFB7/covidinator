from dataclasses import dataclass
from math import pi, sqrt, e, log, isclose, exp
# from scipy.optimize import curve_fit
import numpy as np
from numpy import heaviside
# import matplotlib.pyplot as plt
# import h5py
from scipy.constants import epsilon_0, mu_0
from pytexit import py2tex

def ustep(v):
    # v[v>0] = v[v>0]
    # v[v<0] = 0
    # return v
    # if(v > 0.0):
    #     return v
    # else:
    #     return 0.0
    return heaviside(v, 0.5)

@dataclass
class Cell:
    extracellular_conductivity: float # S/m
    extracellular_permittivity: float # relative
    intracellular_conductivity: float # S/m
    intracellular_permittivity: float # relative
    membrane_conductivity: float # S/m
    membrane_permittivity: float # relative
    cell_diameter: float # meters
    membrane_thickness: float

'''

Originally Kotnik's pre-made Laplace Transform-constructed waveforms were used.
~~However, this limits~~ disregard, 

[1]Talele S, Gaynor P. Non-linear time domain model of electropermeabilization:
Response of a single cell to an arbitrary applied electric field.
Journal of Electrostatics 2007;65:775–84. https://doi.org/10.1016/j.elstat.2007.06.004.

At first glance it seems like the step response doesn't consider the internal permittivity:
(a usual three-layer structure isn't used)
but worry not, the third parameter is baked into /e'2

On the other hand, there's only one time constant here. Is that going to significantly affect things?

https://dsp.stackexchange.com/questions/17035
"So, apart from the first constant term,
the output signal y(t) is given by the convolution of the derivative
of the input signal with the system's step response."

"Again, apart from the constant first term, the output sequence is obtained by
convolving the first order difference of the input sequence with the system's step response."

"You can also find the impulse response from the step response by differentiation.
That means an alternative way to calculate the output is convolving with the derivative of the step response."

'''
