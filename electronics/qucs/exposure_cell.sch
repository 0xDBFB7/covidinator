<Qucs Schematic >
<Properties>
  <View=0,-171,1714,1312,0.909093,4,0>
  <Grid=10,10,1>
  <DataSet=exposure_cell.dat>
  <DataDisplay=exposure_cell.dpl>
  <OpenDisplay=1>
  <Script=exposure_cell.m>
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
  <.TR TR1 1 240 180 0 77 0 0 "lin" 1 "0" 1 "10 ns" 1 "20001" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <TLIN Line1 1 300 420 -26 20 0 0 "50 Ohm" 1 "10 mm" 1 "0 dB" 0 "26.85" 0>
  <R R2 1 180 420 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *1 5 70 480 0 0 0 0>
  <GND * 5 440 340 0 0 0 0>
  <TLIN Line5 2 440 520 20 -26 0 1 "50 Ohm" 1 "40 mm" 1 "0 dB" 0 "26.85" 0>
  <GND * 5 440 550 0 0 0 0>
  <SUBST Subst1 1 1590 220 -30 24 0 0 "2.1" 1 "1.6 mm" 1 "35 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <VProbe Pr1 1 1110 330 28 -31 0 0>
  <TLIN Line2 2 1230 420 -26 20 0 0 "1 Ohm" 1 "30 mm" 1 "0 dB" 0 "26.85" 0>
  <GND * 5 1400 440 0 0 0 0>
  <GND *2 5 1070 560 0 0 0 0>
  <L L1 2 1020 420 -26 10 0 0 "1 nH" 1 "" 0>
  <Vpulse V1 1 70 450 18 -26 0 1 "0 V" 1 "1 V" 1 "0" 1 "1500 ps" 1 "0.15 ns" 0 "0.15 ns" 0>
  <TLIN Line6 1 740 420 -26 20 0 0 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <GND *3 5 670 340 0 0 0 0>
  <TLIN Line7 1 670 520 20 -26 0 1 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <GND *4 5 670 550 0 0 0 0>
  <TLIN Line8 1 670 370 20 -26 0 1 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line4 1 570 420 -26 20 0 0 "50 Ohm" 1 "40 mm" 1 "0 dB" 0 "26.85" 0>
  <C C1 2 1110 420 -26 17 0 0 "1 pF" 1 "" 0 "neutral" 0>
  <R R3 0 1070 530 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R1 1 1330 420 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <TLIN Line3 1 440 370 20 -26 0 1 "50 Ohm" 1 "40 mm" 1 "0 dB" 0 "26.85" 0>
</Components>
<Wires>
  <330 420 440 420 "" 0 0 0 "">
  <210 420 270 420 "vin" 270 390 25 "">
  <70 420 150 420 "" 0 0 0 "">
  <440 420 440 490 "" 0 0 0 "">
  <1070 350 1100 350 "" 0 0 0 "">
  <1120 350 1150 350 "" 0 0 0 "">
  <1140 500 1150 500 "" 0 0 0 "">
  <1070 500 1080 500 "" 0 0 0 "">
  <1150 350 1150 380 "" 0 0 0 "">
  <1140 380 1150 380 "" 0 0 0 "">
  <1070 350 1070 380 "" 0 0 0 "">
  <1070 380 1080 380 "" 0 0 0 "">
  <1150 380 1150 420 "" 0 0 0 "">
  <1150 420 1150 500 "" 0 0 0 "">
  <1150 420 1200 420 "" 0 0 0 "">
  <1070 380 1070 420 "vout" 1010 310 20 "">
  <1070 420 1070 500 "" 0 0 0 "">
  <1050 420 1070 420 "" 0 0 0 "">
  <770 420 990 420 "" 0 0 0 "">
  <670 420 710 420 "" 0 0 0 "">
  <670 420 670 490 "" 0 0 0 "">
  <670 400 670 420 "" 0 0 0 "">
  <600 420 670 420 "" 0 0 0 "">
  <440 420 540 420 "" 0 0 0 "">
  <1140 420 1150 420 "" 0 0 0 "">
  <1070 420 1080 420 "" 0 0 0 "">
  <1400 420 1400 440 "" 0 0 0 "">
  <1360 420 1400 420 "" 0 0 0 "">
  <1260 420 1300 420 "" 0 0 0 "">
  <440 400 440 420 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 130 710 12 #000000 0 " shorting the ends inverts the pulse, as expected. \nend open reflects verbatim, as expected.">
  <Text 370 830 12 #000000 0 "electricConstant * 70 * (0.05 mm * 3 mm) / 0.1 mm -> pF\n= 0.92 pF">
  <Text 610 1230 12 #000000 0 "Bessel high-pass filter \n 10 GHz cutoff, pi-type, \n impedance matching 50 Ohm">
</Paintings>
