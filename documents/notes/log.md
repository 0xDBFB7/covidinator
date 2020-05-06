## RF Resistors

RF resistors are required for attenuators, Wilkinson power splitters, terminating striplines, and for power measurement.

----

The Vishay FC series appears to be the only brand specified above 6 GHz. Unfortunately, they're quite expensive and only a few values are available.

-----

> RF resistors should be approximately as wide as the microstrip trace itself

---

HB1 pencil lead is a bit too conductive for the purpose, at 2 ohms / cm or so. Difficult to tune, even with a file, and the resistance is pressure-sensitive. The surface could be copper-plated with Gigabeq's plating technique.

---

0.08g fine graphite + 0.055g elmer's glue (PVAc) was mixed, squished onto a glass slide. Only a small amount of the graphite was wetted by the PVAc and used - equivalent in volume to the drop, maybe 0.01g at most.

Resistance was in the Mohms.

It was then baked with 150c hot air for 1m. Formed a hard plastic layer. With sufficient contact pressure, 200 ohms could be obtained! Wonderful.

The 3-ohm resistor required for a T-type attenuator might be a bit tricky with this process. A pi-type needs a 250 ohm R.

-----

Per **Frequency Response of Thin Film Chip Resistors, Vishay** we can actually get away with stock 0603 50 ohm resistors up to 10 GHz - the impedance is off by at most 20%.

--------

# Simulation

- Yang: simulation for illustration, analytic expression with solid homogenous sphere for microwave absorption cross-section and shell stress. Experimental microwave absorption data used to obtain Q, and therefore derive the inactivation threshold. Very effective fit to 40% inactivation level, but much higher power required for 100% inactivation. 

