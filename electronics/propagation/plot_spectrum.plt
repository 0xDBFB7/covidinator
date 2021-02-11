set terminal svg
set output "propagated_waveforms.svg"

set key off
unset colorbox

set datafile separator ","


set pm3d at s hidden3d 100
set style line 100 lt 5 lw 0.5

#set key off
set zlabel ""

set ylabel "depth (m)"
set xlabel "time (s)"
set title ""



#set cbrange [0:0.005]
#set logscale cb

set multiplot layout 2,2
#to plot simultaneously, use \, remove splot.
set zrange [0:1]
set palette defined (0 "grey", 0.005 "red", 1 "blue" )

ntics = 2
stats 'pretty_output_1.csv' using 1 name 'x' nooutput
stats 'pretty_output_1.csv' using 2 name 'y' nooutput
stats 'pretty_output_1.csv' using 3 name 'z' nooutput
set xtics x_max/ntics
set ytics y_max/ntics

splot 'pretty_output_1.csv'  using 1:2:3  with lines palette


ntics = 2
stats 'pretty_output_2.csv' using 1 name 'x' nooutput
stats 'pretty_output_2.csv' using 2 name 'y' nooutput
stats 'pretty_output_2.csv' using 3 name 'z' nooutput
set xtics x_max/ntics
set ytics y_max/ntics


set zrange [-1:1]
set palette defined (-1 "blue", -0.005 "red", 0 "grey", 0.005 "red", 1 "blue" )

splot 'pretty_output_2.csv'  using 1:2:3  with lines palette
splot 'pretty_output_3.csv'  using 1:2:3  with lines palette

splot 'pretty_output_4.csv'  using 1:2:3  with lines palette

#unset multiplot
#set terminal x11
#set output
#set multiplot layout 2,2
# can't reset terminal
#replot

# with lines
pause -1
unset multiplot
