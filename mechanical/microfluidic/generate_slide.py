from solid import *
# pip install git+https://github.com/SolidCode/SolidPython.git
import os



d = square(10)



scad_render_to_file(d, 'output.scad')
os.system("openscad output.scad -o output.svg")

#
#
# import drawSvg as draw
#
# d = difference()(
#     cube(10),
# )
#
#
# d = draw.Drawing(200, 100, origin='center', displayInline=False)
#
#
# # Draw a rectangle
# d.append(draw.Rectangle(0,0,40,50, fill='#1248ff'))
#
#
# d.setPixelScale(2)  # Set number of pixels per geometry unit
# #d.setRenderSize(400,200)  # Alternative to setPixelScale
# d.saveSvg('example.svg')
# d.savePng('example.png')
