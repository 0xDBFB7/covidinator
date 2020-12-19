package require specden
package require multiplot

# https://www.ks.uiuc.edu/Research/vmd/plugins/signalproc/
# https://lammps.sandia.gov/threads/msg09794.html
set mol [mol new {output/s5/solvated_ionized_minimized.pdb} waitfor all]
mol addfile {output/s6/traj_comp.xtc} waitfor all

set sel [atomselect $mol "resid 25"]
set nf [molinfo $mol get numframes]

set a 0
set dlist {}
for {set f 0} {$f < $nf} {incr f} {
    $sel frame $f
    lappend dlist [lindex [$sel get {x y z}] $a]
}

lassign [specden $dlist 400.0 3000.0 harm 330.0 1] flist slist

#set ph [multiplot -x $flist -y $slist -title "EKINC Power Spectrum" -lines -linewidth 3 -marker points -plot]

#$ph add $flist $slist -lines -linecolor red -linewidth 3 -plot

#mol delete 0
#mol delete 1
