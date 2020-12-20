GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"

# a short equilibration run

#$GMX_DIR/gmx_mpi genion -p topol.top

#gmx grompp -f polarize-water.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

rm ./output/s6/*

cp s6_run_settings.mdp output/s6/s6_run_settings.mdp
$GMX_DIR/gmx_mpi grompp -f output/s6/s6_run_settings.mdp -c ./output/s5/solvated_ionized_minimized.pdb -p output/topol.top -o ./output/s6/bilayer.tpr
cd output/s6

#short equilibration
$GMX_DIR/gmx_mpi mdrun -nsteps 500 -s bilayer.tpr -v -c equilibriated.pdb -o trajectory.trr -e ener.edr -g md.log


#$GMX_DIR/gmx_mpi mdrun -nsteps 15000 -s bilayer.tpr -v -c equilibriated.pdb -o trajectory.trr -e ener.edr -g md.log
#
#gmx trjconv -f output/s6/traj_comp.xtc -s output/s5/solvated_ionized_minimized.pdb equilibriated.pdb
#$GMX_DIR/gmx_mpi mdrun -nsteps 500 -s bilayer.tpr -v -c .pdb -o trajectory.trr -e ener.edr -g md.log
