<Qucs Schematic >
<Properties>
  <View=-74,-173,1334,920,0.909091,0,0>
  <Grid=10,10,1>
  <DataSet=local_oscillator_test_qucs.dat>
  <DataDisplay=local_oscillator_test_qucs.dpl>
  <OpenDisplay=1>
  <Script=local_oscillator_test_qucs.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 430 360 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 5 430 390 0 0 0 0>
  <MGAP MS1 1 490 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "91.13 um" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS2 1 580 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "14.36 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MGAP MS3 1 670 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "1.333 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS4 1 760 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "14.54 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MGAP MS5 1 850 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "1.731 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS6 1 940 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "14.49 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MGAP MS7 1 1030 220 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "492.7 um" 1 "Hammerstad" 0 "Kirschning" 0>
  <Pac P2 1 1110 360 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *2 5 1110 390 0 0 0 0>
  <.SP SP1 1 440 460 0 69 0 0 "lin" 1 "5 GHz" 1 "6 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 670 500 -30 24 0 0 "4.2" 1 "790 um" 1 "34.29 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn1 1 820 560 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
</Components>
<Wires>
  <430 220 430 330 "" 0 0 0 "">
  <430 220 460 220 "" 0 0 0 "">
  <1110 220 1110 330 "" 0 0 0 "">
  <1060 220 1110 220 "" 0 0 0 "">
  <520 220 550 220 "" 0 0 0 "">
  <610 220 640 220 "" 0 0 0 "">
  <700 220 730 220 "" 0 0 0 "">
  <790 220 820 220 "" 0 0 0 "">
  <880 220 910 220 "" 0 0 0 "">
  <970 220 1000 220 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 790 460 12 #000000 0 "end-coupled, half-wavelength bandpass filter \n Bessel 5.5 GHz...5.51 GHz \n impedance matching 50 Ohm">
</Paintings>
