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





Used ProDy to convert raw CryoEM EMD-6323 to PDB:

`atomgroup, emd = parseEMD('input_data/emd_6323/emd_6323.map', cutoff=1.2, n_nodes=5000, num_iter=30, map=False, make_nodes=True)`








