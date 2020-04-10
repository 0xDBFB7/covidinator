import numpy, scipy
from scipy.signal import correlate

# Load datasets, taking mean of 100 values in each table row
A = numpy.loadtxt("vb-sync-XReport.txt")[:,1:].mean(axis=1)
B = numpy.loadtxt("vb-sync-YReport.txt")[:,1:].mean(axis=1)

nsamples = A.size

# regularize datasets by subtracting mean and dividing by s.d.
A -= A.mean(); A /= A.std()
B -= B.mean(); B /= B.std()

# Put in an artificial time shift between the two datasets
time_shift = 20
A = numpy.roll(A, time_shift)

# Find cross-correlation
xcorr = correlate(A, B)

# delta time array to match xcorr
dt = numpy.arange(1-nsamples, nsamples)

recovered_time_shift = dt[xcorr.argmax()]

print "Recovered time shift: %d" % (recovered_time_shift)

# Copyright (C) 2015-2020: The University of Edinburgh
#                 Authors: Craig Warren and Antonis Giannopoulos
#
# This file is part of gprMax.
#
# gprMax is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# gprMax is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with gprMax.  If not, see <http://www.gnu.org/licenses/>.

import argparse
import os
import sys

import h5py
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

from gprMax.exceptions import CmdInputError
from gprMax.receivers import Rx
from gprMax.utilities import fft_power

f = h5py.File(filename, 'r')
nrx = f.attrs['nrx']
dt = f.attrs['dt']
iterations = f.attrs['Iterations']
time = np.linspace(0, (iterations - 1) * dt, num=iterations)

# Check there are any receivers
if nrx == 0:
    raise CmdInputError('No receivers found in {}'.format(filename))

for rx in range(1, nrx + 1):
    path = '/rxs/rx' + str(rx) + '/'
    availableoutputs = list(f[path].keys())


f.close()

return plt
