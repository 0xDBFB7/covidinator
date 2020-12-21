
set datafile separator ";"
set xrange [0:250]

set key off
#set ylabel " (arbitrary units)"
set xlabel "Frequency (GHz)"

plot 'output/s8/power_spectrum_global.csv'  using ($1*29.9):2 with lines

set terminal svg
set output "output/s8/spectrum.svg"


plot 'output/s8/power_spectrum_global.csv'  using ($1*29.9):($2/GPVAL_DATA_Y_MAX) with lines
#set yrange [0:1.2]
pause -1
