
This is a simple Python wrapper for flaport/fdtd and ngspice that supports KiCAD PCB import.

flaport's pytorch CUDA integrations make this pleasantly fast. Good on ya, flaport!

Better alternatives are

1. OpenEMS (which supports some lumped elements), especially with Dan Harmon's pyopenems bindings. Supports mesh refinement, which is neat.
2. gprMax. also amazing, the api isn't quite right for this sort of application.
3. MEEP - great, very mature, but seems a bit more optimized for optical.
4. fdtd++? haven't evaluated.


S-expression-S-parameter


# Background

Coupling SPICE and FDTD is a mature field.

There are numerous subtly different methods of coupling; either voltage integrated from the grid is injected into SPICE, then the computed current is put back onto the grid with a H-field source, or the other way around [Mix 1999].

[Thomas 1994] represents the source cell's capacitance in SPICE, and lets SPICE integrate the voltage on the capacitor before directly putting that voltage on the grid.

We do the same, except the cell capacitance is integrated in the FDTD loop. This is a dumbass way to do it, since the timestep must be horrifically small to resolve the voltage properly.
We couldn't make the other methods work in short order.

There are also many different source geometries, each introducing their own distortion; Ampere's law current contours around each conductor [Mix 1999], voltage via staircases
from the ground plane [Luebbers 1996], current sources in the plane of the trace, with vias to the ground plane, etc.

We again choose the worst possible one, a simple via. This has the advantage of not needing the current direction or source polarization to be manually specified,
but probably distorts the signal significantly.

Conductors are represented by zeroing all components of the electric field within. They're supposed to have zero thickness - I think only one edge-layer of E components are zeroed, but that's worth double-checking.

Each pad on the board gets a Port object and a corresponding voltage source in SPICE, with a new unique net name.

# class LumpedComponent(object):
# """
#
# See "The use of SPICE lumped circuits as sub-grid models for FDTD analysis", doi:10.1109/75.289516
# which deals with lumped elements of a single-cell size, and

# "Incorporating non-linear lumped elements in FDTD: the equivalent source method", Jason Mix
# http://ecee.colorado.edu/microwave/docs/publications/1999/IJNM_JMjdMPM_99.pdf
# which deals with objects of arbitrary size.
#
# You can use this 'equivalent source method' either by line-integrating the currents around a conductor
# and setting the electric field, or by line-integrating the voltage and setting the magnetic field.
#
# I chose the latter because it seems to make more sense to set a voltage initial-condition in SPICE than a current.
#
# 1. Normal electric field update.
# 2. Obtain terminal voltages by an electric field line integration from one port to another.
# 3. Normal magnetic field update.
# 4. Obtain the lumped currents from the voltages - either via SPICE or via analytic expressions for each component
# 5. Set H along a contour enclosing the conductor to net_current / Lc
# 6. ...
# 7. Profit!
#
#
# """




# Usage

Install 'fdtd'

https://fdtd.readthedocs.io/en/latest/

version used is that in Programs/flaport

pip install cairosvg

Export SVG from freecad - hidden text can make the svg's size weird

if in conda, tests have to be run with

'python -m pytest'

with -s perhaps for console output

pip install pyevtk



1. Design your schematic and PCB normally. Set the SPICE models in KiCAD.
2. Set the aux axis origin precisely on the top left corner of the board geometry.
2. Export an SVG in KiCAD. Check "Only board area".
3. Disable any SPICE components not participating in the simulation.
4. Export a SPICE netlist.
5. Fix the netlist if required. Some voltage sources may need the gnd parameter added.

Slowing down over time.


    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
    1026/1    0.004    0.000   60.744   60.744 {built-in method builtins.exec}
         1    0.022    0.022   60.744   60.744 simple_FDTD.py:1(<module>)
       395    0.009    0.000   52.338    0.133 PCB_extensions.py:459(step)
     21332   26.714    0.001   26.961    0.001 ngspyce.py:40(cmd)
       395    0.030    0.000   21.355    0.054 PCB_extensions.py:319(set_spice_voltages)
     20540    0.101    0.000   21.325    0.001 PCB_extensions.py:342(set_spice_voltage)
       395   13.821    0.035   16.676    0.042 PCB_extensions.py:185(compute_all_voltages)
       394    0.002    0.000    4.124    0.010 PCB_extensions.py:350(run_spice_step)
         2    0.031    0.015    3.687    1.843 PCB_extensions.py:243(dump_to_vtk)
         2    0.000    0.000    3.474    1.737 hl.py:122(gridToVTK)
        12    0.000    0.000    3.453    0.288 vtk.py:408(appendData)
        12    2.803    0.234    3.453    0.288 evtk.py:56(writeArrayToFile)
         2    0.000    0.000    3.453    1.727 hl.py:56(_appendDataToFile)
     20624    2.245    0.000    2.855    0.000 {built-in method builtins.sum}
       394    2.290    0.006    2.290    0.006 PCB_extensions.py:207(apply_all_currents)
       394    0.031    0.000    2.090    0.005 grid.py:301(update_H)
       395    0.025    0.000    2.061    0.005 grid.py:275(update_E)
         1    1.444    1.444    1.995    1.995 PCB_extensions.py:166(construct_copper_geometry_from_svg)
       395    1.761    0.004    1.761    0.004 PCB_extensions.py:235(zero_conductor_fields)
      2364    1.694    0.001    1.694    0.001 boundaries.py:449(update_phi_H)
       852    0.002    0.000    1.663    0.002 backend.py:214(zeros)
       852    1.660    0.002    1.661    0.002 {built-in method zeros}
         1    0.001    0.001    1.657    1.657 PCB_extensions.py:142(initialize_grid_with_svg)
         1    0.000    0.000    1.656    1.656 PCB_extensions.py:87(initialize_grid)
      2370    1.649    0.001    1.649    0.001 boundaries.py:421(update_phi_E)
         1    0.001    0.001    1.638    1.638 grid.py:93(__init__)
       396    0.001    0.000    1.628    0.004 PCB_extensions.py:345(reset_spice)
        42    0.001    0.000    1.019    0.024 __init__.py:1(<module>)
     779/7    0.003    0.000    0.834    0.119 <frozen importlib._bootstrap>:978(_find_and_load)
     773/7    0.003    0.000    0.834    0.119 <frozen importlib._bootstrap>:948(_find_and_load_unlocked)
     727/7    0.003    0.000    0.834    0.119 <frozen importlib._bootstrap>:663(_load_unlocked)
     962/7    0.000    0.000    0.834    0.119 <frozen importlib._bootstrap>:211(_call_with_frames_removed)
     662/7    0.002    0.000    0.834    0.119 <frozen importlib._bootstrap_external>:722(exec_module)
         1    0.000    0.000    0.827    0.827 PCB_extensions.py:1(<module>)
         1    0.000    0.000    0.773    0.773 grid.py:6(<module>)
        24    0.513    0.021    0.513    0.021 {built-in method _struct.pack}
    164320    0.492    0.000    0.492    0.000 tensor.py:468(<lambda>)
         1    0.000    0.000    0.443    0.443 __init__.py:63(svg2png)
         1    0.000    0.000    0.443    0.443 surface.py:111(convert)
    455/65    0.001    0.000    0.414    0.006 {built-in method builtins.__import__}
         1    0.000    0.000    0.394    0.394 typing.py:1(<module>)
