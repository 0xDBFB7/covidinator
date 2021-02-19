
This was a (in retrospect, misguided) project to determine if extremely high electric fields can produce mechanical stresses sufficient to break the viral membrane (so-called electroporation). This doesn't seem to be necessarily *completely* implausible, but it's sufficiently remote (and TRL 0) that I'm not super interested in continuing work on it given circumstances.

I am making this public strictly so that some of the methodology etc will be searchable: I would appreciate it if you don't cite or share this repo.

```
<3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3 
```

# [Terse summary (not entirely finished)](https://github.com/0xDBFB7/covidinator/releases/download/vx.x/summary.pdf) 
# [Full paper with some supplemental](https://github.com/0xDBFB7/covidinator/releases/download/vx.x/paper.pdf)

## References & Resources [HTML](https://raw.githubusercontent.com/0xDBFB7/covidinator/master/documents/references.html) | [Zotero (categories!)](https://raw.githubusercontent.com/0xDBFB7/covidinator/master/documents/references.rdf) | [BiBTeX](https://raw.githubusercontent.com/0xDBFB7/covidinator/master/documents/references.bib) 


Hi! Welcome! There's not a whole lot of real substance here, but maybe you'll find something useful. I hope you like it! 

```
<:  ^_^  :>  ^_^  :>  ^_^  :>  ^_^  :>  ^_^  :>  ^_^  :>  ^_^  <:
```

Things that are here:

 * A cheap (~$300) synchronous photon counting fluorescence reader - just a crappy plate reader/Gel-Doc/spectroflurometer without the spectro- part. 
    - Can instantly quantify sub-nanogram quantities of dsDNA using Biotium GelGreen (Xu et al's fast phage titer sampling, score!).
 * Li et al's 600-picosecond avalanche transistor Marx pulser
 * A few microbiology protocols - E. coli and T4 bacteriophage.
 * A cheap (~$300) 6-12 GHz microwave absorption spectrometer / scalar network analyzer. Almost useless for small signals, does not provide the SNR required for biological purposes, don't build one.
    - firmware/eppenwolf/runs: Data from a number of data-taking runs of the Eppenwolf.
 * A wrapper around flaport/fdtd's awesome electromagnetics library:
    - tissue.py: supports import of IT.IS Foundation computational phantom voxel files, with their supplied Cole-Cole dielectric model, for tissue simulations. Pretty rough, not formally validated.
    - PCB.py: A test of coupled NGSPICE - adaptive timestep and direct KiCAD netlist import and probe/source creation. Currently totally broken.
 * biology/JAMES/ A bespoke MD program thanks to the not-invented-here syndrome. Not enough time was spent exploring GROMACS and LAMMPS features for bead-spring elastic models. A complete waste of time. There is zero reason for this to exist.
 * Reasonably bad note-taking. When all this is over I wanna make a real sweet lab notebook, the current offerings aren't, in my opinion, super great - suggestions for features and workflows are welcome!

```
<3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3   <3 
```

