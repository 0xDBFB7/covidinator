
GMX_DIR="/home/arthurdent/Programs/gromacs-2020.1/gromacs-2020.1/build/bin"


gmx genion -p topol.top

gmx grompp -f minimization.mdp -r system-genion.gro -c system-genion.gro -p system.top -o system_minimization.tpr

gmx grompp -f minimization.mdp -c 128_noW.gro -p dppc.top -o dppc-min-init.tpr

gmx mdrun -deffnm dppc-min-init -v -c 128_minimized.gro

#"Perform a short energy minimization of the system containing only the lipids;
#the only reason for doing this, is getting rid of high forces
#between beads that may have been placed quite close to each other. "
