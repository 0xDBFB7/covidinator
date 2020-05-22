<Qucs Schematic >
<Properties>
  <View=-740,-797,5043,940,0.909516,547,427>
  <Grid=10,10,1>
  <DataSet=test.dat>
  <DataDisplay=test.dpl>
  <OpenDisplay=1>
  <Script=test.m>
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
  <MLIN MS4 1 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 5 180 -130 0 0 0 0>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <SUBST Subst1 1 740 -130 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <C C1 0 2100 -220 -26 -57 0 2 "C_1" 1 "" 0 "neutral" 0>
  <L L1 0 1980 -220 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C2 0 1610 -220 -26 -57 0 2 "C_varactor" 1 "" 0 "neutral" 0>
  <C C3 0 1120 -220 -26 -57 0 2 "C_1" 1 "" 0 "neutral" 0>
  <L L2 0 1030 -220 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <L L3 0 1510 -220 -26 -50 0 2 "0.7 nH" 1 "" 0>
  <MLIN MS12 0 1370 -220 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "length_2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS13 0 1240 -220 -26 15 0 0 "Subst1" 1 "4 mm" 1 "length_1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS14 0 1860 -220 -26 15 0 0 "Subst1" 1 "4 mm" 1 "length_1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS15 0 1730 -220 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "length_2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS16 0 270 -740 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_0 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS17 0 730 -740 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS18 0 480 -710 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "var_1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L4 0 1570 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <GND *16 4 1510 -620 0 0 0 0>
  <L L5 0 1510 -670 -75 -26 0 3 "var_2 nH" 1 "" 0>
  <L L6 0 1350 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C4 0 1450 -720 -26 -57 0 2 "var_0 pF" 1 "" 0 "neutral" 0>
  <C C5 0 1670 -720 -26 -57 0 2 "var_0 pF" 1 "" 0 "neutral" 0>
  <L L7 0 2220 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <GND *17 4 2160 -620 0 0 0 0>
  <L L8 0 2160 -670 -75 -26 0 3 "var_6 nH" 1 "" 0>
  <L L9 0 2000 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C6 0 2100 -720 -26 -57 0 2 "var_5 pF" 1 "" 0 "neutral" 0>
  <C C7 0 2320 -720 -26 -57 0 2 "var_5 pF" 1 "" 0 "neutral" 0>
  <L L10 0 1810 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C8 0 1900 -720 -26 -57 0 2 "C_varactor" 1 "" 0 "neutral" 0>
  <L L11 0 2810 -720 -26 -50 0 2 "var_1 nH" 1 "" 0>
  <L L12 0 2690 -720 -26 -50 0 2 "var_1 nH" 1 "" 0>
  <C C9 0 2750 -670 -58 -26 0 3 "var_3 pF" 1 "" 0 "neutral" 0>
  <L L13 0 3050 -720 -26 -50 0 2 "var_7 nH" 1 "" 0>
  <L L14 0 2930 -720 -26 -50 0 2 "var_7 nH" 1 "" 0>
  <L L15 0 2990 -610 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *18 4 2990 -580 0 0 0 0>
  <C C10 0 2990 -670 -58 -26 0 3 "var_8 pF" 1 "" 0 "neutral" 0>
  <L L16 0 2420 -720 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C11 0 2510 -720 -26 -57 0 2 "C_varactor" 1 "" 0 "neutral" 0>
  <L L17 0 2750 -590 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <L L18 0 2750 -420 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *19 4 2750 -390 0 0 0 0>
  <C C12 0 2750 -510 -116 -26 0 3 "C_varactor" 1 "" 0 "neutral" 0>
  <Eqn Eqn7 1 860 860 -31 17 0 0 "phase_shift=-unwrap(angle(Vfb.v))/(2*pi)" 1 "yes" 0>
  <Eqn Eqn6 1 610 860 -31 17 0 0 "vfb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <.AC AC1 1 300 770 0 51 0 0 "lin" 1 "0.1 GHz" 1 "15 GHz" 1 "100" 1 "no" 0>
  <Eqn Eqn8 1 610 730 -31 17 0 0 "L_p_SOD523=0.7e-9" 1 "yes" 0>
  <GND *15 5 2870 200 0 0 0 0>
  <GND *13 5 3020 230 0 0 0 0>
  <R R1 1 3020 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SPfile X1 1 2870 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <MLIN MS26 1 2650 170 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_0" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS25 1 300 170 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_0" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn9 1 860 730 -31 17 0 0 "L_p_0402=0.2e-9" 1 "yes" 0>
  <Eqn Eqn10 1 1050 750 -31 17 0 0 "width=0.2e-3" 1 "yes" 0>
  <Eqn Eqn11 1 1220 670 -31 17 0 0 "var_3=0.3e-12" 1 "yes" 0>
  <Eqn Eqn12 1 1440 670 -31 17 0 0 "var_0=10e-3" 1 "yes" 0>
  <C C25 1 40 380 -78 -26 0 3 "var_3" 1 "" 0 "neutral" 0>
  <L L35 1 40 470 -5 49 0 3 "L_p_SOD523" 1 "" 0>
  <GND *22 5 40 500 0 0 0 0>
