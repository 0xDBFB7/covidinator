GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


$GMX_DIR/gmx_mpi genion -neutral -s output/s3/solvated_bilayer.tpr -p output/topol.top -o output/s4/solvated_ionized.gro
