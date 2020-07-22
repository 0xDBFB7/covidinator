from solid import *
from solid.utils import *
# pip install git+https://github.com/SolidCode/SolidPython.git
import os
from math import log2
#when-changed generate_slide.py -v -c "python %f"

OPENSCAD_BINARY = "~/Programs/OpenSCAD-2019.05-x86_64.AppImage"
#OpenSCAD 2015 doesn't add units to SVG output.

#Mylar 0.10mm -
#9495MP 0.14mm -
#Mylar 0.10mm -
#9495MP 0.14mm
#Polycarbonate 3.175 mm

thicknesses = [0.10, 0.14]

FRAME_WIDTH = 50.0
FRAME_THICKNESS = 3.175
FRAME_X_MARGIN = 8.0
FRAME_END_MARGIN = FRAME_WIDTH / 2
CENTERLINE = FRAME_WIDTH / 2.0

WINDOW_WIDTH = 20.0

O_RING_OD = 4.15 # McMaster-Carr 003 size Viton O-ring
O_RING_PORT_SIZE = 1.8
SYRINGE_OD = 1.8
O_RING_THICKNESS = 1.8

TEXT_SIZE = 3

ID = 0

IR_ENCODER_SLIT_WIDTH = 5
IR_ENCODER_SLIT_LENGTH = 0.1

CHANNEL_WIDTH = 0.3

NUM_CUVETTES = 2**4
CUVETTE_SPACING = 5 # center-to-center
CUVETTE_LENGTH = 0.8
CUVETTE_WIDTH = 10
CUVETTE_THICKNESS = 0.14 + 0.1 + 0.14

LEADER_HOLE_DIA = 2.0

total_cuvette_volume = NUM_CUVETTES * CUVETTE_LENGTH * CUVETTE_WIDTH * CUVETTE_THICKNESS
print(total_cuvette_volume * 0.001)

CULTURE_CUVETTE_X = CUVETTE_WIDTH
culture_cuvette_y = total_cuvette_volume / CUVETTE_THICKNESS / CULTURE_CUVETTE_X


FRAME_LENGTH = ((CUVETTE_LENGTH/2.0) + CUVETTE_SPACING) * (NUM_CUVETTES) + 2*FRAME_END_MARGIN

print(FRAME_WIDTH, FRAME_LENGTH)
print((NUM_CUVETTES-1)*CUVETTE_SPACING + culture_cuvette_y)

window_length = CUVETTE_SPACING / 1.5


layer_0 = square([FRAME_WIDTH, FRAME_LENGTH],center=False)
# layer_0 -= translate([1,1])(text("0 M" + str(ID), TEXT_SIZE))
# layer_0 -= translate([CENTERLINE,FRAME_LENGTH - (LEADER_HOLE_DIA*1.5)])(circle(d=LEADER_HOLE_DIA))

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

def tree(n, spacing, segment_length):
    #Regnier bifurcating distributor
    #binary tree

    num_hierarchies = int(log2(n))
    #input thingy
    tree = translate([-segment_length, n*spacing - spacing])(\
        square([segment_length, CHANNEL_WIDTH],center=False))
    for i in range(0, num_hierarchies):

        for j in range(0, int(2**i)):
            print(i)
            segment_start = (j * ((n*spacing)/(int(2**i)/2))) + (spacing*n / int(2**i) / 2) - spacing
            tree += translate([i*segment_length, segment_start])(\
                    square([CHANNEL_WIDTH, spacing * 2**(num_hierarchies-i)],center=False))

            channel = square([segment_length, CHANNEL_WIDTH], center=False)
            channel = translate([i*segment_length, segment_start])(channel)
            channel_2 = square([segment_length, CHANNEL_WIDTH], center=False)
            channel_2 = translate([i*segment_length, segment_start + spacing * 2**(num_hierarchies-i)])(channel_2)
            tree += channel + channel_2

    return tree, num_hierarchies

for i in range(0, NUM_CUVETTES):
    cuvette_y_centerline = i*(CUVETTE_SPACING) + window_length/2.0 + FRAME_END_MARGIN

    ir_encoder_slit = square([IR_ENCODER_SLIT_WIDTH,IR_ENCODER_SLIT_LENGTH],center=False)
    ir_encoder_slit = translate([CENTERLINE+WINDOW_WIDTH/2-IR_ENCODER_SLIT_WIDTH, \
                                    cuvette_y_centerline-window_length/2])(ir_encoder_slit)

    cuvette = square([CUVETTE_WIDTH,CUVETTE_LENGTH],center=False)
    cuvette += translate([CUVETTE_WIDTH+1, 0])(
                    square([CUVETTE_WIDTH,CUVETTE_LENGTH],center=False))
    cuvette += translate([-CUVETTE_WIDTH-1, 0])(
                    square([CUVETTE_WIDTH,CUVETTE_LENGTH],center=False))
    cuvette = translate([CENTERLINE-(CUVETTE_WIDTH/2), cuvette_y_centerline-(CUVETTE_LENGTH/2)])(cuvette)
    #
    # port_2 = translate([CENTERLINE+WINDOW_WIDTH/2 + CUVETTE_WIDTH/1.5 + O_RING_OD, cuvette_y_centerline+CUVETTE_LENGTH*3])(\
    #             circle(d=SYRINGE_OD))
    # frame -= linear_extrude(height=FRAME_THICKNESS, center=False)(port_2)
    # frame -= translate([CENTERLINE+WINDOW_WIDTH/2 + CUVETTE_WIDTH/1.5 + O_RING_OD, cuvette_y_centerline+CUVETTE_LENGTH*3])(\
    #             cylinder(d=O_RING_OD, h=O_RING_THICKNESS, center=False))

    # port_x = CENTERLINE+WINDOW_WIDTH/2 + 1 + O_RING_OD*1.5+(i%2)
    port_x = CENTERLINE+WINDOW_WIDTH/2 + O_RING_OD*1.5
    port_1 = translate([port_x, cuvette_y_centerline])(
                circle(d=SYRINGE_OD))
    frame -= linear_extrude(height=FRAME_THICKNESS, center=False)(port_1)
    frame -= translate([port_x, cuvette_y_centerline])(\
                cylinder(d=O_RING_OD, h=O_RING_THICKNESS, center=False))

    port_x = CENTERLINE-WINDOW_WIDTH/2 - O_RING_OD*1.5
    port_2 = translate([port_x, cuvette_y_centerline])(
                circle(d=SYRINGE_OD))
    frame -= linear_extrude(height=FRAME_THICKNESS, center=False)(port_2)
    frame -= translate([port_x, cuvette_y_centerline])(\
                cylinder(d=O_RING_OD, h=O_RING_THICKNESS, center=False))


    port_channel_1 = translate([port_x, cuvette_y_centerline])(\
                    square([CUVETTE_WIDTH*3,CHANNEL_WIDTH],center=False))
    #
    # port_channel_2 = translate([CENTERLINE+WINDOW_WIDTH, cuvette_y_centerline+CUVETTE_LENGTH*3])(\
    #                 square([CUVETTE_WIDTH/2+2,CHANNEL_WIDTH],center=False))
    #
    # channel_3 = translate([CENTERLINE-WINDOW_WIDTH/2, cuvette_y_centerline])(\
    #                 square([CHANNEL_WIDTH, CUVETTE_LENGTH*3],center=False))
    #

    # cuvette_features = ir_encoder_slit + cuvette + port_1 + port_2 + channel_3

    layer_1 -= cuvette + port_1 + port_channel_1 + port_2
    layer_2 -= port_1 + port_2
    layer_3 -= port_1 + port_2



    window = square([WINDOW_WIDTH, window_length])
    window = translate([CENTERLINE-WINDOW_WIDTH/2, cuvette_y_centerline-(window_length/2.5)])(window)
    layer_3 -= window
    frame -= linear_extrude(height=FRAME_THICKNESS, center=False)(window)
    # layer_1 -= window

    # frame -= translate([CENTERLINE+WINDOW_WIDTH/2 + O_RING_OD*1.5, cuvette_y_centerline])(\
    #             cylinder(d=O_RING_OD, h=O_RING_THICKNESS, center=False))

# tree_segment_length = 3
# bacteria_tree, num_hierarchies = tree(NUM_CUVETTES, CUVETTE_SPACING/2, tree_segment_length)
# layer_1 -= translate([CENTERLINE - (3*(num_hierarchies+1)),window_length/2.0 + FRAME_END_MARGIN])(bacteria_tree)
# # layer_2 -= translate([CENTERLINE - (13),window_length/2.0 + FRAME_END_MARGIN])(bacteria_tree)
#
# port_1 = translate([CENTERLINE - (3*(num_hierarchies+1)), FRAME_END_MARGIN+(((NUM_CUVETTES)*CUVETTE_SPACING)/2)-0.5])(
#             circle(d=SYRINGE_OD))
# frame -= linear_extrude(height=FRAME_THICKNESS, center=False)(port_1)
# layer_1 -= port_1
# layer_2 -= port_1
# layer_3 -= port_1
# frame -= translate([CENTERLINE - (3*(num_hierarchies+1)), FRAME_END_MARGIN+(((NUM_CUVETTES)*CUVETTE_SPACING)/2)-0.5])(\
#             cylinder(d=O_RING_OD, h=O_RING_THICKNESS, center=False))


#This should be re-written with
# matrix multiply mask operations for each layer; window*[false, false, false, true]
# oop objects


layer_1 = layer_0 - layer_1
layer_2 = layer_0 - layer_2
layer_3 = layer_0 - layer_3

header = '$fa = 0.5;\n$fs = 0.5;'
scad_render_to_file(layer_0, 'output/layer_0.scad', file_header = header)
scad_render_to_file(layer_1, 'output/layer_1.scad', file_header = header)
scad_render_to_file(layer_2, 'output/layer_2.scad', file_header = header)
scad_render_to_file(layer_3, 'output/layer_3.scad', file_header = header)

scad_render_to_file(frame, 'output/frame.scad', file_header = header)
os.system(f"{OPENSCAD_BINARY} output/layer_0.scad -o output/layer_0.svg")
os.system(f"{OPENSCAD_BINARY} output/layer_1.scad -o output/layer_1.svg")
os.system(f"{OPENSCAD_BINARY} output/layer_2.scad -o output/layer_2.svg")
os.system(f"{OPENSCAD_BINARY} output/layer_3.scad -o output/layer_3.svg")
os.system(f"{OPENSCAD_BINARY} output/frame.scad -o output/frame.stl")

# os.system("xsltproc --stringparam stroke-width 0px svglinewidth.xsl output/layer_0.svg > output/layer_0.svg")
# os.system("xsltproc --stringparam stroke-width 0px svglinewidth.xsl output/layer_1.svg > output/layer_1.svg")

os.system('find output/ -type f -exec sed -i \'s/stroke-width="0.5"/stroke-width="0"/g\' {} \;')
os.system('find output/ -type f -exec sed -i \'s/fill="lightgray"/fill="black"/g\' {} \;')




#meshlab output/frame.stl
#xdg-open layer_0.svg

# p = subprocess.Popen(['mvn', 'surfire:test'])
# try:
#     p.wait(my_timeout)
# except subprocess.TimeoutExpired:
#     p.kill()
