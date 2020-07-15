from solid import *
from solid.utils import *
# pip install git+https://github.com/SolidCode/SolidPython.git
import os

OPENSCAD_BINARY = "~/Programs/OpenSCAD-2019.05-x86_64.AppImage"
#OpenSCAD 2015 doesn't add units to SVG output.

FRAME_WIDTH = 50
FRAME_HEIGHT = 1.58

CUVETTE_LENGTH = 5

WINDOW_LENGTH = 10


layer_0 = square(10)

frame = linear_extrude(height=FRAME_HEIGHT, center=False)(layer_0)

scad_render_to_file(layer_0, 'output/layer_0.scad')
scad_render_to_file(frame, 'output/frame.scad')
os.system(f"{OPENSCAD_BINARY} output/layer_0.scad -o output/layer_0.svg")
os.system(f"{OPENSCAD_BINARY} output/frame.scad -o output/frame.stl")
