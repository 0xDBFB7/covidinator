<Qucs Schematic >
<Properties>
  <View=-74,211,1334,1210,1.1,0,201>
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
  <Pac P1 0 520 810 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 4 520 840 0 0 0 0>
  <MGAP MS1 0 580 670 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "398.2 um" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS2 0 670 670 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "14.47 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MGAP MS3 0 760 670 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "1.717 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS4 0 850 670 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "14.47 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MGAP MS5 0 940 670 -26 15 0 0 "Subst1" 0 "1.543 mm" 1 "1.543 mm" 1 "398.2 um" 1 "Hammerstad" 0 "Kirschning" 0>
  <Pac P2 0 1020 810 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *2 4 1020 840 0 0 0 0>
  <.SP SP1 0 530 910 0 73 0 0 "lin" 1 "5.49 GHz" 1 "5.52 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 0 760 950 -30 24 0 0 "4.2" 1 "790 um" 1 "34.29 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn1 0 910 1010 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
</Components>
<Wires>
  <520 670 520 780 "" 0 0 0 "">
  <520 670 550 670 "" 0 0 0 "">
  <1020 670 1020 780 "" 0 0 0 "">
  <970 670 1020 670 "" 0 0 0 "">
  <610 670 640 670 "" 0 0 0 "">
  <700 670 730 670 "" 0 0 0 "">
  <790 670 820 670 "" 0 0 0 "">
  <880 670 910 670 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 880 910 12 #000000 0 "end-coupled, half-wavelength bandpass filter \n Butterworth 5.5 GHz...5.51 GHz \n impedance matching 50 Ohm">
</Paintings>