</Components>
<Wires>
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "" 0 0 0 "">
  <2010 -220 2070 -220 "" 0 0 0 "">
  <1890 -220 1950 -220 "" 0 0 0 "">
  <1060 -220 1090 -220 "" 0 0 0 "">
  <1540 -220 1580 -220 "" 0 0 0 "">
  <1400 -220 1480 -220 "" 0 0 0 "">
  <1640 -220 1700 -220 "" 0 0 0 "">
  <1270 -220 1340 -220 "" 0 0 0 "">
  <1150 -220 1210 -220 "" 0 0 0 "">
  <1760 -220 1830 -220 "" 0 0 0 "">
  <300 -740 480 -740 "" 0 0 0 "">
  <480 -740 700 -740 "" 0 0 0 "">
  <1600 -720 1640 -720 "" 0 0 0 "">
  <1510 -640 1510 -620 "" 0 0 0 "">
  <1510 -720 1540 -720 "" 0 0 0 "">
  <1510 -720 1510 -700 "" 0 0 0 "">
  <1480 -720 1510 -720 "" 0 0 0 "">
  <1380 -720 1420 -720 "" 0 0 0 "">
  <1700 -720 1780 -720 "" 0 0 0 "">
  <2250 -720 2290 -720 "" 0 0 0 "">
  <2030 -720 2070 -720 "" 0 0 0 "">
  <2160 -640 2160 -620 "" 0 0 0 "">
  <2130 -720 2160 -720 "" 0 0 0 "">
  <2160 -720 2190 -720 "" 0 0 0 "">
  <2160 -720 2160 -700 "" 0 0 0 "">
  <1840 -720 1870 -720 "" 0 0 0 "">
  <1930 -720 1970 -720 "" 0 0 0 "">
  <2350 -720 2390 -720 "" 0 0 0 "">
  <2750 -720 2780 -720 "" 0 0 0 "">
  <2750 -720 2750 -700 "" 0 0 0 "">
  <2720 -720 2750 -720 "" 0 0 0 "">
  <2840 -720 2900 -720 "" 0 0 0 "">
  <2960 -720 2990 -720 "" 0 0 0 "">
  <2990 -720 3020 -720 "" 0 0 0 "">
  <2990 -720 2990 -700 "" 0 0 0 "">
  <2450 -720 2480 -720 "" 0 0 0 "">
  <2540 -720 2660 -720 "" 0 0 0 "">
  <2750 -640 2750 -620 "" 0 0 0 "">
  <2750 -560 2750 -540 "" 0 0 0 "">
  <2750 -480 2750 -450 "" 0 0 0 "">
  <120 170 270 170 "Vamp1" 130 200 13 "">
  <2900 170 3020 170 "Vamp2" 3000 140 70 "">
  <2680 170 2840 170 "Vfb" 2830 140 110 "">
  <330 170 2620 170 "" 0 0 0 "">
  <40 200 40 350 "" 0 0 0 "">
  <40 410 40 440 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1310 606 889 226 3 #c0c0c0 1 00 1 0 1e+09 1.5e+10 1 -0.452979 1 3 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
