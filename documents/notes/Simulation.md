Simulation

## Simulation

The s3d version of cm2 doesn't seem to work on this machine. using the latest other one.

We'll probably want to compare with the AFM force results to make sure we're doing 
https://www.researchgate.net/post/Anybody_knows_how_to_model_AFM_tip_in_MD_simulation_packages

The T4 phage capsid is made up of gp23 ( and gp24 (PDB:1YUE) proteins. 

http://www.gromacs.org/Documentation/How-tos/Steps_to_Perform_a_Simulation

"What determines how rigid the capsid is? To answer this question, a icosahedral capsids of a number of viruses were simulated, with the sizes from 17 to 75 nm, over times of 5 to 25 microseconds. Presently, all-atom simulation of any of these viruses on a microsecond timescale would be technically impossible; the CG technique is therefore playing here a role of the bridge that helps to transfer the knowledge about the atomistic structure of the studied system into the knowledge about the large-scale movements of the system."

" Furthermore, the lambda and phi29 capsids break at indentations of 20-25 % of their radius and show material fatigue under repeated small indentations."

http://www.ks.uiuc.edu/Research/STMV/

Aha! That could be the mechanism behind long durations. 

*"Kalzium and Avogadro programs"*

To install Avogadro, needed openbabel.

We could just model the membrane and payload with FEM or something; but I'm a bit concerned about the polarity and charge distribution.

The payload DNA inside the capsid can greatly modify the stiffness of the capsid.

"proheads would still recover to their normal height after such large deformations, even after pushing repetitively, tens of times, on the same location. Height recovery took place faster than 4 ms, and thus the relaxation time of the proheads was less than that. At forces beyond ≈2.8 nN, there were significant deviations from linearity, with the slope of the FZ curves decreasing (Fig. 4A )."

What sort of motion would speed up fatigue? How can we test if fatigue is even the regime that we're interested in? Timing before fracture?

But these guys just sim'd the capsid whole. Huh.

https://pure.aston.ac.uk/ws/portalfiles/portal/24464574/Details_of_charge_distribution_in_stable_viral_capsid.pdf

DNA has a negative charge, the quantity of which is pretty hard to tease out but probably around 0.1e- per BP.

The T4 is basically exactly the same size as COVID.

Tried VMD, didn't start, gave up. LAMMPS, AMBER, 

The inside of the phage capsid is under huge pressure - like 60 atm. Neat!

"The Lennard-Jones potential is totally inadequate for open shell systems,
in which strong localized bonds are formed."
http://phys.ubbcluj.ro/~tbeu/MD/C2_for.pdf

this sort of coarse sim is called a "bead-spring" sim or "bead-spring polymer"

https://lammps.sandia.gov/threads/msg79913.html

"In that case, for a coarse-grained model such as this, I suggest
either moltemplate or topotools.  (Disclaimer: I wrote one of these
tools.)"

LAMMPS et al just take a file with positions of atoms and bond directions etc. There's a step called "solvation" which adds the solvent (water etc) surrounding the atom

PACKMOL
http://www.moltemplate.org/

LAMMPS has a larger userbase, but stuff like variable e-fields seem to be more difficult. Let's see how gromacs fares.

http://manual.gromacs.org/documentation/2019/reference-manual/functions/bonded-interactions.html

[https://sci-hub.tw/https://ieeexplore.ieee.org/document/4121581](https://sci-hub.tw/https://ieeexplore.ieee.org/document/4121581)

- OpenMM: No provisions for time-varying electric field

- HOOMD-blue: No provisions for importing PDB, but that's easy to work around. Time-varying external forces looks pretty tricky, however.

- ProtoMD?

- 

- Warp with EM3D() will probably work for triode sim

Okay, so what do we actually need from the software?

- Charge on particles - coulomb interaction.

- Add charged particles to the inside core

- Measuring the force requires an AFM model sim (still doable, sphere?), but since we have stiffness and Young's Modulus values
  
  we can just move an atom on the periphery slightly 

- Export in XYZ etc.

---

Maintaining a base of scientific software, with conflicting dependencies and things, is becoming something of a pain. I'm not sure that docker is a great solution for this - mounting directories is a little clunky, etc. 

What about using a bare debian debootstrap chroot for each piece of software, with a bind-mount for data?

Indeed, this works great. Installed openEMS on a *jessie* chroot, where it was originally developed.

For our software, might it be a good idea to package and redistribute everything as a static, internal library, where the library version is controlled by the distributor? How'd that work even work?

I mean, all these developer hours working on dependency versioning issues are pretty much wasted. Almost all the libraries have permissive redistribute licensing anyhow. I guess this becomes a bit too complex in the case of something like openEMS, since there's just hundreds of dependencies.

If anything, distributing a "known good" reference package would be helpful.

-----

[http://octa.jp/components/cognac/](http://octa.jp/components/cognac/) looks pretty neat.

**Molecular dynamics**, noun

The art of making avogadro's constant equal to planck's constant equal about 1 by the straightforward process of scaling distance by energy, time by the fine structure constant, and telling space to get knotted.

"normal units" is a misnomer.

[https://en.wikipedia.org/wiki/Hartree_atomic_units](https://en.wikipedia.org/wiki/Hartree_atomic_units)

#### 

copied 'script' from util-linux to /usr/bin/.

Zotero RDF reader: [https://gist.github.com/rlskoeser/d18c19a8351d97ca933b64fd26048b98](https://gist.github.com/rlskoeser/d18c19a8351d97ca933b64fd26048b98)

----

Had significant trouble with the velocity Verlet integrator. First there was a bug in the inter-particle force function when OpenMP was enabled - forces were shared which shouldn't have been. Then the timestep was a few orders of magnitude too large.

Writing my own sim was probably the wrong decision, I've spent perhaps a week on this now.

Running the sim with sudo greatly increases the variance in the performance. How strange!

-----

Switching to GCC 7.3 - with updated OpenMP 4.5 - finally established linear scaling with omp_thread_count. Peaks at 15, as expected.

There's also a lot of variance; and the program distinctly slows down at about 41,000 iterations. Almost seems like thermal throttling? No, definitely not. Valgrind says there's a mem-leak. It's not writes to disk.

Essentially no difference between -O2 vs -O3 

aah stuck in the darned weeds now.

Aha! After 42000 iterations, it runs into a nan. Why? Where did that come from?

man, why didn't I just use an existing library like mdcore for the real MD part

that was so stupid

RUMD: great! Python  but no provisions for external forces, or direct access.

james is working now, pretty slow at 500 particles (1.5 ms / cycle), still some instability but damping really helps. Anhedrals would also help.

There's an OpenMM installed in conda, but I'm using the ~/Programs version.

[http://docs.openmm.org/latest/userguide/theory.html#writing-custom-expressions](http://docs.openmm.org/latest/userguide/theory.html#writing-custom-expressions)

openmm's variable verlet integrator is very nice -  should use that somewhere else
