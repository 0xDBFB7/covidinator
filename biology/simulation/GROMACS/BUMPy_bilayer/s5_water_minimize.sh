GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#$GMX_DIR/gmx_mpi genion -p topol.top

#gmx grompp -f polarize-water.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

rm ./output/s2/*


$GMX_DIR/gmx_mpi grompp -f s2_minimize_settings.mdp -c ./output/s1/membrane.pdb -p output/topol.top -o ./output/s2/bilayer.tpr

$GMX_DIR/gmx_mpi mdrun -s ./output/s2/bilayer.tpr -v -c ./output/s2/minimized_bilayer.pdb -o ./output/s2/minimized_energy.trr -e ./output/s2/ener.edr -g ./output/s2/md.log

#"Perform a short energy minimization of the system containing only the lipids;
#the only reason for doing this, is getting rid of high forces
#between beads that may have been placed quite close to each other. "
