Ceramic PCB

# Ceramic PCB

Copper Oxide + graphite definitely works.

Polyethylene is attacked by ethyl acetate, so we can't demold 
Polyprop. is inert to the same.

A 1 oz shot glass is about 100 g of alumina. 

"Films from three different bloom strength were prepared and dried at three different temperatures (20 °C, 40 °C and 60 °C) to investigate whether the differences in ordering and aggregation during film formation, under controlled drying conditions, reflect changes in their mechanical properties. Results showed that Young's modulus (E) was not significantly (p ≤ 0.05) influenced by the drying regime because it remained around 3.0 GPa. "
https://www.tandfonline.com/doi/full/10.1080/19476337.2010.523902

Gelatin can be freeze-dried; this preserves the shape as the water leaves by sublimation.

"In argon, pyrolysis is less efficient and the gelatin leaves an ash residue of
30 wt.% relative to the original binder content."

Talk about ball-milling

Glutinious rice flour is distinct from regular rice flour. Great option otherwise!

The glucose-derived binder only has a strength of 1,22 ± 0,16.

Glycerin is a neat solvent for some things - crosslinks xanthan gum.

Enzume urease changes the bonding of gelatin. Good results.

Glutaraldehyde isn't actually all that bad. 

The prorosity introduced by freeze-casting can be alleviated via glycerol. Might be helpful for freeze-drying.

The difference in strength between 3 and 4 % GRF is negligible. "Acrylic acid-2-acrylamido-2-methypropane sulfonic acid
copolymer (AA-AMPS, Taihe Water Treatment Co.,
Ltd., Shandong, China) was used as dispersant."
Starch is insoluble in ethanol.

They say "dried in an oven with specific temperature and humidity conditions", but don't say what those conditions are! 

We should do a thermogravimetric analysis of the drying of GRF.

PEG1000 is very hygroscopic and rapidly dries ceramics. Different percentages are used to vary the drying rate.

A box with a glass window could be used to laser-pattern copper oxide. Something to try.

Could also screen-print traces - with PVOH?

Poly(vinyl acetate) resin is soluble in acetone, 95% ethanol, isopropanol, cyclohexanone, diacetone alcohol, MEK, methanol, ethyl acetate

If spin coated, a negative mask layer of PVOH can be added after a positive mask with the copper oxide

(67) - (1.5*8)*2 = 43 mm bore. Will that be enough?

There isn't actually a dielectric requirement for ceramic substrate; we could probably get away with FR-4.

The end caps should have the spacers - oven

Made a quick two-flux thermal sim for MLI. Doesn't work - I think I've made a grave mistake trying to solve the reflection.

Oh yeah, we can't possibly print the mold for this binder - it'll melt.

11 cm takes 1.5 kw.

DPR6EA-9

Concerns regarding AS foam in vacuum seem to have been unfounded - pulled down to 5000 micron with no significant changes.

Aqueous gelcasting is rubbish. Let's try something else.

PMMA is soluble in EA. The MSDS for EA says it's spicy; wikipedia says the opposite. Who to trust?

"Poly(ethylene terephthalate), PET or PETE - PET is not very soluble in ethanol or isopropanol, but prolonged exposure may cause crazing or stiffening due to the dissolution of plasticizers." - fascinating. AE is a plasticizer for PLA, making it softer; PET 

"However, methanol or *ethanol* are nonsolvents for poly(vinyl *alcohol*) but solvents for poly(vinyl acetate)"

