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