Myriad methods - often mathematically overlapping - such as coarse-grained bead-spring molecular dynamics (via integration of particle motion), algebraic elastic networks (elNémo), and finite-element methods (via solution of governing elastic PDEs - (Ivanovska, 2004, use CADRE, and Bathe (2007)) have been used to great effect for simulation of mechanical properties of viruses. 

Most recently, the ultimate-fidelity all-atom MD methods have also become computationally viable. 

An MD scheme was chosen for no particularly good reason. In fact, we hardly need the added fidelity of a simulation; an extension of the analytical method used by Yang would probably be more telling of the character of the problem, and would have lended itself better to numerical optimation. As has been more poignantly pointed out before, observation of simulation is as much understanding as observation of reality - it just happens to be less messy. The author is at the moment an incompetent mathematician.

The algebraic normal-mode methods included in many software packages [charmm] do not seem to be sufficient for this task, as they often assume the limit of low-amplitudes.

LAMMPS, GROMACS, OpenMM and HOOMD-blue were evaluated, and all could been usable with some modification. However, because of difficulties in defining new force-fields for coarse-grained bead-spring modelling, the specific time-domain electric field impulses desired, the many-run parameter sweep required to optimize the impulse, and the chain of software required to synthesize an artificially coarse new geometry, a custom ultra-simplistic, ultra-crude MD code was written.

This could easily have been done with something like blender, much faster and better.

-------

Because of the importance of solvent to the damping of biological resonances.

This could be represented by a friction or damping term in the particle motion fit to some experimental value, a realistic viscous-fluid damping model as discribed by Bathe (2007) (implicit/continuum solvation),

>  Langevin dynamics may also be incorporated into the model by coupling the protein-domain to the Stokes equations to model solvent damping.

 Uwe (2009) 

> The atomic structure of the peptide was coarse-grained by first placing a van-der-Waals sphere around the Cα atoms of each of the residues...
> 
> Then, the Cα spheres were connected by springs...
> 
> As this first set of springs was not enough to reproduce all distance distributions correctly, additional springs between the CMs of the residues were added and their values optimized manually until a sufficient agreement between the MD results and a standard BD simulation was achieved.

or an explicit solvation scheme.

------

The following properties are known:

----

Typical timesteps for coarse-grained simulations with leapfrog-like integrators are on the order of 10 femtoseconds.

RK4, while apparently more accurate at larger timesteps, suffers from gradual energy loss, whereas velocity Verlet is more immune to the same.

---

List of properties to test:

- Synchrocyclotron-inspired frequency chirp
  
  As the amplitude of oscillation increases, the frequency of maximum amplitude might change.

- Population-variance frequency chirp
  
  The properties of the virus will vary within a population. Perhaps this could describe Yang's results, where 40% were destroyed at the expected field amplitude, but the rest took far more.

- Sudden phase-shift
  
  The phase-shift will have to take place within the relaxation time of the viral oscillator.

- Superposition of frequencies, frequency-comb, shifting superimposed frequencies independently
  
  - It seems like it would be possible to analytically optimize the amplitude of the input wave as a function of time against the stress in the . 

- Polarization-kick 'optical centrifuge'
  
  - Possible biological effects?

## 3D Beamforming

Safar (2016) focus power to a small region. In their words:

> In this paper, a new beamforming technique is introduced that is capable of transmitting power to a specified
> point in space, rather than a direction.

Depending on the inactivation time, this point would be swept throughout a volume of space. The required RF power would be much lower than a directional beam.

However, on later review, the technique not only requires each antenna to have a different frequency, which is quite reasonable, but

> Each antenna transmits a sum of 50 signals, each having different frequency of operation.
> 
> The frequency range is 1–1.75 GHz

Reducing to 20 signals produces a very similar figure, as does reducing to 3 MHz increment.

![](/home/arthurdent/Projects/covidinator/media/Screenshot from 2020-04-21 11-47-02.png)

It is not immediately obvious how this could be implemented. Independent control of phase for each of the frequencies would be needed, per antenna. Moreover,

> Note that in (9) the optimum coefficient is a function of time.
> This is necessary to cancel the time dependent exponential
> present in the array factor in (6) to make the desired beam
> pattern time independent as in (7). This can be achieved by
> using phase shifters that can continuously change the phase
> of the outgoing signals according to (9).

This technique is probably not within reach for this project.

----

# Oscillator

Per Khanna (2006), both the source and drain of the active device participate in impedance matching:

![](/home/arthurdent/Projects/covidinator/media/Screenshot from 2020-04-21 18-37-56.png)

------

# Internal sterilization

The original assumption was that this device wouldn't be useful inside the body, since the skin effect in tissue at 10 GHz is on the order of 0.2 cm. However, it may be possible to harmonic two, four, or eight penetrating 10/N GHz signals, making a 10 GHz field localized inside the body.

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

------

Ding, 2004:

> Table 1, Detection of SARS‐CoV in tissues from four SARS autopsies[a](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7167761/#fn1)

SARS detected mainly in the lung, stomach, intestine, kidney, adrenal gland, skin, and small amounts in other organs.

# Safety

| 100-6000   | 15.60 ƒ^0.25 |     | 0.6455ƒ 0.5 |     |
| ---------- | ------------ | --- | ----------- | --- |
| 6000-15000 | 137          |     | 50          |     |

Adair, 2002:

> The conclusion that there can be no microwave resonances in DNA in water is in accord with the results of measurements in three different laboratories ([Gabriel et al., 1987](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib7); [Foster et al., 1987](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib5)) using techniques designed to detect resonances with amplitudes less than 1/20th of that reported by [Edwards et al. (1984)](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib4).
> 
> Evidence of such microwave absorption resonances has been reported ([Edwards et al., 1984](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib4); [Grundler and Keilman, 1983](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib8)), but these results have not been replicated ([Gabriel et al., 1987](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib7); [Foster et al., 1987](https://www.sciencedirect.com/science/article/pii/S0006349502754738#bib5)).

> We extend analyses that suggest that the damping of the vibratory motion by biological fluids severely restrict such possibilities[].

It is interesting that this analysis would seem to disagree with the viral resonance seen by Yang.

Foster, (1987) find that the DNA resonance found by Edwards (1987) was well below the experimental error, given the latter's setup. The Foster paper is of remarkable quality.

Sagripanti (1986) find DNA damage at 8.5 mw/g at 2.55 ghz. What is that in mw/cm^2?

Via the ICNIRP, 2020:

> This is typically described as a function of a relevant dosimetric quantity. For example, below about 6 GHz, where EMFs penetrate deep into tissue (and thus require depth to be considered), it is useful to describe this in terms of “specific energy absorption rate” (SAR), which is the power absorbed per unit mass (W kg−1). Conversely, above 6 GHz, where EMFs are absorbed more superficially (making depth less relevant), it is useful to describe exposure in terms of the density of absorbed power over area(W m−2), which we refer to as “absorbed power density”.
> 
> Similarly, as there is no evidence that continuous (e.g., sinusoidal) and discontinuous (e.g., pulsed) EMFs result in different biological effects (Kowalczuk et al. 2010; Juutilainen et al. 2011), no theoretical distinction has been made between these types of exposure (all exposures have been considered empirically in terms of whether they adversely affect health)

Juutilainen references a wealth of empirical data. Vijayalaxmi (2006) is particularly helpful:

Chemeris discusses 8.8 GHz  pulses, and finds no effect:

> We found no data on genotoxic effects of HPPP EMF at peak SAR exceeding hundreds of megawatts per kilogram and at average SAR, which does not induce dramatic overheating of the exposed objects. At such powerful EMF, peak electric field intensity in the exposed biological objects is close to maximally achievable, i.e. near breakdown electric field intensity. It would be reasonable to expect specific genotoxic effects of RF EMF under such extreme conditions.

# Structural

```

T4
---------------------------------------


   Capsid:
   
Length 120 +/- 3 nm | Width 85 +/- 2 nm [Baschong 1988]
Thickness: 5.7 +/- 0.5 nm [Baschong 1988]
Mass 82 MDa [Fokine (2004)]

Charge: +360 e+ [Tarasova 2018]
(but we expect a surface charge density around −0.2 e/nm^2, which conflicts with this.
some other protein must be coating the dsDNA) [Nap 2014]

Proteins and models: 
gp23, gp24 [PDB:1YUE]
w CryoEM EM-6XXX 
Fitted CryoEM 5VF3 (isometric mutant)

   dsDNA: --done--

Mass: 112 MDa [Fokine (2004)]
Size: 172 kbp dsDNA [Fokine (2004)]
Charge: 344k e- [2e-/bp from phosphate group assumed for DNA]

Model as tightly packed charged beads restrained with an L-J force.

   Nanoindentation:

Empty? Lambda (50 nm), Empty? Phi29 (54 nm) [] [Roos 2009]
Full T7 (57 +/- 2.2 nm) [Vörös 2016]
Tip shape:  


Influenza:
---------------------------------------

Total mass (X49/H3N2): 161 +/- 17 MDa [Ruigrok 1984] 

   Envelope:
   
Host-derived lipid bilayer

Diameter (X-31/H3N2): 120 (84 to 170) nm x 100 nm [Harris 2006]
Thickness (X-31/H3N2): 4 nm [Harris 2006]
Mass: 
Distribution: a wide variety of shapes and sizes. 
Aspect ratios from 1.2 (70.9%) to >7 (13%). [Harris 2006] 

Charge: 
Expected (1.16e7 e- based on equal shell core assumption) [Yang 2015]


   Spike proteins:


Mass: 
Charge: 
Number: 375  
 
Proteins and models: 


   Helical nucleocapsid:

[Durrant (supplemental)][Compans 1972][SCHULZE ][Nermut 1970]


   ssRNA Genome (ds?)
  


   Nanoindentation:


Empty liposome: 
[Li, 2011]
Tip: BL-RC150VB, V-shape, radius 30 nm



Coronaviridae
---------------------------------------

   Envelope:
   
Host-derived lipid bilayer

Diameter (SARS-nCOV-2): 80 to 160 nm [Liu, 2020]
[Masters 2006]

   Helical nucleocapsid:


   Spike proteins:



   Genome:


   

   Nanoindentation:
   
Not available.

Marchetti


Phi6
---------------------------------------

Models: Capsids on VIPERdb, (envelope?)



```

#### Other

#### Charge distribution

Tarasova provide some information on the empty capsid.

Božič 2012:

> In our analysis, we use experimental data deposited in the VIPERdb database. This allows us to construct three-dimensional structures of viral capsids, from which we obtain the various mass and charge distributions within the capsid. We consider not only the distribution of atoms inside a capsid, but the distribution of amino acids (their positions taken as centers-of-mass of their constituent atoms) and complete protein chains as well.
> 
> Some capsid data do not contain the positions of all atoms but only the positions of alpha carbons—in such cases we equate their positions with the positions of the amino acids to which they belong. Due to the methods of detection, there are also no hydrogen atoms included in the experimental data.

> To obtain the charge distributions of the capsids, we extract the positions of charged amino acids from the experimental data 
> 
> At physiological *p*H of 7.4, we consider the following amino acids as charged [[23](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3473132/#CR23)]: aspartic acid (ASP) and glutamic acid (GLU) carrying a charge of − 1.0 *e*0, lysine (LYS) and arginine (ARG) carrying a charge of + 1.0 *e*0, and histidine (HIS) carrying a fractional charge of + 0.1 *e*0 (where *e*0 is the elementary charge).

Teplow's Computational Approaches for Understanding Dynamical Systems discusses this a bit.

Myers, 2013 fill an empty capsid with charged beads representing DNA:

> The entire P22 genome of 41.7 kbp was modeled using 6950 “beads.” This simulation was performed using a modified version of the extended system program (ESP)[32](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3592880/#c32) molecular dynamics package (MD) developed by the Pettitt laboratory. The capsid interaction with the surface of the “beads” was modeled through the repulsive part of a WCA decomposition of a Lennard-Jones interaction.
> 
> Similar simulations were also performed on a comparable model representation of the lambda phage system...

UIUC, Molecular Dynamics of Viruses:

> What is the origin of the observed irreversibility of capsid deformation?
> 
> Analysis of how interactions between protein units of the capsid change throughout simulations shows that bending and shifting of these units, along with establishment of contacts between capsid and substrate, are the main contributing factors. One finds, however, that the arrangement of protein units is essentially unaffected by the indentation, i.e., the local structure of the capsid remains the same, even though the capsid is strongly deformed globally. The position and orientation of units with respect to each other are not significantly affected, but their local bending and slight rearrangement is enough to introduce new favorable interactions that lock the capsid in the deformed state, once certain depth of indentation is passed. Thus, the irreversibility is due to capsid-substrate interactions, capsid protein bending, and slight shifting of these proteins with respect to each other, rather than from global rearrangement.

# Transmission

Ding, 2004:

> In addition to viral spread through a respiratory route, SARS‐CoV in the intestinal tract, kidney and sweat glands may be excreted via faeces, urine and sweat, thereby leading to virus transmission.

