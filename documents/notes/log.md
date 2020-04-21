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

-----

## T4 Simulation

One of the key aspects we have to test is the required duration of exposure. To do this, we need to find the resonant frequency of T4. This could be done with a microwave absorption measurement, as with Yang (2015) and Sun (2017), but having a proper simulation will allow us to simultaneously test optical centrifuge and chirp methods.



----

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