[https://link.springer.com/chapter/10.1007/978-3-642-78704-1_3](https://link.springer.com/chapter/10.1007/978-3-642-78704-1_3)

Acetone is slightly safer than EA.

PP is resistant to acetone.

Acetone dissolves PE.

Ethyl acetate dissolves PS.

"A solvent is suitable for a polymer if both have similar values of the **solubility** parameter." ah! neat!

PS and PMMA have similar tensile strengths. In testing, PS is indeed way more soluble in EA than Acetone.

Binder percents are often specified in volumes! 10vol.% PMMA, for instance.

>  Nevertheless, any metal (except for pure aluminium, due to an
> oxide film on the surface inhibiting sintering) or ceramic powder can be utilized in both PIM

[https://cdn.intechopen.com/pdfs/13350/intech-powder_injection_moulding_an_alternative_processing_method_for_automotive_items.pdf](https://cdn.intechopen.com/pdfs/13350/intech-powder_injection_moulding_an_alternative_processing_method_for_automotive_items.pdf)

[https://sci-hub.tw/https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1745-4603.2008.00140.x](https://sci-hub.tw/https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1745-4603.2008.00140.x)

"At a high solid concentration such as 18%, the complex viscosity shows
a decreasing trend when the time of heating exceeds 60 min. This is possibly
caused by damage of the gel network that has already been formed because of
thermal treatment. On the other hand, a dispersion with low solid content (such
as 10%) shows an increasing trend in complex viscosity up to about 40 min
after which it portrays a marked decreasing trend."

40 min sounds like the ideal time.

Yes, I think this is the key. The drying and the gelation must be isolated. Put it in a beaker, cover with aluminum foil to keep it moist, run it up to 75c. Preheat the mold too. After pouring into mold, immediately cool quickly.

Besides PEG drying or freeze-drying...there doesn't seem to be a method to rapidly dry gel-cast parts!

Tried ~10% paraffin wax. Worked perfectly. Small amount of pressure required for good molding. Casting wax in wax? no problem. Gosh darnit. Oh well, I learned a lot. 

Indeed, looking at the Dow document, Paraffin is twice as strong as PVA.

"With this method, the bending strength of sintered samples (σ = 331.6 MPa) is higher than that obtained by thermal treatment (σ = 312.3MPa).

Oh wow, mixing method (ball mill, mixer, etc) has a huge impact! See Miyamoto.

Nozzle is 1 mL - need at least 4 grams + part volume. 

Lots of progress in other document. Giving my lungs a break from the silica; let's work on something else.

I had just assumed that the mechanism behind laser copper-oxide patterning was carbothermal in nature; turns out it's a far more complex reaction using [https://en.wikipedia.org/wiki/Glycolic_acid](https://en.wikipedia.org/wiki/Glycolic_acid) [https://www.mdpi.com/2072-666X/10/6/401](https://www.mdpi.com/2072-666X/10/6/401) - apparently Gly. is very common for electroless copper. Synthesis route is relatively easy, but also quite toxic.

----

A sample of copper powder was placed on 0.5mm pressed 60/40/5 substrate and heated with a torch to dull red for a few minutes. The copper oxidized throughout almost immediately, but was otherwise quite well bonded.

------

Carbothermal has an intermediate carbon monoxide gas step. This might be the source of our failures.

However, in a vacuum CuO dissociates to Cu at ~1000 K. Very nice! (oh - for future readers, the reason why I'm going about this circuitious route is that I only have a little bit of pure copper powder - not enough for many tests.)

![](/home/arthurdent/Projects/covidinator/media/Screenshot from 2020-03-31 14-09-16.png)

Aha! The copper phase doesn't appear unless the oxygen pressure is < 10^-5 - 7.6 microns. Definitely need argon backfill.

Various tests with 60/40/5 ceramic. This stuff definitely works; 4 minutes in the SiC crucible got it to medium strength. I only have one SiC element left; it's important that it not get broken!

Ceramics represent only a local minimum for prototyping. It's hard to imagine a process requiring a 1000 C furnace being the simplest option! However, I can't find anything better in short notice (can't do electroless on PTFE or anything - don't have the chemicals, haven't had success with copper PVD in the past, etc)

----

Machinable wax bonded very strongly to the dried PVAc concoction. Unlikely that it'll be a useful mold.

Laser stencil will have sufficient resolution.

#### Laser sintering tests

Laser sintering the CuO+C paste directly at 50 mm/min: formed a faint line of copper.

50 mm/min, pure CuO powder: beads, clearly visible, slightly oxidized.

----

300 mm/min, thin aqueous dried layer: 

----

In argon:

Well focused, both 100 and 50% at 100mm/min look identical - small beads.

----

Thick layer mechanically added with spatula, well-focused, 100 mm/min in argon, (using petrie dish with acrylic lid, hole drilled, Ar tube)

30 40 25

Now thick layer with pure copper (not oxide), 40 100mm 0.2 focused is just a bit too much.

"One can readily see that in Eq. (1) Copper Oxide will
be formed quite easily as evidenced by the very large
negative heat of formation (AHo). Gold metal
remains unchanged and will not form stable oxides at
these temperatures."

---

Miserable failures with SiC crucible in vacuum. A slightly higher vacuum and a better crucible would do it, but my lungs really hurt. Moreover, I'm increasingly convinced that the argon backfill just won't work.

----------

#### Low temp screen-printed solderable traces test 1

Equal parts by wt. graphite, copper, PVA. Small amount of water. Dried at 135. traces are 10k r. Not solderable. Annealing at 220C, R dropped to about 2k / cm. Good polymer resistor, at least.

----

It seems like silver inks can be fired in air without much ado. I haven't any right now.

I have some MG chemicals "nickel shield", but the resistivity is some 0.8 ohms/sq, a bit too much.

I have one 1/16" endmill left. It's long enough to do a single graphite block in one go.

-----

Last attempt at non-vacuum reduction. c+cuo, Ar purge, test tube, bunsen burner. No dice.

-----

Some Ar was leaking around the tubing I was using. Previous Ar tests might not have been getting sufficient flow.

-----

Ran a test with the wine tumbler. Worked great. Making some alumina cylinders now, using PVC mandrels.

A few things for next time: A height gauge ring around the mandrel would be useful. Wire or tape would work.

The wax paper stuck to the mandrel - we'll see if that clears up later. Otherwise, adding some oil or mold release beforehand would probably be useful.

After ~3  hours of drying at room temp, the big 48mm one cracked on the mandrel. It cracked at the Kapton joint, but I think that's just coincidence; that area was also the thinnest. May also have gotten the mix ratio wrong; it's important to add the glue to the weigh-able tray before transferring to the larger bowl.

----

Tried in-situ sintering the vac. furnace. Worked okay! A part that hadn't dried overnight started spalling a bit.

Should have used the furnace to burnout first, however. All the volatiles melted and covered the chamber, and the residual carbon discolored the part. Doesn't seem to have affected the strength.

-----

Thought perhaps I could microwave-sinter copper traces. Copper powder was added to a mason jar, Kapton lid, filled with argon. After 10 seconds, a violent plasma explosion occurred, which then extinguished itself. It seemed visually as though the entrance of air extinguished the arc - an effect of the higher ionization energy of argon, perhaps?

> For this experiment a thin layer of graphite
> coating outside the alumina sample holder was used as a suceptor. 

Tried with copper + graphite. Big arc - different character of arc this time.

SiC, Zinc Oxide, charcoal 

[https://sci-hub.tw/https://www.researchgate.net/publication/244529718_Arcing_and_other_microwave_characteristics_of_metal_powders_in_liquid_systems](https://sci-hub.tw/https://www.researchgate.net/publication/244529718_Arcing_and_other_microwave_characteristics_of_metal_powders_in_liquid_systems)

Tried with a touch of water and PVAc. Less arcing, no sintering. Glass broke.

Made SiC susceptor + CuO + C mix. In a test tube. No arcing this time. No heating, either.

----

[https://sci-hub.tw/https://pubs.acs.org/doi/abs/10.1021/jp205281a](https://sci-hub.tw/https://pubs.acs.org/doi/abs/10.1021/jp205281a)

> irradiated, the CuO NPs photochemically can react with the
> ethylene glycol (C2H6O2) as follows

Acetaldehyde produced is fienishly toxic.

----

Going to take a break from the cofired process and try prototyping via router.

Z-levelling: Linuxcnc has a Probekins thinger.    

Then there's also a Z height file filter [https://github.com/hase-berlin/pcbGcodeZprobing](https://github.com/hase-berlin/pcbGcodeZprobing)

Oh hey! triode need not be planar - could be a via-based thing. That means we can have a whole bunch of little holes, perfect for cold field-emitters!

Wavelength at 10 GHz is like 10mm.

GaN looks like a reasonably easy alternative - still way more complex than a vac. system

[https://www.pasternack.com/t-calculator-wavelength.aspx](https://www.pasternack.com/t-calculator-wavelength.aspx)

> That is, the field emitters themselves must have dimensions less that 0.1 micrometers in order to generate the high electrostatic fields necessary for electron tunneling

[https://www.cambridge.org/core/journals/mrs-online-proceedings-library-archive/article/silicon-field-emitter-array-planar-vacuum-fet-fabricated-with-microfabrication-techniques/6D8EA9A163B6DF82C82DDDE96F147C5A](https://www.cambridge.org/core/journals/mrs-online-proceedings-library-archive/article/silicon-field-emitter-array-planar-vacuum-fet-fabricated-with-microfabrication-techniques/6D8EA9A163B6DF82C82DDDE96F147C5A)

> --------------  copper anode from PCB to retain hermeticity
> 
> |            | - alumina ring, small layer of Ti + solder on top and bottom
> 
> |            | - vac. pulldown port, sputter baffle?
> 
> ---- ---- --- grid
> 
> ===  === W cathode
> 
> ------------- Ti getter sputter layer? perhaps coated on the W cathode?
> 
> slant for phase shift? alumina insulator can be cut at an angle.

Wait, but that means we have the worst of both worlds? 

I guess it minimizes the furnace size.

"Low vacuum MEMS ion-sorption micropump" all the way from atmosphere! Amazing!

"Further tests of the micropump have been performed with use
of the miniature Bayard-Alpert gauge (Fig. 12a), which has been
fabricated for this purpose especially," amazing

sputter pump

Externally heated getter with torch?

The real question here is, am I overestimating the difficulty of producing millions of units?
[https://www.linkedin.com/pulse/china-expected-become-worlds-largest-pcb-country-aken-cheung](https://www.linkedin.com/pulse/china-expected-become-worlds-largest-pcb-country-aken-cheung)

Chinese PCB production capacity seems to be on the order of 500 million square meters per year (extrapolating from +21 m/year being 5% growth). If each board is 8 cm^2, that's..10^10/month! holy crap! So we're probably okay to use stock PCBs?

The global MMIC market is $9b/year. Taking a random sample from digikey, we find the average price at 10,000-of is \$26.4. Previously I found the price to be \$7; so we're probably on the right order. That gives about 1 B devices/year, or 83 million per month, of which about 1/20th seems to be > X-band. That's 4 million/month, and that's not nearly 100 million/month. Even an order of magnitude more won't do it. Also, how many *extra* parts are there? It's not like they're going to stop shipping to other companies for a month.

----

There's a guy called Y.Srinivasa Rao who seems to have published some many, many papers on the subject of polymer resistors. Good on ya!

---

At 10ghz, on 0.7 mm PCB, microstrip should be 1.36 mm. Changes very little with frequency between 8 and 10 GHz.

At 1.6mm thickness, 3.35792 mm. Conductor losses are about half.

Thickness of copper (even to 0.3 mm) seems to have little effect on the dimensions.

[http://kicad-kicon.com/wp-content/uploads/2019/05/Darrell-Harmon-kicon19.pdf](http://kicad-kicon.com/wp-content/uploads/2019/05/Darrell-Harmon-kicon19.pdf)

This guy makes a 15 GHz filter on thin OSHpark flex. some issues with max impedance because of thickness, ground cutout needed.

Man, RF resistors are super expensive - and the Vishay FC series only goes in factors of 5 and 10, so we'd need to parallel a bunch. That's no good.

> RF resistors should be approximately as wide as the microstrip trace itself

Pencil lead is a bit too conductive for the purpose -  2 ohms / cm or so. Difficult to tune, even with a file, and the resistance is pressure-sensitive.

we could use gigabeq's copper plating technique for the contacts

0.08g fine graphite + 0.055g PVAc was mixed, squished onto a glass slide. Only a small amount of the graphite was wetted by the PVAc and used.

Resistance was in the Mohms.

It was then baked with 150c hot air for 1m. Formed a hard plastic layer. With sufficient contact pressure, 200 ohms could be obtained! Wonderful.

-----

Rather than using a conformal coating, the PCB could be vacuum-sealed in PE film. Connectors might be a bit tricky?


