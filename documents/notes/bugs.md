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



## Issue:

Program inexplicably slowed down after 42000 iterations - the timing jumped from 150 us to 450 us.

Thought it might be a memleak breaking out of a cache, some disk cache filling up, etc - however, it turned out that everything went NAN at exactly that point. 

Leaning on instrumentation, our old pal dursi has a great tip, using the fenv.h exceptions:

[https://www.dursi.ca/post/stopping-your-program-at-the-first-nan.html](https://www.dursi.ca/post/stopping-your-program-at-the-first-nan.html)

At that point a gdb backtrace was enlightening.

The cause was an acos call that went beyond -1, to -1.00000012.

wait, what? 


