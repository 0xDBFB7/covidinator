GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"

rm ./output/s7/*

cp s7_normal_modes.mdp output/s6/s7_normal_modes.mdp
$GMX_DIR/gmx_mpi grompp -f output/s6/s6_run_settings.mdp -c ./output/s6/equilibriated.pdb -p output/topol.top -o ./output/s7/bilayer.tpr

#need 100,000 samples at 10 fs/sample to get 1 GHz freq. reolutio
# that's a lot of data on disk

cd output/s7
$GMX_DIR/gmx_mpi mdrun -nsteps 1000 -s bilayer.tpr -v -c equilibriated.pdb -o trajectory.trr -e ener.edr -g md.log

cd ../../

#obtain a subset of trajectories
gmx make_ndx -natoms 1000 -f ./output/s6/equilibriated.pdb -o ./output/s7/subset.ndx

#select group 2, POPC (might change)
echo "2" | $GMX_DIR/gmx_mpi trjconv -n ./output/s7/subset.ndx -f output/s6/traj_comp.xtc -s output/s6/bilayer.tpr -o output/s6/trajectory.pdb
