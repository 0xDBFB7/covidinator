GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"

rm ./output/s7/*

cp s7_normal_modes.mdp output/s7/s7_normal_modes.mdp
$GMX_DIR/gmx_mpi grompp -f output/s7/s7_normal_modes.mdp -c ./output/s6/equilibriated.pdb -p output/topol.top -o ./output/s7/bilayer.tpr

#need 100,000 samples at 10 fs/sample to get 1 GHz freq. reolutio
# that's a lot of data on disk

cd output/s7
$GMX_DIR/gmx_mpi mdrun -nsteps 1000 -s bilayer.tpr -v -c equilibriated.pdb -o trajectory.trr -e ener.edr -g md.log

cd ../../

#obtain a subset of trajectories
#$GMX_DIR/gmx_mpi make_ndx -natoms 1000 -f ./output/s6/equilibriated.pdb -o ./output/s7/subset.ndx

#select group 2, POPC (might change)
# with the _subset index file, if the first 500 atoms aren't POPC then water'll be analyzed which isn't great
echo "2" | $GMX_DIR/gmx_mpi trjconv -n normal_mode_subset.ndx -f output/s7/traj_comp.xtc -s output/s7/bilayer.tpr -o output/s7/trajectory.pdb




#--------------
#this stuff is no longer needed; travis has a cool zero-pad function for just this purpose.

#echo "2" | $GMX_DIR/gmx_mpi trjconv -b 10 -n normal_mode_subset.ndx -f output/s7/traj_comp.xtc -s output/s7/bilayer.tpr -o output/s7/last_frame.pdb

#pad with the last frame
#for i in {1..10000};do cat output/s7/last_frame.pdb >> output/s7/last_frame_duplicated.pdb; done

#cat output/s7/trajectory.pdb output/s7/last_frame_duplicated.pdb > output/s7/padded_trajectory.pdb

#probably pymol would be better but whatever
#sed -n '/REMARK    GENERATED BY TRJCONV/{:a;/ERROR SUMMARY/bb;N;ba;:b;$p;d}' infile


# gromacs hit me with H. H. Williams: Furious activity is no substitute for understanding.

# that's a good one
