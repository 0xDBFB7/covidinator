<Qucs Schematic >
<Properties>
  <View=-380,-205,3263,1947,0.909111,623,1565>
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
  <Pac P1 1 -80 210 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *1 5 -80 240 0 0 0 0>
  <GND *2 5 40 200 0 0 0 0>
  <.SP SP1 0 -330 550 0 88 0 0 "lin" 1 "0.5 GHz" 1 "15 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <.AC AC1 1 -310 370 0 51 0 0 "lin" 1 "0.1 GHz" 1 "20GHz" 1 "400" 1 "no" 0>
  <.SW SW1 0 -70 560 0 88 0 0 "SP1" 1 "lin" 1 "Spacing" 1 "0.2e-3" 1 "2e-3" 1 "20" 1>
  <MLIN MS4 1 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 5 180 -130 0 0 0 0>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn Eqn6 1 300 960 -31 17 0 0 "vfb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <.SW SW3 1 320 580 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3pF" 1 "0.7pF" 1 "2" 1>
  <Eqn Eqn7 1 460 920 -31 17 0 0 "L_parasitic=0.7e-9" 1 "yes" 0>
  <Eqn Eqn3 0 570 600 -31 17 0 0 "C1=0.3e-12" 1 "yes" 0>
  <Eqn Eqn8 1 880 630 -31 17 0 0 "C2=C1" 1 "C3=10e-12" 1 "C4=C1" 1 "yes" 0>
  <Eqn Eqn11 1 300 1160 -31 17 0 0 "out_cross=cross * Vout.v" 1 "yes" 0>
  <L L20 1 200 260 -75 -26 0 3 "220 nH" 1 "" 0>
  <GND *21 5 200 290 0 0 0 0>
  <L L25 1 750 300 -75 -26 0 3 "0.2 nH" 1 "" 0>
  <R R4 1 750 240 15 -26 1 3 "10000 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *37 5 750 340 0 0 0 0>
  <SUBST Subst1 1 1870 -110 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <MLIN MS5 1 520 170 -26 15 0 0 "Subst1" 1 "2 mm" 1 "Len1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SW SW2 0 160 580 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "5 pF" 1 "10" 1>
  <L L1 1 260 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C5 1 350 170 -26 -57 0 2 "C3" 1 "" 0 "neutral" 0>
  <MLIN MS33 1 410 170 -26 15 0 0 "Subst1" 1 "0.884 mm" 1 "0.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 620 170 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "Len2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L3 1 960 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <L L4 1 1170 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C8 1 1270 170 -26 -57 0 2 "C2" 1 "" 0 "neutral" 0>
  <C C7 1 1060 170 -26 -57 0 2 "C4" 1 "" 0 "neutral" 0>
  <L L27 1 1120 30 10 -26 0 1 "0.2 nH" 1 "" 0>
  <GND *27 5 970 -100 0 0 0 2>
  <C C24 2 1030 -90 -26 17 0 0 "0.1 uF" 1 "" 0 "neutral" 0>
  <MRSTUB MS30 1 1120 -100 -18 14 0 0 "Subst1" 1 "0.2 mm" 0 "1.5 mm" 1 "180" 1>
  <R R6 1 1120 90 -119 -26 1 1 "10000 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C11 1 1120 200 -58 -26 0 3 "C1" 1 "" 0 "neutral" 0>
  <SPfile X1 1 2980 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <R R1 1 3130 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *13 5 3130 230 0 0 0 0>
  <C C10 1 2690 170 -26 -57 0 2 "C3" 1 "" 0 "neutral" 0>
  <L L6 1 2600 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <GND *12 5 2980 200 0 0 0 0>
  <L L26 1 2800 260 -75 -26 0 3 "0.2 nH" 1 "" 0>
  <R R5 1 2800 200 15 -26 1 3 "10000 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *38 5 2800 310 0 0 0 0>
  <L L32 1 1930 280 -75 -26 0 3 "0.2 nH" 1 "" 0>
  <R R8 1 1930 220 15 -26 1 3 "10000 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *36 5 1930 320 0 0 0 0>
  <MLIN MS32 1 2530 170 -26 15 0 0 "Subst1" 1 "0.884 mm" 1 "0.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 2300 170 -26 15 0 0 "Subst1" 1 "2 mm" 1 "Len1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 2180 170 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "Len2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn10 1 300 1060 -31 17 0 0 "cross=phase_shift * Vfb.v" 1 "yes" 0>
  <Eqn Eqn12 1 -20 930 -31 17 0 0 "pha=phase(Vfb.v)" 1 "yes" 0>
  <L L7 1 1120 300 -75 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *34 5 1120 330 0 0 0 0>
  <Eqn Eqn9 1 880 760 -31 17 0 0 "Len1=0.45e-3*scale_factor" 1 "Len2=Len1 / length_ratio" 1 "scale_factor=1.6" 1 "length_ratio=0.152" 1 "yes" 0>
  <Eqn Eqn2 0 -130 1130 -31 17 0 0 "phase_shift=phase(S[2,1])" 1 "yes" 0>
  <MLIN MS34 1 1600 170 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "15 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn1 1 -20 840 -31 17 0 0 "phase_shift=angle(Vfb.v)" 1 "yes" 0>
  <Pac P2 1 540 1730 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *39 5 540 1760 0 0 0 0>
  <MLIN MS35 1 710 1690 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "23.41 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R9 1 920 1720 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *40 5 920 1750 0 0 0 0>
  <Eqn Eqn13 1 630 1870 -31 17 0 0 "phase_shift_2=phase(Vfb2.v)" 1 "yes" 0>
