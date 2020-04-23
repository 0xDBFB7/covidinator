#### 

#### Issue:

Location of <vector> allocation caused OpenMD to share, causing phantom forces.

##### Discovery

##### Solution

### Issue:

Strange spikes of "noise" were appearing in random places in what was otherwise a perfectly smooth simulation. It was thought that unallocated memory was bleeding in, but

OMP_NUM_THREADS=1 solved the problem. There must be a race condition or something I missed.

It's probably in the 

        stretchy_obj.compute_all_bonds(particles);

function.



#### Issue:

GCC 6 + gprof produces empty output - `-no-pie` flag is required

##### Discovery

##### Solution






