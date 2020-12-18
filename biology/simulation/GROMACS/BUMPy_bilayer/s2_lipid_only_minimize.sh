GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#$GMX_DIR/gmx_mpi genion -p topol.top

#gmx grompp -f polarize-water.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

$GMX_DIR/gmx_mpi grompp -f settings.mdp -c membrane.pdb -p topol.top -o bilayer.tpr

#$GMX_DIR/gmx_mpi mdrun -deffnm dppc-min-init -v -c 128_minimized.gro

#"Perform a short energy minimization of the system containing only the lipids;
#the only reason for doing this, is getting rid of high forces
#between beads that may have been placed quite close to each other. "
