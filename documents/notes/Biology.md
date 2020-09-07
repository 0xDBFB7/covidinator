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
[6;5~]
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

[https://www.icnirp.org/en/cart/index.html](https://www.icnirp.org/en/cart/index.html) this looks like a good review.

The references section for IC guidelines is pretty good.

ICNIRP [3] reference levels are the same as IC's.

([https://www.who.int/peh-emf/meetings/archive/en/keynote3ng.pdf](https://www.who.int/peh-emf/meetings/archive/en/keynote3ng.pdf))

[https://www.icnirp.org/en/differences.html](https://www.icnirp.org/en/differences.html)

whereas ICNIRP (1998) averaged over a 20-cm2 region, ICNIRP (2020) requires averaging over a 4-cm2 region (and in some situations a 1-cm2 region). This 4-cm2 averaging area matches the face of the averaging volume (10 g) of SAR, and provides a consistent transition at 6 GHz (see Section 3.3). This change also ensures that an allowable exposure over 20-cm2 cannot be focused into a small region and increase temperature excessively.

Brief, intense RF EMF exposures can raise local tissue temperature excessively, even if the average power over 6 minutes does not exceed the 6-minute average restrictions. This is particularly relevant for frequencies above 30 GHz, but it can also occur down to 400 MHz. Accordingly, ICNIRP (2020) provides additional restrictions to ensure that exposures over brief intervals do not result in excessive temperature rises.

[https://www.icnirp.org/cms/upload/publications/ICNIRPrfgdl2020.pdf](https://www.icnirp.org/cms/upload/publications/ICNIRPrfgdl2020.pdf) - that's the best one.

-----

### [How long do T4 phages in the provided packaging last when refrigerated? Thanks!](https://www.carolina.com/viruses/coliphage-t4-t4r-living-5-ml/124330.pr#)

1. They can be refrigerated up to a year without any change in labeled titer.

Fantastic!

-----

Drussel's PDB reader didn't compile for me first-try, and I cba to fix it.

obabel shelxpro.pdb -O shelxpro.xyz  - openbabel can apparently convert to XYZ, will work in a pinch.

[http://cci.lbl.gov/svn/ksdssp/trunk/libpdb++/pdb++.h](http://cci.lbl.gov/svn/ksdssp/trunk/libpdb++/pdb++.h)

----

[https://www.rcsb.org/news?year=2020&article=5e74d55d2d410731e9944f52&feature=true](https://www.rcsb.org/news?year=2020&article=5e74d55d2d410731e9944f52&feature=true)

Covid resources

-----

Somehow I totally missed the very similar 2017 paper by Sun et al.

"In a previous microwave absorption study on Perina nuda viruses (PnV)4
, it was found that
the hydration levels on the capsid surface of viruses can affect the bandwidth of microwave resonant absorption
induced by the confined acoustic vibrations."

More FEM treatment.

----

[https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2149302/pdf/brjcancersuppl00063-0018.pdf](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2149302/pdf/brjcancersuppl00063-0018.pdf)

> the penetration depth D (i.e. the distance over which the magnitude of the E field is reduced by a factor of e-1) is given by...
> 
> The frequency dependence of D in tissues of high and low water content is shown in Fig. 1.
> 
> The absorbed power density is
> reduced to approximately 13.5% within this distance.
> 
> 10 GHz: wet = ~5mm dry = 30 mm
> 
> 2 GHz: wet = ~25 mm dry 100 mm

----

The Coronaviruses is comprised of E proteins [https://virologyj.biomedcentral.com/articles/10.1186/s12985-019-1182-0](https://virologyj.biomedcentral.com/articles/10.1186/s12985-019-1182-0) - previously thought, but this schematic shows otherwise:

![](/home/arthurdent/Downloads/1280px-Coronavirus_virion_structure.svg.png)

>  Therefore, as soon as a grid at room temperature is dropped into the liquid nitrogen, some of it will warm and boil off, slowing the freezing process and allowing cubic ice to form. Ethane has a much higher heat capacity than liquid nitrogen and is also liquid at temperatures just slightly above those of liquid nitrogen. Therefore, liquid ethane is cold enough (it's melting point is -188 °C) to freeze water quickly and correctly, while not boiling off in the process. 

Cool!

ViperDB has a "Net Surface Charge:" field. Awesome!

After exposure to 40% destruction level, re-test microwave absorption - would tell us if the variation in sizes is shifting off-resonance.

https://arxiv.org/pdf/physics/0403057.pdf
The origin of the force resisting the ejection of DNA from the capsid lies in the
osmotic pressure caused by molecules in solution that cannot penetrate the capsid. Neat!

Okay. So. Basically zero progress. We don't know what the charge distribution inside the phage looks like. We could sum up all the protein charges - gp23, x charge, times x segments in capsid - but right now doing Yang's microwave absorption fitting technique might be better.

It seems quite reasonable that the increase in power required is due to variance in the properties, but that remains to be seen.

Pulsed RF is still on the table. If the blood cell data is transferable, can we use the 6-minute averaging to go over the 50 W/m^2 restriction? Also, the beamforming around the body will 

Phi6 has an intermediate capsid between the envelope and the bare DNA, whereas influenza and COVID has a tightly-wound helix of DNA wrapped immediately in a capsid.

-----------------

Why do we need to simulate? We want to test the effects of 

But T4 seems to be far more precise in its reproduction than influenza, so it's not going to replicate the distribution inactivation effect. 

--------------------

What can we simulate right now? We can do a super-coarse influenza using q-=q+ from the Yang paper.

ICRNIP:
# and (c) within the reactive near-field zone reference levels cannot be used to determine compliance, and so basic restrictions must be assessed. 

oh!

Four emitters in a -circle- no an arc, 2 GHz, connected by SMA cables, phase shifters on each one, alter phase shifters until max 8ghz signal recieved? Tune two, get second harmonic, etc until all phases are tuned

Power in the second harmonic:

{P_c} = {P_a} + {P_b} + a*b \cos(phase2 - phase1 )

That's still 0.707 at 45 deg. 0.707^4 = 0.25. If the optical-centrifuge mode works, that might just be enough, given the ~4 W/cm^2 limit at 2 ghz?

Huge power required. 


It might be possible to extract the charge density map directly from the original CryoEM, rather than fitting the particles. Hirai 2007. Very interesting.

Oh hold up, even a core with a single charge will 





https://onlinelibrary.wiley.com/doi/abs/10.1002/elps.1150050404

https://onlinelibrary.wiley.com/doi/abs/10.1002/elps.1150030204

We determine the surface charge density of our T4 surrogate by converting values of mu in agarose electrophoresis. This technique, while somewhat ridiculous, could also be used to inexpensively determine the distribution of radii of particles.

Serwer, P. and Pichler, M. E., J. Virol. 1978, 28, 917-928.

What is 2d gel electrophor...?

Also, different proteins (M, liposome) charges might be found

Influenza virus proteins: Identity, synthesis, and modification
analyzed by two-dimensional gel electrophoresis

https://www.sciencedirect.com/science/article/abs/pii/002228367090077X

T4 phage were osmotically shocked using a procedure
similar to Minagawa (1961). 6 ml. of a suspension of 1 x 1Or3 phage/ml., previously stored
overnight in 5 M-N&~, was diluted 0.05 into cold distilled water to release DNA from the
phage. Anderson, 1950

2d gel elec. uses a gradient of pH in one axis (seperating by charge)
and no gradient in the other (separating by Mw)

http://www.gelanalyzer.com/?i=1 and PyElph

It is possible to derive net charge directly from CryoEM maps of proteins. However, software 

Oh wow, radioactive electrophoresis!

Vary salt concentration for different conductivities


Apparently the isoelectric point *can* be estimated from the protein itself, [Kozlowski 2017], 
http://isoelectricpointdb.org/
no way! it's got a database for T4!

http://isoelectricpointdb.org/87/UP000009087_10665_all_isoelectric_point_proteome_Enterobacteria_phage_T4_Bacteriophage_T4.html


Note: the following is speculative musing. Please consider carefully.


"shutter-like" polypropylene flat plate lid opened and closed by a notch on end of revolution

ooh or a bunch of spring shutters, one each tube, opened when in position?

-- ------||----------=
                      <
-- ------||----------=
~~ ~~    ||       
-| |-----||-----| |--
 | |            | |   < 

Entire thing enclosed and heated? filtered air?
 
the ambient light sensor seems to have a somewhat slower response.

Found an old LTOF converter in the bin. Works really very well.

by presumably freak coincidence, the autoclaveable caps from the 60 ml polyprop. cans
fit perfectly on the 15 mL falcon tubes. Liquid-tight seal, too.

Yay!


After having been left in the toaster oven at room temperature for about a month, 
bacterial debris has settled into a pellet at the bottom of the Eppendorf tubes,
and there's much less of a difference in clarity between the controls and the EX.
The controls still look clear.

Shaking by hand for 20 seconds re-suspended the material apparently homogenously.

330 ohms used as LED resistor.

FreqCount emits a value of 32244002423133 - oh that's just a rollover bug.
With a 10 ms integration time, we get transmittance of 1750(clear)-1100(suspended E.coli).
That's great!

Surprisingly, even despite the lower sensitivity of this sensor to IR, we get a huge increase (6.25x)
increase in raw resolution in IR vs red. This might be due to the diffused RED leds vs 
water-clear IR leds. 

Almost no change in IR reflectance or transmittance between cloudy and control, despite
the higher resolution.

Then again, there's also almost no change in red reflect. or transmit at these integration times.
A much longer time is required. 100 ms provides a huge effect in transmission, but almost nothing
in reflection.

Oh, and this is with 1.5 mL Eppendorfs filled to 1 mL, for reference.

At 100 ms integration time, after a small settling time 
this is extremely immune to ambient light - no perceptible change
even if a strong flashlight is shined on the sensor. Really fantastic sensor.

There's a far stronger dependence on transmission than reflection.

Still quite position sensitive, however.

oh! three LEDs arranged thus:

o o o 

  @ -->

  ^

would give us distance information, given a known eppendorf size.
leds arranged vertically would provide 

It seems like transmission ("turbidimetry") is an equally valid technique as scattering 
("nephelometry").


-------------------------------------------------------------
60 mL broth to safekeeping bottle
2ml broth to 15 mL Falcon tubes x4 [E6 E7 P6 P7] (8 mL broth)
autoclave - release steam outside this time
Inoculate Falcon tubes w. E. coli.
two eppendorfs with 0.6 mL glycerine.
-------------------------------------------------------------
Incubate and shake. Measure turbidity. 
-------------------------------------------------------------
Dispense one Falcon into two eppendorfs, [E8 E9], to 0.8 mL.
Add 0.6 mL glycerine. Freeze.
-------------------------------------------------------------
Once log phase attained, inoculate 2x Falcon P5 P6 with 0.2 mL phage.
-------------------------------------------------------------
Incubate and shake. Measure turbidity. 
-------------------------------------------------------------
Optional:

Once clear, dispense P1 P2 into four eppendorfs total,
1 mL each. Centrifuge at []. Decant supernatant into P5 P6.
-------------------------------------------------------------
Dispense 8x 0.2 mL e. coli into eppendorfs S0 - S7.
-------------------------------------------------------------
Re-fill E6 E7 to 2 mL - 0.2 mL should remain.
-------------------------------------------------------------

Determine conductivity? maybe attenuation can account for some of the decrease too? No; some of 
Yang's experiments used a few drops rather than a cuvette.

Hmm. How can we do this better?

also, normally distribute shell breaking strength

For optimization, a rapid, large-scale testing procedure will be needed.

hmm, microfluidics. Polyprop and FEP tubing can handle sterilization.

1/16" tubing requires 0.08 ml/cm.
0.6 + 0.2 * 30


Poured the broth into three polyprop. bottles and autoclaved. They crushed quite a bit;
didn't have the caps opened sufficiently, and there was quite a vacuum when I opened them.

Ran them through again.

E8, E11 are Falcons; E9, E10 are eppendorfs with 0.5 mL glycerine. Eppendorfs didn't open this time.

Oh, and I released the steam immediately after the 20 minute alarm, and almost no condensation was
present.


This time, opened the lid, left everything opened, let cool for 10 mins. That worked very well.

Putting 0.2 mL of E2 into E8. 


empty: 
72, 6400, 1541, 38397

E8, just after inoc.

144, 6812, 2443, 82273
144, 6811, 2445, 82268
144, 6811, 2442, 82268
145, 6811, 2443, 82263
143, 6811, 2444, 82269
145, 6809, 2442, 82265
143, 6810, 2443, 82262

resting against black header

incubated at 35 C.

About an hour later, 6:15 05-18:

manually shaken for 10 seconds, 

nephelometer is not sufficiently repeatable.

Transferred 0.2 mL from E0 (refrigerated second generation) to E11. E0 did not have a
settled region. 

After 3 hours of shaking at temperature, E8 (from the non-refrigerated E2) was positively
soupy. No vacuum on opening, either. Added to glycerine, put in freezer.

No perceptible difference yet with E11. Very strange! I would have expected the refrigerated
e.coli to just take off.

E8 has been put into to the freezer.

10:30, E11 removed from shaker. Some growth.

The field of centrifugal microfluidics is accelerating.

1/8 in delrin is still pretty translucent. Should work okay.



Metal film taped on - autolevelling


packing tape lid?

IR thermocouple



E. coli is somewhat salt tolerant; but it might be a good idea to expose the phase-salt combination
first, then dilute 

polycarbonate is autoclavable, but it loses strength rapidly.


hey, I've got a huge sheet of 1/8 


Maybe there's something we can do with simple angular momentum on the polarization twist front.


T7 


The hydrophilic/hydrophobic properties of Polycarb don't seem to be ideal for microfluidics.
This can be modified by UV exposure apparently.



Bought verbatim CD-Rs. Some worn red scotchbrite easily takes off the laquer, metal, and dye layers,
leaving a reasonable finish.

The surface is indeed conductive after the laquer is removed. Perfect for CNC alignment.





We should follow the guidelines in Vjl. Comprehensive review, and "
In their publication, the Organization for Economic Co-operation and
Development (32) provides excellent guidance and details,
for in vitro and in vivo genetic toxicology testing, which
need to be incorporated when experiments using RF are
initiated."

Sham, positive control (heater? UV LED?), blinded trials (software randomization probably qualifies?), 
accurate dosimetry.

Should contact vijay@uthscsa.edu about reviewing our methodology.

Also should contact Yang et al about the formula issue.

You can centrifuge phage, but it's hard; adding PEG helps


Made a mandrel for the CD. about 1mm of runout. should touch that up using the motor axis itself.



if we ever get the phi6, we could request that they send us an empty jug of 
the broth used to culture it




There seems to be a discrepancy between [Yang 2015] and our reading of C95.1-2005. This is very likely a misreading on our part, and so calls into question our understanding of the standard.

They say: "Based on the IEEE Microwave Safety Standard, the spatial averaged value of the power density in air in open public space shall not exceed the equivalent power density of $100(f/3)^{1/5} \text{ W/m}^2$ at frequencies between 3 and 96GHz ($f$ is in GHz). This corresponds to $115 \text{ W}/\text{m}^2$ at 6 GHz". The 115 W @ 6 GHz value correctly corresponds to this equation with a coefficient of 100.

The only reference to a 3 - 96 GHz limit we can find is that of Section 4.6, {\it Relaxation of the power density MPEs for localized exposures}, where the equation is $200 (f/3)^{1/5} \text{ W/m}^2$ [IEEE C95.1-2005], for controlled occupational exposures, referring to Table 8. For Table 9, general public, the equation is $18.56 (f)^{0.699} \text{ W/m}^2$, or $64.93 \text{ W}/\text{m}^2$ @ 6 GHz. 

Different versions of the IEEE standard have used equations of equivalent form but with different coefficients [Wu 2015]; it is possible that we have retrieved the wrong standard.

In any case, this doesn't change the substance of [Yang 2015]'s paper; the relaxed localized exposure is probably the correct threshold to use, and it just means the mechanism is more useful for healthcare workers who acknowledge the risks.

we can see if there's a syncrotron-like shift by measuring the absorption versus amplitude.



http://spiff.rit.edu/classes/phys283/lectures/forced_ii/forced_ii.html

when we measure the phage resonance, we need to use the full-width-half-maximum power

> Let's make a graph showing the power dissipated as a function of the driving frequency. It will have a peak close(*) to the natural frequency of the system, and some width around that peak.

> (*) yes, the maximum dissipated power occurs at a slightly lower frequency than ω0, but for most cases of interest, this difference is very small. Assuming the peak is exactly at the natural frequency will simplify some of the expressions which follow, so let's do that.

amplitude of a forced, oscillating system at resonance is exactly Q times the displacement by a static force of the same size.

The Fourier analysis of a square wave yields odd harmonics with relative amplitude A1/n . 
The excitation of an oscillator of natural frequency 20 rad/s with a 4 rad/s square wave gives maximum 
excitation at n=5, even though the driving amplitude is down by a factor of 5.

I'm not sure I fully understand something fundamental here. In [Yang 2015], 


"Influenza liposomes at 13C and 26C
were on average, respectively, 40% and 10% stiffer, than at 37C".

That's bad! Does that mean our resonance will shift significantly over temp? 


Also, I keep plugging in numbers into the relaxation time figure, but I can't get anything over
1 period. Weird.



[Arinaminpathy 2010] find that the charge on various strains of Inf. A 
glycoproteins have varied strongly since 1968. Amazing!


from that paper, "Charge can indeed be determined from amino acid sequences".

"Determines the virion's shape: spherical or filamentous. Clinical isolates of influenza are characterized by the presence of significant proportion
 of filamentous virions, whereas after multiple passage on eggs or cell culture, virions have only spherical morphology.
  Filamentous virions are thought to be important to infect neighboring cells, and spherical 
virions more suited to spread through aerosol between hosts organisms."

https://www.uniprot.org/uniprot/P03485

Amino-sequence determined net charges can often be quite incorrect. In the case of 

baseball card 

While there is "[The anomalous isoelectric properties of influenza virus matrix protein M1].",
the isoelectric point of M1 in the db matches that found in gel electrophoresis very well.

https://pypi.org/project/isoelectric/

isoelectric point can be converted to net charge via the Henderson-Hasselbalch equation,
but I'm not sure if that's particularly accurate.


pI - pH = log10(1/q)

q = 1/exp(pI - pH)

Autoclaved P0, P1, P2 eppendorfs, just for good measure.


Pipetted 2.5 mL sterile broth from B1 into both E12 and E13. Also pipetted 1 mL into C1.
Autoclaved everything.

These new pipette tips and everything work magnificiently.

Actually,while the new tips work great, I'm going to use the old glass tips for the critical
 phage pipetting.


 There's a 10k resistor on the near-side ADC. 

 What we really need is an exact copy of this board, but with two RF amps, AC-coupled diode
 detectors on both sides, much faster ADCs, better PGAs, and a CPWG that's as short as possible.

Y'know, a retrofit board could be done. Cut the two into two, 
stick one between...


 Anyhow, later. We'll do the run again and see if we get some better data.
 
Replaced far-side AC coupling cap, now far-side ADC's up to snuff;
also, bringing the amp current up to 0.2 yields a 

Removed E10 from the freezer, dropped it on the floor, put it back in the freezer.

Heated the silicone oil to 120c in toaster oven in a glass pipette that had been flame-sealed,
alu foil on the top. After an hour, turned off, waited to cool, poured into sterile eppendorf.

Added 0.2 mL of E10 from the freezer to E11 and E12, put on the shaker in the incubator.
E10's back in the freezer. 

Pulsing the thing prevents the freq. feedback hackrf from working, predictably.

After 6 hours of shaking and incubating, no change in E12 or E13. Glycerol stock seems to be dead.

Put some of E8, old fridge stock, into E14. 

Tried using the silicone oil cap. Works great. Slowly leaks if inverted, not a huge problem.
5.0 uL of oil is better.

Silicone-filled slides should be:
emptied
sealed 
autoclaved 
washed with soap and water
blown clear
autoclaved with back seal
done!



when I was playing around with the silicone oil I kept getting droplet formation. To coalesce these,
apparently you can use electric fields https://www.hindawi.com/journals/ijce/2016/2492453/
this would allow you to take multiple different chemicals, put them into droplet form,
and then selectively coalesce them with the reaction chamber. Very neat!

here's something neat: droplet resonant coalescence mentioned in the last paper. Very similar problem
to the virus!


After leaving overnight, all three (E11, E12, E14) are super turbid! Hooray!


Put the phage in the fridge overnight.

if we just add more e.coli , do the droplets coalesce?

Going through the esophagous might be better!

Put 6x0.2 mL of E13 into EC0, EC1.

Centrifuged the two E.colis at ~ half power for 2 minutes. Centrifuged very nicely - pellet in
the bottom.running the test
dowel pulled out. shortened it halfway through.
pressing down - there may have been a few runs where the slide was not fully flush with the 

a few of the wells may not have been loaded fully; very hard to do these small volumes!

if the tips get waterlogged, blow them out with argon, dry the bottom of the tip box,
and make sure the alu foil is sealed.


definitely some heating from the hot PA. 

remained blind on slide 0. 

think I may have lost blindedness on slide 1 cuvette 1.
and cuvette 4.


something may have gone wrong here. cuvettes 2 and 6 on slide 1 look like they've evaporated.
I think they were left on the (v hot) pulse PA strip too long; I left to go to the bathroom
and deal with shipper. slide 0 still looks great.

covered slide 0 before cuvette 2 post-pulse.

improvements: faster sampling, heatsink to maintain temp

actually used 2.5 uL of sil. oil, wasn't enough.

turbidimeter is no good. Tried various things with 

abandoning this run. no turbidity data, evaporation, too little silicone, dowels keep coming
out on the spectrometer.

tried microscope turbidimeter, doesn't work very well.

slide needs t

:(

having such small volumes is pretty crap. I wish we could make the field larger.

BCA assay is hazmat; needs municipal disposal.

glycerol in water is not effective at preventing evaporation \cite{physical}.


Increased incubator temp from ~34 to 38.

Loading the slides went really well (test 3). Sanded the both sides of the slides for better adhesion and flatness,
using a kimwipe to dab up (without wiping) excess silicone oil works really well, 

Needed to bend one of the dowels to get the cuvette flush.

remember to tape the 

hmm. almost looks like some might have evaporated again. We'll check with the microscope after.

the two sterile broths and one autoclaved phage seem to have leaked out on S0.
The rest are all perfectly fine.

Running slide 1 without cover slip.


Teensy died in the middle of the test.

Actually, the tiniest speck of copper had shorted out the 3v3 rail. Re-doing the spectra.

Slide 0 has been duplicated.

The wells on clide 0 with issues are 2, 3, 5.

Slide 1 has no issues. I think the wells just leaked from the top or were jostled.

Got unblinded on slide 0 well 1.

maybe I should have weighed the slides.

Slide 0 still looks exactly the same after pulse.

Both slides were exposed for the entire duration of spectra + pulse + spectra.

Slide 1 still looks perfect after pulsing.

Slide 0 still looks the same after the second set of spectra

Maintaining absolute, zero-tolerance-for-error concentration on a task for more than 4 hours is very difficult. 
Gives me a lot of respect for the people who have to do this day in, day out.
Of course, designin gtolerance for error into the experiment would work, but at the cost of more work.
at the time now? 6 hrs including prep? Starting to make mistakes.

Slide 1 still looks perfect.

Began incubation at 18:20.

Slide leaked, 

Removed the entire contents of each well and added to the culture. Worked great.

what's interesting is if you reverse - that is, 

seems like there hasn't been *any* bacterial growth - perhaps we're still stuck in the lag phase?
maybe because I've been taking it out so many times, it hasn't had a chance to get going?


many of the cuvettes leaked. The kapton didn't bond sufficiently to the polyprop.

The leftover silicone oil from each well seems to have interfered with the turbidity reading, 
too.






