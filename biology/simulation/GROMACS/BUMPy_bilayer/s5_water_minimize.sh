GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#$GMX_DIR/gmx_mpi genion -p topol.top

#gmx grompp -f polarize-water.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

rm ./output/s5/*


$GMX_DIR/gmx_mpi grompp -f s5_water_minimize_settings.mdp -r  ./output/s4/solvated_ionized.gro -c ./output/s4/solvated_ionized.gro -p output/topol.top -o ./output/s5/bilayer.tpr

$GMX_DIR/gmx_mpi mdrun -s ./output/s5/bilayer.tpr -v  -c ./output/s5/solvated_ionized_minimized.pdb -o ./output/s5/minimized_energy.trr -e ./output/s5/ener.edr -g ./output/s5/md.log

#"Perform a short energy minimization of the system containing only the lipids;
#the only reason for doing this, is getting rid of high forces
#between beads that may have been placed quite close to each other. "
