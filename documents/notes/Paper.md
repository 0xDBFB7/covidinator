# Paper

Safe nonthermal microwave viral inactivation with a \$1 X-band phased array

Incorporate criticism and corrections into the Rebuke section

Datasheet links

"We provide a trivial extension of et al's landmark paper to "

"Note: this is a dynamic project. The latest version of this paper is available at github.com/covidinator."

Human factors

"It is reasonable to assume that emboldened by their newfound invulnerability and leave self-quarentine prematurely. Assuming rampant imperfect use, we simulate the probability "

"Start a production chapter in your country!"

*The author is an undergraduate; work was performed without York University's knowledge, at the author's laboratory. Therefore, this work is not endorsed by, and does not necessarily represent the position of York University.* - ask Bio admin about affiliation representation guidelines

"Because the frequency is determined by biological structure, trespassing on licensed frequencies is unavoidable. The non-replaceable filament will be sized such that it burns out after some 6 months of use - after the pandemic has ended. This will clear the FCC spectrum for the licensed user, who will presumably not be making good use of their allocation during this time anyways."

Many means exist to generate RF power, including 

- Gunn or IMPATT diode. Do not appear to be commonly available.

- "GaAs microwave monolithic integrated circuit (MMICs)." 

The author has no prior experience in microbiology, and access to a pathogenic BSL-2 virus would probably result in another pandemic. There are also difficulties in culturing, propagating and assaying such viruses. The Phi6, there is precedent for using. No Phi6 could be procured due to shipping restrictions and phage bank closures.

*Highlight implementation details (like reasons why Phi6 wasn't used) differently? Sidebars?*

T4 is not an ideal surrogate for SARS-CoV-2. T4 has a 120 nm prolate icosahedral membrane capsid directly surrounding the DNA core. SARS-CoV-2 has a 120 nm spherical lipid envelope surronding a 10 nm nucleocapsid, which surrounds the core. H3N2, as used by [],is 100 nm.

The charge distribution and pressure within the virus also differs.

permanent charge separation

Infobox with each citation:

> Yang et al:
> 
> - Describe dipole mode numerically
> 
> - Establish field limits

## Field Limits

Exemption limits increase from 70 mW at 35 mm from the body to:

- at or above 6 GHz and the source-based, time-averaged maximum e.i.r.p. of the device is equal to or less than 5 W (adjusted for tune-up tolerance).

In these cases, the information contained in the RF exposure technical brief may be limited to information that demonstrates how the e.i.r.p. was derived.

At between 6 to 15 GHz, in an uncontrolled (public) environment, the Canadian government sets field thresholds at 61.4 V/m RMS. They also specifiy a limit adopted by most countries; 1 milliwatt / cm^2 (10 W/m^2) over a 6 minute averaging time, along with the following constraint:

> The total incident energy density during any one-tenth second period within the averaging time shall not exceed one-fifth of the total energy density permitted during the entire averaging time for a continuous field.

#### Exposure time

both [] and [] arbitrarily chose a 15-minute exposure against H3N2. To determine the effectiveness against airborne particles, and to minimize the power required in a dwelling phased-array beam, we must first establish the required duration of exposure. 

As a damped, driven oscillator, the ring-up time depends on the Q factor. Yang et al. state the Q of H3N2 to between 2 and 10, so at 8 GHz the steady-state amplitude should be reached in well under 1 us.

Reality is rarely so tidy. [] have found a significant mechanical fatigue effect in phage capsids; a small strain applied repetitively eventually causes fracture. At low field strengths, this mechanism could extend the exposure required to break the capsid or membrane.

Variance in the sizes and stiffness of viruses (due to mutations) could shift the resonance off-peak, requiring a longer duration exposure or a frequency chirp to accommodate.

Other research[] has found T4 approximately a thousand times "easier" to inactivate chemically; however, its capsid is mechanically approx. 2x stronger than that of H3N2.

> [] obtain an excellent prediction using an elastic continuum method with a spherical virus, with opposite charges in core and shell. 

Uncontrolled electric field limits in Canada are 61.4 V/m and controlled is 137 V/m RMS. Yang et al's models for H3N2 specify a threshold at 86.9 V/m.

We wished to gain more insight into the processes which cause the fracture, in an attempt to reduce the field requirements further.

Both coarse-grained bead-spring molecular dynamics (via integration of particle motion) and finite-element methods (via solution of governing elastic PDEs) have been used to great effect for simulation of mechanical properties of viruses. More recently, all-atom methods have also become computationally viable. In order to support electric polarization effects, a MD scheme was chosen for no particularly good reason.

The algebraic normal-mode methods included in many software packages [charmm] are not generally sufficient for this task, as they often assume the limit of low-amplitudes.

The phage model was produced from raw CryoEM data using ProDy. ~~The coronavirid model was produced with LipidWrapper.~~ 

[] Each field seems to invent its own terminology for multiscale modelling. "coarse-graining" is referred to as DSMC.

[]: the use of special symbols in names seems to be problematic for searches. Hereafter we will refer to \phi 6 as Phi6.

It remains to be seen how much not-invented-here fallacy was baked into this project. 

It must be noted that, because of 
