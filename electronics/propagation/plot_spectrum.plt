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
set title "test"

set cbrange [0:0.01]
set logscale cb

set multiplot layout 2,2
#to plot simultaneously, use \, remove splot.
set zrange [0:1]
splot 'pretty_output_1.csv'  using 1:2:3  with lines palette
set zrange [-1:1]
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
