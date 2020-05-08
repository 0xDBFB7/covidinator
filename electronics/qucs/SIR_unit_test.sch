<Qucs Schematic >
<Properties>
  <View=66,239,1892,1732,1,26,0>
  <Grid=10,10,1>
  <DataSet=SIR_unit_test.dat>
  <DataDisplay=SIR_unit_test.dpl>
  <OpenDisplay=1>
  <Script=SIR_unit_test.m>
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
  <.SP SP1 1 350 780 0 88 0 0 "lin" 1 "0.5 GHz" 1 "5 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 840 830 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Pac P2 1 1330 570 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1330 600 0 0 0 0>
  <L L1 1 1150 540 -26 10 0 0 "0.2 nH" 1 "" 0>
  <L L2 1 260 540 -26 10 0 0 "0.2 nH" 1 "" 0>
  <Pac P1 1 120 570 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 120 600 0 0 0 0>
  <L L3 1 680 540 -26 10 0 0 "0.7 nH" 1 "" 0>
  <C C1 1 330 540 -26 17 0 0 "0.84 pF" 1 "" 0 "neutral" 0>
  <C C2 1 770 540 -26 17 0 0 "1 pF" 1 "" 0 "neutral" 0>
  <C C3 1 1230 540 -26 17 0 0 "0.84 pF" 1 "" 0 "neutral" 0>
  <MLIN MS5 1 540 360 -26 15 0 0 "Subst1" 1 "2.1 mm" 1 "14.31 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 390 360 -26 15 0 0 "Subst1" 1 "14.25 mm" 1 "21.83 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS7 1 880 360 -26 15 0 0 "Subst1" 1 "2.1 mm" 1 "14.31 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 1010 360 -26 15 0 0 "Subst1" 1 "14.25 mm" 1 "21.83 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <TLIN Line1 1 570 540 -26 20 0 0 "80 Ohm" 1 "1 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line2 1 460 540 -26 20 0 0 "20 Ohm" 1 "1 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line3 1 1000 540 -26 20 0 0 "20 Ohm" 1 "1 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line4 1 890 540 -26 20 0 0 "80 Ohm" 1 "1 mm" 1 "0 dB" 0 "26.85" 0>
</Components>
<Wires>
  <1260 540 1330 540 "" 0 0 0 "">
  <1180 540 1200 540 "" 0 0 0 "">
  <1040 540 1120 540 "" 0 0 0 "">
  <290 540 300 540 "" 0 0 0 "">
  <120 540 230 540 "" 0 0 0 "">
  <600 540 650 540 "" 0 0 0 "">
  <710 540 740 540 "" 0 0 0 "">
  <800 540 850 540 "" 0 0 0 "">
  <420 360 510 360 "" 0 0 0 "">
  <910 360 980 360 "" 0 0 0 "">
  <490 540 540 540 "" 0 0 0 "">
  <360 540 430 540 "" 0 0 0 "">
  <920 540 970 540 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1200 973 645 203 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1570 1650 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
