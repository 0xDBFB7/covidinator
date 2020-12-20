#set terminal svg
#set output "output/s8/spectrum.svg"

set datafile separator ";"
set xrange [0:250]
plot 'output/s8/power_spectrum_global.csv'  using ($1*29.9):2
pause -1
