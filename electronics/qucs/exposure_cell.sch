<Qucs Schematic >
<Properties>
  <View=0,-115,1714,969,1,0,153>
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
  <.TR TR1 1 240 180 0 73 0 0 "lin" 1 "0" 1 "10 ns" 1 "20001" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <TLIN Line1 1 300 420 -26 20 0 0 "50 Ohm" 1 "10 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line4 1 510 420 -26 20 0 0 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <R R2 1 180 420 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *1 5 70 480 0 0 0 0>
  <TLIN Line3 1 440 370 20 -26 0 1 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <GND * 5 440 340 0 0 0 0>
  <TLIN Line5 1 440 520 20 -26 0 1 "50 Ohm" 1 "100 mm" 1 "0 dB" 0 "26.85" 0>
  <GND * 5 440 550 0 0 0 0>
  <Vpulse V1 1 70 450 18 -26 0 1 "0 V" 1 "1 V" 1 "0" 1 "550 ps" 1 "0.15 ns" 0 "0.15 ns" 0>
  <SUBST Subst1 1 1590 220 -30 24 0 0 "2.1" 1 "1.6 mm" 1 "35 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <VProbe Pr1 1 810 330 28 -31 0 0>
  <TLIN Line2 1 930 420 -26 20 0 0 "5 Ohm" 1 "30 mm" 1 "0 dB" 0 "26.85" 0>
  <R R1 2 1030 420 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 5 1100 440 0 0 0 0>
  <R R3 1 770 530 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *2 5 770 560 0 0 0 0>
  <L L1 2 720 420 -26 10 0 0 "1 nH" 1 "" 0>
  <C C1 1 810 420 -26 17 0 0 "3 pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <330 420 440 420 "" 0 0 0 "">
  <440 420 480 420 "" 0 0 0 "">
  <210 420 270 420 "vin" 270 390 25 "">
  <70 420 150 420 "" 0 0 0 "">
  <440 400 440 420 "" 0 0 0 "">
  <440 420 440 490 "" 0 0 0 "">
  <770 350 800 350 "" 0 0 0 "">
  <820 350 850 350 "" 0 0 0 "">
  <840 500 850 500 "" 0 0 0 "">
  <770 500 780 500 "" 0 0 0 "">
  <850 350 850 380 "" 0 0 0 "">
  <840 380 850 380 "" 0 0 0 "">
  <770 350 770 380 "" 0 0 0 "">
  <770 380 780 380 "" 0 0 0 "">
  <850 380 850 420 "" 0 0 0 "">
  <850 420 850 500 "" 0 0 0 "">
  <850 420 900 420 "" 0 0 0 "">
  <770 380 770 420 "vout" 700 320 20 "">
  <770 420 770 500 "" 0 0 0 "">
  <960 420 1000 420 "" 0 0 0 "">
  <1060 420 1100 420 "" 0 0 0 "">
  <1100 420 1100 440 "" 0 0 0 "">
  <840 420 850 420 "" 0 0 0 "">
  <770 420 780 420 "" 0 0 0 "">
  <750 420 770 420 "" 0 0 0 "">
  <540 420 690 420 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 130 710 12 #000000 0 " shorting the ends inverts the pulse, as expected. \nend open reflects verbatim, as expected.">
  <Text 370 830 12 #000000 0 "electricConstant * 70 * (0.05 mm * 3 mm) / 0.1 mm -> pF\n= 0.92 pF">
</Paintings>
