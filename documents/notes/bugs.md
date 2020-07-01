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


############ ASDFasdklfalsdkfjasldkcu fuck

in tensor, indexing into a matrix like this works:

print(a[1,1,1])

but setting 

a[1,1,1] = 1

doesnTt? what

slice notatioport.N_x:port.N_x+1

#### Large values 

##### Issue

A non-normalized gaussian pulse with amplitude 3e8 V introduced numerical noise into 
the simulation which otherwise appeared to be a timestep issue.

##### Discovery 

##### Solution

Bounds-checking? Visibility of internal state?



#### High-level abstraction performance

The pytorch backend seems to introduce a bottleneck

A carefully-written routine of this sort should take 


A simulation wasn't corresponding to reality. It was found that, due to changing the reference design, the thicker substrate had caused the copper to go into the PML.

A simple geometry sanity check would have caught this much earlier.

#### A unit mistake 

The reciprocal of the spring constant in [Li] was about on the order of that in [Yang], so I assumed I had just missed a ^-1 somewhere and plugged it in.

Only on later checking did I realize that this was just pure numerology, and the two were
totally unrelated.



