rm output/topol.top
rm output/s*/*

insane -l PUPI:1 -l POPC:3 -x 10 -y 10 -z 8 -o ./output/s0/bilayer.pdb
#POPC PUPI
#had a problem where the wrapped had gaps: manually setting the size here fixed that.


# TO alter lipid:
