Microwave

---
title: Microwave
created: '2020-03-18T16:01:18.644Z'
modified: '2020-03-21T22:37:33.054Z'
---

# Microwave


RF! Just enough power at the right freq. to bake aerosols without harming people

https://link.springer.com/article/10.1007/s11434-014-0171-3

2.4Ghz isnt's that effective - you need 500w direct for reasonable sterilization.

Is there a more specific property of viruses we can target?

Huh! 

https://ieeexplore.ieee.org/abstract/document/7771944

8 GHz tuned to virus resonant freq.

Droplet size from a sneeze might be a different, though.

Somewhat specific position - beamforming to direct at cough? That makes everything way more complex.

Exceeds specific  

https://www.nature.com/articles/srep18030
In this article, we show that SRET from microwave to virus can be efficient enough so that airborne virus was inactivated with reasonable microwave power density safe for the open public.

while the RNA genome was not degraded by the microwave illumination, supporting the fact that our studied SRET mechanism is fundamentally different from the microwave thermal heating effect.

HackRF only goes to 6ghz - downconverter? maybe borrow spect at York

Use IR and phone camera to find aerosol droplets and destroy?

Also need to test if tissue cells are affected

Oh wait, wavelength of 8ghz microwave is like 4 cm, so no phased array antenna required probably.

Because of the wide variation in sizes, freq. sweep probably required

TODO look up size distribution of coronaviruses

strapped to chest to maintain proper alignment with face? What if you sneeze to the left or right, that won't work

On clavicle?

mounted to goggles?


Infineon SiGe can do 10 dB at 10 GHz.

https://www.youtube.com/watch?v=drwGvATLNaw - QUCS and copper foil


what about a second harmonic?


They say 25 mW/cm^2, 3 watts for their system. If we have a 2x2 cm antenna, we'll only need about 0.1 W to hit that.

HB100 10 Ghz outputs at 10 dBm, or 10 milliwatts, which isn't quite enough.

conductive surfaces might be an issue.

It's hard to get this much power in the X band. Gunn or avalanche diodes aren't commonly available, RF amps with P1dB 20 dBm are >$20.

https://www.mouser.ca/datasheet/2/412/lb_310_data_sheet-1488804.pdf
only

There are 2w triode oscillators

bought mixer and 4ghz synth from Amazon, from downconverter - wrong package, will have to modify

Optical Hetrodyning was once used to determine absorption spectrum

Nitinol to physically change phase

Phased array. Sum two elements to get phase; servo high-side p-channel to change varactor voltage and frequency slightly

PLL-like servo technique

Phaged array


So, if we servo the phase using a PLL, 

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.135.2121&rep=rep1&type=pdf describes a simple phase-shifter.

Relative permittivity = dielectric constant. https://www.rfcafe.com/references/electrical/dielectric-constants-strengths.htm varies from ~5 for aluminosilicate to 10 for alumina.

There's a sim of flu lipid envelope: https://www.sciencedaily.com/releases/2015/02/150208152758.htm
http://www.charmm-gui.org/?doc=input/membrane.bilayer

Charmm has a vibration module. 


"In this work, microwaves were applied to excite the dipolar resonance of the whole virus structure. By exciting the dipolar mode of the nanosphere, core and shell with opposite charge distributions would move in opposite directions and will resonate like a damped mass-spring system"

So it seems like there's definitely no way this would transfer to non-enveloped phages. 

.pdb files are available for many phages. Got a license for CHARMM.

Holy crap these bio people have things figured out! Documentation, everything is so much better than plasma physics

We're trying to figure out the normal modes - vibrational frequencies - 

"Normal Mode Analysis follows the notion that although the Cartesian
coordinate system is very useful it may not be the natural coordinate
system for the molecule. There may be a different coordinate system in
which the description of the molecular motion will be far simpler. This
other coordinate system is the system of normal modes. Thus, what
'normal mode analysis' actually does is to transform the coordinate system
from the regular Cartesian set to a normal set, which is more natural to
the molecule. "
"Among the various properties that can be studied are:
1) Vibrational Spectrum - the collection of all normal frequencies. This
spectrum is comparable to experimental vibrational spectra taken
with IR spectroscopy" - fantastic.



Ah and now my lack of bio knowlee hits. Exporting a model via CHARMMing web interface, and I get: * You need to decide on the protonation states of all residues. Either they were assigned default values, or PROPKA could not be run on this molecule.

Charmming seems to be down.

This is interesting: because I was unable to simply buy my way out of the problem (by buying phi6), I had to learn more about simulation, and produce a better product. Neat!

T4 head is 111 х 78 nm (similar to )
T2 is 

ther's no ligand view for 





timeout to disable after the pandemic has ended. 

Interference with weather radar

second harmonic may decrease prices further.

use footnotes rather than endnotes

check FCC sar methods

No adverse effects have been established
from low-level exposures despite 70 years
of research
No known interaction mechanisms
No meaningful dose-response relationship 

It's interesting that these things don't apply to viruses.

angle test tubes, cap up, so dust doesn't fall on them

switch polarization, phase, etc at specific points in the resonance to enhance the effect? Switching will have to be very fast...

Will need 4ghz high pass image-rejection before mixer

"coarsened" elastic network model, which is analogous to an adaptive mesh-refined 

Completely coincidentally, the NE3210S01 fet that "Small Size X band" used is almost exactly the same as the CE3520K3 fet I bought. Also:
"A schematic diagram of the AIA is shown in Fig. 1. The antenna is comprised of two wide transmission line sections connected by a narrow linewidth section. The narrow linewidth section serves to form a transmission feedback loop, and the two wider sections radiate the radio frequency (RF) signal."


Copper Oxide + charcoal definitely works, just need to try CuO+.

We'll need HackRF <-> mixer, synth <-> mixer <-> filter, filter <-> antenna.

HackRF max input power is only 316 microwatts. That's tiny. Attenuator that I've got (I thinik CATTEN-0200) is only good to 3 Ghz anyhow.

We want to precisely measure the power. How on earth can we can level losses at 10 GHz? We don't have a reference 10 GHz generator.

Thick film resistors are good for RF.

I suppose we don't actually need a precise power measurement. We can set the level to just above where a 15 minute exposure is sufficient (thereby setting the 10 dBm reference), and then try shorter and shorter exposures.

PDB has a great list of software. https://www.cellmicrocosmos.org/index.php/cm2-project into ProDy looks good.

Used QUCS's attenuator synthesizer to make an attenuator. Great success! 30 DB:
"46.9347 Ohm"
"3.16544 Ohm"
"46.9347 Ohm"


The strength and Q of viruses changes significantly with pH. Neat!


Tried qspectrumanalyzer. Upgraded hackrf firmware. hackrf-spectrum-analyzer works pretty well.

Hey, having a direct WiFi AP on the main server to a notebook laptop would be great.

Trying to get this adf4351 board running to test the downconverter. Had it lock once, but then not...

Made a simple Nichrome pancake element with ~6" of wire. Got to about 600C on a firebrick. 





