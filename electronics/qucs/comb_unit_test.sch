<Qucs Schematic >
<Properties>
  <View=66,167,2322,1731,0.751318,109,0>
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
  <MCOUPLED MS1 1 950 510 -44 -159 1 1 "Subst1" 1 "1.119 mm" 1 "2.5 mm" 1 "1 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <GND * 5 920 480 0 0 0 0>
  <GND * 5 980 480 0 0 0 0>
  <.SW SW1 0 610 790 0 88 0 0 "SP1" 1 "lin" 1 "Spacing" 1 "0.2e-3" 1 "2e-3" 1 "20" 1>
  <Eqn Eqn1 0 660 1080 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn2 1 660 1220 -31 17 0 0 "phase_shift=phase(S[2,1])" 1 "yes" 0>
  <GND *1 5 1000 720 0 0 0 0>
  <GND *2 5 900 720 0 0 0 0>
  <C C1 1 1000 610 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <C C5 1 900 670 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C6 1 1000 670 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C2 1 900 610 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <.SW SW2 1 810 800 0 88 0 0 "SP1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "10 pF" 1 "30" 1>
  <SUBST Subst1 1 1980 430 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Pac P1 1 440 580 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 440 610 0 0 0 0>
  <SPfile X1 1 560 540 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *3 5 560 570 0 0 0 0>
  <MCOUPLED MS2 1 1160 470 -44 -159 1 1 "Subst1" 1 "1.119 mm" 1 "2.5 mm" 1 "1 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <GND *4 5 1130 440 0 0 0 0>
  <GND *5 5 1190 440 0 0 0 0>
  <GND *6 5 1210 680 0 0 0 0>
  <GND *7 5 1110 680 0 0 0 0>
  <C C10 1 1210 570 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <C C11 1 1110 630 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C12 1 1210 630 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C13 1 1110 570 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <C C7 1 680 540 -26 -57 0 2 "0.5 pF" 1 "" 0 "neutral" 0>
  <C C8 1 790 540 -26 -57 0 2 "0.5 pF" 1 "" 0 "neutral" 0>
  <Pac P2 1 1330 570 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1330 600 0 0 0 0>
  <Eqn Eqn3 0 420 1140 -31 17 0 0 "C1=4e-12" 1 "yes" 0>
</Components>
<Wires>
  <920 540 920 580 "" 0 0 0 "">
  <980 540 980 580 "" 0 0 0 "">
  <1000 540 1000 580 "" 0 0 0 "">
  <980 580 1000 580 "" 0 0 0 "">
  <900 580 920 580 "" 0 0 0 "">
  <900 700 900 720 "" 0 0 0 "">
  <1000 700 1000 720 "" 0 0 0 "">
  <440 540 440 550 "" 0 0 0 "">
  <440 540 530 540 "" 0 0 0 "">
  <1210 660 1210 680 "" 0 0 0 "">
  <1130 500 1130 540 "" 0 0 0 "">
  <1190 500 1190 540 "" 0 0 0 "">
  <1210 500 1210 540 "" 0 0 0 "">
  <1190 540 1210 540 "" 0 0 0 "">
  <1110 540 1130 540 "" 0 0 0 "">
  <1110 660 1110 680 "" 0 0 0 "">
  <1110 500 1110 540 "" 0 0 0 "">
  <1000 540 1110 540 "" 0 0 0 "">
  <900 540 900 580 "" 0 0 0 "">
  <820 540 900 540 "" 0 0 0 "">
  <590 540 650 540 "" 0 0 0 "">
  <710 540 760 540 "" 0 0 0 "">
  <1210 540 1330 540 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1120 1262 1085 192 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1120 1014 1096 224 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1570 1650 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
