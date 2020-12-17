GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#insane -x 100 -y 100 -z 100 -pbc cubic -sol W -o waterbox.pdb

$GMX_DIR/gmx_mpi solvate -cp membrane.pdb -p topol.top -o solvated.gro -shell 1
