#generated via OpenMM script builder
#Thanks!
#Uses python 2 on the author's machine.

from __future__ import print_function
from simtk.openmm import app
import simtk.openmm as mm
from simtk import unit
from sys import stdout

pdb = app.PDBFile('emd_6323.pdb')
forcefield = app.ForceField('amber99sbildn.xml', 'tip3p.xml')

force = CustomExternalForce('100*max(0, r-2)^2; r=sqrt(x*x+y*y+z*z)')
system.addForce(force)

system = forcefield.createSystem(pdb.topology, nonbondedMethod=app.PME,
    nonbondedCutoff=1.0*unit.nanometers, constraints=app.HBonds, rigidWater=True,
    ewaldErrorTolerance=0.0005)
integrator = mm.LangevinIntegrator(300*unit.kelvin, 1.0/unit.picoseconds,
    2.0*unit.femtoseconds)
integrator.setConstraintTolerance(0.00001)

platform = mm.Platform.getPlatformByName('CUDA')
properties = {'CudaPrecision': 'mixed'}
simulation = app.Simulation(pdb.topology, system, integrator, platform,
    properties)
simulation.context.setPositions(pdb.positions)

print('Minimizing...')
simulation.minimizeEnergy()

simulation.context.setVelocitiesToTemperature(300*unit.kelvin)
print('Equilibrating...')
simulation.step(100)

simulation.reporters.append(app.DCDReporter('trajectory.dcd', 1000))
simulation.reporters.append(app.StateDataReporter(stdout, 1000, step=True,
    potentialEnergy=True, temperature=True, progress=True, remainingTime=True,
    speed=True, totalSteps=1000, separator='\t'))

print('Running Production...')
simulation.step(1000)
print('Done!')
