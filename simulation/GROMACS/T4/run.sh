
cd run

gmx_mpi -quiet editconf -f ../input_data/emd_6323.pdb -o test.gro -box 10 10 10 #nanometers
gmx_mpi -quiet grompp -f ../T4.mdp -p ../T4.top -c test.gro -po mdout.mdp -o topol.tpr
gmx_mpi -quiet mdrun -s topol.tpr -x trajectory.xtc


gmx_mpi -quiet trajectory -f trajectory.xtc -ox trajectory.xvg -n ../index.ndx -fgroup CGB -s topol.tpr
gmx_mpi -quiet analyze -f trajectory.xvg -msd


#gmx_mpi -quiet trjconv -f traj_comp.xtc -o trj.trr

#~/Programs/chimera_daily/bin/chimera traj_comp.xtc
