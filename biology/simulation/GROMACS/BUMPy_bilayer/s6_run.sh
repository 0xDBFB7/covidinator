GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


#$GMX_DIR/gmx_mpi genion -p topol.top

#gmx grompp -f polarize-water.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

rm ./output/s6/*

cp s6_run_settings.mdp output/s6/s6_run_settings.mdp
$GMX_DIR/gmx_mpi grompp -f output/s6/s6_run_settings.mdp -c ./output/s5/solvated_ionized_minimized.pdb -p output/topol.top -o ./output/s6/bilayer.tpr
cd output/s6
$GMX_DIR/gmx_mpi mdrun -s bilayer.tpr -v -c run.pdb -o trajectory.trr -e ener.edr -g md.log

#"Perform a short energy minimization of the system containing only the lipids;
#the only reason for doing this, is getting rid of high forces
#between beads that may have been placed quite close to each other. "