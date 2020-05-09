<Qucs Schematic >
<Properties>
  <View=66,218,2322,1731,0.620924,0,8>
  <Grid=10,10,1>
  <DataSet=comb_unit_test.dat>
  <DataDisplay=comb_unit_test.dpl>
  <OpenDisplay=1>
  <Script=comb_unit_test.m>
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
  <.SP SP1 1 350 780 0 88 0 0 "lin" 1 "0.5 GHz" 1 "15 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 840 830 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <MCOUPLED MS1 1 950 510 -44 -159 1 1 "Subst1" 1 "1.119 mm" 1 "2.575 mm" 1 "1 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 1140 570 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1140 600 0 0 0 0>
  <Pac P1 1 760 570 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 760 600 0 0 0 0>
  <GND * 5 920 480 0 0 0 0>
  <GND * 5 980 480 0 0 0 0>
  <GND *2 5 900 600 0 0 0 0>
  <GND *1 5 1000 600 0 0 0 0>
  <C C1 1 1000 570 17 -26 0 1 "0.3 pF" 1 "" 0 "neutral" 0>
  <C C2 1 900 570 17 -26 0 1 "0.3 pF" 1 "" 0 "neutral" 0>
  <.SW SW1 0 610 790 0 88 0 0 "AC1" 1 "lin" 1 "Leng" 1 "3e-3" 1 "20e-3" 1 "20" 1>
  <Eqn Eqn1 0 660 1080 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn2 1 660 1220 -31 17 0 0 "phase_shift=phase(S[2,1])" 1 "yes" 0>
</Components>
<Wires>
  <760 540 900 540 "Vin" 720 490 29 "">
  <980 540 1000 540 "" 0 0 0 "">
  <1000 540 1140 540 "Vo" 1140 510 115 "">
  <900 540 920 540 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1120 994 1096 224 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1120 1262 1085 192 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1570 1650 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
