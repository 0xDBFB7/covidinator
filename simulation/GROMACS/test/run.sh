#gmx_mpi pdb2gmx -f input_data/emd_6323.pdb -i coarse.itp
rm test.gro
rm \#*
gmx_mpi -quiet editconf -f test.pdb -o test.gro -box 5 5 5
gmx_mpi -quiet grompp -f test.mdp -p test.top -c test.gro
gmx_mpi -quiet mdrun -s topol.tpr
