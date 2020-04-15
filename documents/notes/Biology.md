List of things that computational biologists have totally down:

- Standardized file formats 
  
     Perhaps this is because the proteins themselves are the same for every project? You don't have standardized accelerator pipes.
  
  - I'm not blameless here either, because all the little things I've written don't use OpenPMD or anything standardized

- Builds that actually work

Biology

https://www.cdc.gov/infectioncontrol/guidelines/disinfection/disinfection-methods/chemical.html

"Isopropyl alcohol (isopropanol) was slightly more bactericidal than ethyl alcohol for E. coli and S. aureus 489." 

It'll have to do.

Bleach is another option.

A nephelometer or https://en.wikipedia.org/wiki/McFarland_standards is used to determine titer of a broth. Looks like an LED and photodetector at 90 deg would be sufficient.

Rubber cap strip for all tubes?

Bubble aeration - we'll try it!

Water bath for robot pipettes

Automatically sequentially diluting will also work.

file:///home/arthurdent/Downloads/techniques-studying-bacteriophages-ecoli.pdf

[https://www.carolina.com/teacher-resources/Interactive/living-organism-care-guide-bacteria/tr10478.tr](https://www.carolina.com/teacher-resources/Interactive/living-organism-care-guide-bacteria/tr10478.tr)

> You recommend holding a culture at room temperature, but the recommended temperature for Escherichia coli is listed in your catalog as 37° C. Why is that?
> This is because 37° C is the incubation temperature, or the temperature needed for maximum culture growth. The culture is mature when we ship it and does not need further incubation. Maintaining the culture at room temperature allows you to hold it longer before use.

[http://www.gaudi.ch/HTGAA/final_project.html](http://www.gaudi.ch/HTGAA/final_project.html)

Okay so E. Coli stays at RT, phage goes in the fridge. The phage package says specifically 
"refrigerate after arrival".

Cultures must be shaken and must have sufficient oxygen for growth.

Culture was put in the fridge at 2.9 C.

Sterilized alu foil can be used to cap beakers n' stuff. Neat. Definitely should have purchased some parafilm though, because of its gas permeability.

12-50ml Falkon tubes are used to culture in shakers. Oh well.

> [NAMDwill be used for groundbreaking coronavirus simulations](https://www.hpcwire.com/off-the-wire/coronavirus-massive-simulations-completed-on-frontera-supercomputer/) that will run on the Frontera supercomputer at TACC. The Amaro Lab of UC San Diego is working to build the first complete all-atom model of the SARS-COV-2 coronavirus envelope in order to investigate how the virus interacts with receptors within the host cell membrane. The coronavirus model is anticipated to contain 200 million atoms. The simulations will run on up to 4,000 nodes or about 250,000 processing cores of Frontera.  

Very nice! So all-atom sims are totally within our grasp now.

Autoclave diagnostic tapes! cool.

[https://en.wikipedia.org/wiki/Shaker_(laboratory)](https://en.wikipedia.org/wiki/Shaker_(laboratory)

"Anyone employing an incubator shaker (thermal shaker) to grow yeast or bacteria in the laboratory needs to beware that under the usual conditions encountered in the lab, the rate at which oxygen diffuses from the gaseous phase into the shaken liquid phase is too slow to keep up with the rate at which the oxygen is consumed by for example E coli dividing every half hour or S cerevisiae dividing every hour. If the investigator measure the oxygen in the shake flask on the shaker -- polarographically, for example -- at mid-exponential phase of growth, the dissolved oxygen concentration will turn out to be zero."

How about a vortex mixer? Small vortexers for 1.5 mL tubes do exist. 

Oh this'll select for resistance to microwaves. Is that even possible? Perhaps mutants of different dimensions will be favored, in which case it should be possible for users to re-tune without re-issuing.

"Due to the slower motions of CG, one can often use a timestep of 500 fs rather than the 1 fs time-step"

"Now we approximate that a spherical virus is like a homogeneous sphere but with opposite and equal charges in the core and shell regions."

Ooh, maybe the head isn't in the PDB yet, but XRF and Cryo EM data do exist! [https://www.ncbi.nlm.nih.gov/pubmed/16884923](https://www.ncbi.nlm.nih.gov/pubmed/16884923) [https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-6323](https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-6323)

[https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-1414](https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-1414)

[https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-6082](https://www.ebi.ac.uk/pdbe/entry/emdb/EMD-6082)

Coarse-grained can be mapped directly to CryoEM data [https://www.tandfonline.com/doi/abs/10.1080/08927022.2018.1431835](https://www.tandfonline.com/doi/abs/10.1080/08927022.2018.1431835)

Hey, ProDy can do that! Cool. [http://prody.csb.pitt.edu/tutorials/cryoem_tutorial/background.html](http://prody.csb.pitt.edu/tutorials/cryoem_tutorial/background.html)

[http://prody.csb.pitt.edu/tutorials/cryoem_tutorial/em_analysis.html](http://prody.csb.pitt.edu/tutorials/cryoem_tutorial/em_analysis.html)

[http://www.emdataresource.org/](http://www.emdataresource.org/)

There are whole structural models [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5119483/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5119483/)

Ah, these people used beads inside to represent the DNA: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/)

"Therefore, in the present work, we model each six-base pair segment of double-stranded DNA as an ion-penetrable sphere which interacts via an electrostatically-repulsive colloidal potential from classic DLVO theory,[31](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/#c31) given by"

"where *q* = 12*e*− is the electrostatic charge from backbone phosphate groups LB = 7.135 Å is the Bjerrum length, κ = 0.31 Å−1 is the inverse Debye screening length, a = 19.9 Å is the radius of the DNA segments, and R is the separation between such segments. Such a potential incorporates the full negative charge from the backbone phosphate groups with simple Gouy-Chapman double layer ionic-screening appropriate to the experimental conditions of 100 mM Na+ and 5 mM Mg2+."

"The entire P22 genome of 41.7 kbp was modeled using 6950 “beads.” This simulation was performed using a modified version of the extended system program (ESP)[32](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/#c32) molecular dynamics package (MD) developed by the Pettitt laboratory. The capsid interaction with the surface of the “beads” was modeled through the repulsive part of a WCA decomposition of a Lennard-Jones interaction.[33](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/#c33) The simulation was performed for 100 ns in the microcanonical ensemble at 300 K (with variation less than ±1 K) with a 100 fs time steps. Coordinates were sampled every 2 ps."

The all-atom influenza model:

[https://pubs.acs.org/doi/10.1021/acscentsci.9b01071?goto=supporting-info](https://pubs.acs.org/doi/10.1021/acscentsci.9b01071?goto=supporting-info)

"As the first explicitly solvated atomic-scale simulation of a viral lipid envelope (∼115 nm diameter, ∼160 million particles, ∼121 ns),"

Wow. Good going. Fantastic.

[https://pubs.acs.org/doi/suppl/10.1021/acscentsci.9b01071/suppl_file/oc9b01071_si_001.pdf](https://pubs.acs.org/doi/suppl/10.1021/acscentsci.9b01071/suppl_file/oc9b01071_si_001.pdf) the "how it was done"

They used [https://git.durrantlab.pitt.edu/jdurrant/lipidwrapper](https://git.durrantlab.pitt.edu/jdurrant/lipidwrapper). Jackpot.

Coronaviruses E proteins[https://virologyj.biomedcentral.com/articles/10.1186/s12985-019-1182-0](https://virologyj.biomedcentral.com/articles/10.1186/s12985-019-1182-0)

"Aside from high-resolution bilayer models like that of the influenza example above, in which each atom is explicitly represented, LipidWrapper can be used to produce coarse-grained models as well [[61]](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003720#pcbi.1003720-Srivastava1)." Fantastic!

Used ProDy to convert raw CryoEM EMD-6323 (typical empty prolate phage) to PDB:

`atomgroup, emd = parseEMD('input_data/emd_6323/emd_6323.map', cutoff=1.2, n_nodes=5000, num_iter=30, map=False, make_nodes=True)`

Took 25 minutes.

> Due to its softness and fluidity the influenza virus envelope could be elastically deformed wall-to-wall and healed from any puncturing in a subsecond timescale. Similar properties have only been reported for the CCMV capsid so far ([27](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3030173/#bib27)). In addition, we have shown here that the influenza lipid bilayer on its own constitutes a protective shell that resists rupture equally as well as a more rigid protein capsid.

Need to find lipid bilayer and nucleocapsid PDBs for covid and influenza.

Also, really need to get around to propagating those phages. Even without the shaker - just get a backup colony.

[https://mailman-1.sys.kth.se/pipermail/gromacs.org_gmx-users/2004-November/012877.html](https://mailman-1.sys.kth.se/pipermail/gromacs.org_gmx-users/2004-November/012877.html)

Chimera only supports GROMACS formats in the daily builds.

VMD topotools would probably deal with the bonds...s

[http://glotzerlab.engin.umich.edu/hoomd-blue/index.html](http://glotzerlab.engin.umich.edu/hoomd-blue/index.html)

Hoomd blue looks really great, not totally done yet though...

OpenMM looks really fantastic - oh, but time-varying external forces aren't implemented yet, and that looks like a real doozy.

The electric field is specified in src/gromacs/applied_forces/electricfield.cpp:111 - easy to change! Very nice.

[http://prody.csb.pitt.edu/manual/reference/dynamics/mechstiff.html](http://prody.csb.pitt.edu/manual/reference/dynamics/mechstiff.html) - mechanical stiffness calc.

------

Autoclaved pierce-top rubber stopper? Buna-n survives autoclaving. 

Oh, buna-n can be simply isopropyl'd.

-----

Oh, Yang didn't calculate the ideal frequency - they just used the microwave absorption cavity thing:

> In order to calculate the threshold magnitude of the electric field to fracture
> H3N2 virus following equation (12), some important parameters such as q, Q and ω0 of the studied H3N2 virus
> has to be obtained by measuring the microwave absorption spectrum of viruses.

That's why they got such good agreement.

1 1. ×6 10 e

Uncontrolled electric field limits in Canada are 61.4 V/m and controlled is 137 V/m RMS. They say "average electric field magnitude" -

Fig. 5b in Yang says there's only 40% inactivation at 100 W/m^2

CNC'd a piece of PVC pipe as an eppendorf holder (rather, Dad made the .ngc). 400 mm/min. 17 mm between centers. 10krpm, 2 mm step with 1/8" endmill. We now have 22 incubated wells to work with. Some nichrome in thin tubing will probably work for the heater.

Apparently hair and eyes are also important to protect.

Agitation/stirrer! If insulating and transparent, can be mounted to the very same nozzle; nozzle spins. Just aspriating/ejecting might be enough?

A heated Microwell might have been a better idea.

Eh, nevermind - we can probably reliably work with 0.1 mL (the first graduation in these cent. tubes) - that's only two tubes worth of LB, etc. That's fine.

Derlin is ostensibly autoclavable, but emits formadehyde vapor -[https://journals.sagepub.com/doi/pdf/10.1177/109135059700200309](https://journals.sagepub.com/doi/pdf/10.1177/109135059700200309)

> It should be noted that acetal releases formaldehyde in the autoclave. The Nalgene" catalog
> recommends autoclaving acetal test tube racks at 121°C maximum for 20 minutes at 15 psig.
> Proper ventilation is required for autoclaving of acetal. Autoclaving acetal racks for longer
> periods or at higher temperatures results in the release of dangerous levels offormaldehyde.

[https://aem.asm.org/content/aem/21/4/633.full.pdf](https://aem.asm.org/content/aem/21/4/633.full.pdf)

"Chloroform (1
ml) was added to the culture to artificially disrupt
any cells that had failed to undergo phage-induced
lysis."

a "ferris wheel" type agitator looks pretty simple; putting some debris in an eppendorf, not

Autoclave has an auto-simmer feature; should watch for that.

Dad made an eppendorf rack out of a sheet of PP. 13 wells. First attempts cracked a bit, warming the polyprop. in an oven worked really well.

In retrospect, using individual eppendorfs was a pretty dumb idea. A microwell would have been better.

[https://www.usascientific.com/breathe-easy-membranes/p/9126-1000](https://www.usascientific.com/breathe-easy-membranes/p/9126-1000)

A pipette was heated via a 

Asciio lost everything on "oxygen synthesis". :( That was really cool! aww

Anyhow, manganese dioxide catalyzes decomposition of hydrogen peroxide, even the battery-derived stuff I have worked fine, 

the whole concoction would then be sterile, including all the air supply. Everything could be hermetic.

-----

Palm sander works really well as a vortex mixer for Eppendorfs. 11000 RPM - I suppose that makes sense - smaller tubes have a higher Fres. It's pretty simple; just an aluminum piece eccentric in a bearing, with a flywheel fan with an offset weight. Four plastic standoffs "live hinges" are used for the flexing part.

                

Rather than sterilizing pipettes after each use, we could just use a standard PnP nozzle-style collar-and-forks toolchanger.

-----------------

There are two different properties we have to determine: the bond bending and stretching coefficient. Given a certain indentation and force, we should be able to determine how much of the force is due to the constant-volume bending ("Shear?"), and how much is due to the changing-volume stretching (bulk modulus?) - just run a sim with the same size AFM tip as in the paper, measure the average bending and stretching of the participating region, and set the constants accordingly!

We should solvate. The solvent inside the envelope might give rise to new modes.

----

Built a simple nephelometer with a red LED and a photodiode. Biased at 3v, for future ref. 

| @10:23, T=5.5 hr, 35 C, mild stirring, lids closed, 1 mL volume. | E0     | E1  | E2  | P0     | P1     | P2     | C0     | C1     |     |
| ---------------------------------------------------------------- | ------ | --- | --- | ------ | ------ | ------ | ------ | ------ | --- |
|                                                                  | 2.9852 |     |     | 2.9848 | 2.9852 | 2.9852 | 2.9853 | 2.9853 |     |

Not enough resolution - the tubes were clearly different spectra, and yet all were 2.9852. 

Messed with resistor values, but couldn't get a reasonable result.

Using a solar cell works - larger area, I suppose.

| @10:23, T=5.5 hr, 35 C, mild stirring, lids closed, 1 mL volume. | E0      | E1      | E2      | P0      | P1      | P2      | C0  | C1      |     |
| ---------------------------------------------------------------- | ------- | ------- | ------- | ------- | ------- | ------- | --- | ------- | --- |
|                                                                  | 0.19030 | 0.18745 | 0.18862 | 0.18830 | 0.18660 | 0.18336 |     | 0.18793 |     |

Accuracy is pm 50 counts due to positioning of cuvette.

- ----

Miserable failure. Phage was propagated anyhow, process finished at 12:15 AM 04-14.

It was confirmed that all tubes were visually distinct from the controls at start.

All tubes were released to air breifly. There was a slight vacuum in each one. This was probably not an ideal procedure, as contaminants may have been drawn into the tube. Oh well.

After inoculation with a loop, the phage tubes were shaken vigorously for a few seconds.

E0 was removed and refrigerated for safekeeping; the rest were kept at room temperature overnight without stirring.

At 10:00 the next day, the phage tubes looked distinctly *cloudier* - this might have been my imaginination. The bacteria were presumed to have entered the stationary phase; shaking and heating were resumed.

At 12:00, there was no perceptible difference between the P and E tubes.

---

Dissolved oxygen meters seem to commonly use an electrode ("polarimetric") oxygen-sensitive dye, or a UV band. For pulse oximetry, that dye seems to be the hemoglobin itself -  a dual-wavelength spectrometer is used to measure absorption.

It turns out that the "all-in-one" paradigm isn't so easy to implement in real life!

----

Just make a carusel of eppendorfs. Everything stays sealed. No pipette - maybe an inoculating loop coil at most? wire could self-heat!

------------------

Man, I wish I'd bought some 15mL and larger culture tubes with lids back when we could. A lack of glassware is really hampering me here.

McMaster still sells centrifuge tubes. 
