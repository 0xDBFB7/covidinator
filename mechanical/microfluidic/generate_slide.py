from solid import *
from solid.utils import *
# pip install git+https://github.com/SolidCode/SolidPython.git
import os

OPENSCAD_BINARY = "~/Programs/OpenSCAD-2019.05-x86_64.AppImage"
#OpenSCAD 2015 doesn't add units to SVG output.

#Mylar 0.10mm -
#9495MP 0.14mm - channel
#Mylar 0.10mm - channel
#9495MP 0.14mm - channel
#Mylar 0.10mm

thicknesses = [0.10, 0.14]

FRAME_WIDTH = 50.0
FRAME_THICKNESS = 3.175
FRAME_X_MARGIN = 8.0
FRAME_END_MARGIN = FRAME_WIDTH / 2
CENTERLINE = FRAME_WIDTH / 2.0

WINDOW_WIDTH = 10.0

O_RING_OD = 4.15 # McMaster-Carr 003 size Viton O-ring
O_RING_PORT_SIZE = 1.5
SYRINGE_OD = 1.8
O_RING_THICKNESS = 1.5

TEXT_SIZE = 3

ID = 0

IR_ENCODER_SLIT_WIDTH = 0.1
IR_ENCODER_SLIT_LENGTH = 5

CHANNEL_WIDTH = 0.2

NUM_CUVETTES = 10
CUVETTE_SPACING = 4.0 # between
CUVETTE_LENGTH = 5.0
CUVETTE_WIDTH = 0.8

LEADER_HOLE_DIA = 2.0

FRAME_LENGTH = ((CUVETTE_WIDTH/2.0) + CUVETTE_SPACING) * (NUM_CUVETTES) + 3.0*LEADER_HOLE_DIA + FRAME_END_MARGIN

layer_0 = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
layer_0 -= translate([1,1])(text("0 M 0", TEXT_SIZE))
layer_0 -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))

layer_1 = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
layer_1 -= translate([1,1])(text("1 A", TEXT_SIZE))
layer_1 -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))

layer_2 = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
layer_2 -= translate([1,1])(text("2 M", TEXT_SIZE))
layer_2 -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))

layer_3 = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
layer_3 -= translate([1,1])(text("3 A", TEXT_SIZE))
layer_3 -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))

frame = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
frame -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))
frame = linear_extrude(height=FRAME_THICKNESS, center=False)(frame)

for i in range(0, NUM_CUVETTES):
    window_length = CUVETTE_SPACING / 2
    cuvette_y_centerline = NUM_CUVETTES*CUVETTE_SPACING + window_length/2.0 + FRAME_END_MARGIN

    ir_encoder_slit = square([IR_ENCODER_SLIT_WIDTH,IR_ENCODER_SLIT_LENGTH],center=False)
    ir_encoder_slit = translate([CENTERLINE+WINDOW_WIDTH/2-IR_ENCODER_SLIT_WIDTH, \
                                    cuvette_y_centerline-window_length/2+1])(ir_encoder_slit)

    cuvette_features = ir_encoder_slit

    layer_0 -= cuvette_features
    layer_1 -= cuvette_features
    layer_2 -= cuvette_features

    frame -= cylinder(1)






header = '$fa = 0.1;\n$fs = 0.1;'
scad_render_to_file(layer_0, 'output/layer_0.scad', file_header = header)
scad_render_to_file(frame, 'output/frame.scad', file_header = header)
os.system(f"{OPENSCAD_BINARY} output/layer_0.scad -o output/layer_0.svg")
os.system(f"{OPENSCAD_BINARY} output/frame.scad -o output/frame.stl")