</Components>
<Wires>
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "Vin" -80 140 49 "">
  <120 170 200 170 "Vamp1" 170 120 13 "">
  <750 170 750 210 "" 0 0 0 "">
  <750 330 750 340 "" 0 0 0 "">
  <200 170 200 230 "" 0 0 0 "">
  <200 170 230 170 "" 0 0 0 "">
  <290 170 320 170 "" 0 0 0 "">
  <440 170 490 170 "" 0 0 0 "">
  <650 170 750 170 "" 0 0 0 "">
  <550 170 590 170 "" 0 0 0 "">
  <750 170 930 170 "" 0 0 0 "">
  <990 170 1030 170 "" 0 0 0 "">
  <1090 170 1120 170 "" 0 0 0 "">
  <1200 170 1240 170 "" 0 0 0 "">
  <1120 170 1140 170 "" 0 0 0 "">
  <1060 -90 1120 -90 "" 0 0 0 "">
  <970 -100 970 -90 "" 0 0 0 "">
  <970 -90 1000 -90 "" 0 0 0 "">
  <1120 -90 1120 0 "" 0 0 0 "">
  <1120 120 1120 170 "" 0 0 0 "">
  <3010 170 3130 170 "" 0 0 0 "">
  <2630 170 2660 170 "" 0 0 0 "">
  <2720 170 2800 170 "" 0 0 0 "">
  <2800 170 2950 170 "Vfb" 2940 140 110 "">
  <2800 290 2800 310 "" 0 0 0 "">
  <1930 170 1930 190 "" 0 0 0 "">
  <1930 310 1930 320 "" 0 0 0 "">
  <2560 170 2570 170 "" 0 0 0 "">
  <2330 170 2500 170 "" 0 0 0 "">
  <2210 170 2270 170 "" 0 0 0 "">
  <1930 170 2150 170 "" 0 0 0 "">
  <1300 170 1570 170 "" 0 0 0 "">
  <1120 230 1120 270 "" 0 0 0 "">
  <1630 170 1930 170 "" 0 0 0 "">
  <540 1690 540 1700 "" 0 0 0 "">
  <540 1690 680 1690 "Vin2" 680 1660 109 "">
  <740 1690 920 1690 "Vfb2" 860 1660 83 "">
</Wires>
<Diagrams>
  <Rect 1240 1422 1155 177 3 #c0c0c0 1 00 1 0 1e+09 2e+10 1 -0.375 1 2 1 -1 1 1 315 0 225 "" "" "" "">
	<"Vout.v" #0000ff 0 3 0 0 0>
	<"Vfb.v" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 1240 697 1158 237 3 #c0c0c0 1 00 1 0 1e+09 2e+10 1 -0.167847 0.5 1.84845 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"Vfb.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Tab 730 1170 300 200 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 1 315 0 225 "" "" "" "">
	<"Len1" #0000ff 0 3 1 0 0>
	<"Len2" #0000ff 0 3 0 0 0>
  </Tab>
  <Rect 1240 936 1154 186 3 #c0c0c0 1 00 1 0 1e+09 2e+10 1 -215.487 100 215.844 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 380 450 12 #000000 0 "stepped-impedance lowpass filter \n Butterworth 8 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 650 1620 12 #000000 0 "360 degrees @ 7 GHz">
</Paintings>
