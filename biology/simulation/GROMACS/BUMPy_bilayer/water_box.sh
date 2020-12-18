GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#insane -x 10 -y 10 -z 10 -pbc cubic  -o waterbox.pdb

$GMX_DIR/gmx_mpi editconf -box 35 -f membrane.pdb -o centered.pdb -bt cubic

$GMX_DIR/gmx_mpi solvate -cs polarize-water.gro -cp centered.pdb -p topol.top -o solvated.pdb -shell 30
