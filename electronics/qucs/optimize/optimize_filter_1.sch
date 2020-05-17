<Qucs Schematic >
<Properties>
  <View=-320,-864,2807,2249,0.564522,106,0>
  <Grid=10,10,1>
  <DataSet=optimize_filter_1.dat>
  <DataDisplay=optimize_filter_1.dpl>
  <OpenDisplay=1>
  <Script=optimize_filter_1.m>
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
  <MLIN MS4 1 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 5 180 -130 0 0 0 0>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP3 1 -130 2030 0 79 0 0 "lin" 1 "800 MHz" 1 "80 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 100 2070 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn5 1 250 2130 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn7 1 800 580 -31 17 0 0 "phase_shift=-unwrap(angle(Vfb.v))/(2*pi)" 1 "yes" 0>
  <Eqn Eqn6 1 550 580 -31 17 0 0 "vfb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <SUBST Subst1 1 740 -130 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <.AC AC1 1 240 490 0 51 0 0 "lin" 1 "0.1 GHz" 1 "25 GHz" 1 "100" 1 "no" 0>
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
  <Eqn Eqn8 1 550 450 -31 17 0 0 "L_parasitic=0.2e-9" 1 "yes" 0>
  <MLIN MS16 1 270 -740 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_0 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS17 1 730 -740 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS18 1 480 -710 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "var_1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L4 1 560 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <GND *16 5 500 270 0 0 0 0>
  <L L5 1 500 220 -75 -26 0 3 "var_2 nH" 1 "" 0>
  <L L6 1 340 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C4 1 440 170 -26 -57 0 2 "var_0 pF" 1 "" 0 "neutral" 0>
  <C C5 1 660 170 -26 -57 0 2 "var_0 pF" 1 "" 0 "neutral" 0>
  <L L10 1 1210 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <GND *18 5 1150 270 0 0 0 0>
  <L L11 1 1150 220 -75 -26 0 3 "var_6 nH" 1 "" 0>
  <L L12 1 990 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C7 1 1090 170 -26 -57 0 2 "var_5 pF" 1 "" 0 "neutral" 0>
  <C C8 1 1310 170 -26 -57 0 2 "var_5 pF" 1 "" 0 "neutral" 0>
  <L L16 1 800 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C10 1 890 170 -26 -57 0 2 "C_varactor" 1 "" 0 "neutral" 0>
  <GND *15 5 2360 200 0 0 0 0>
  <GND *13 5 2510 230 0 0 0 0>
  <R R1 1 2510 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SPfile X1 1 2360 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <MLIN MS11 1 2190 170 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "var_4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L7 1 1800 170 -26 -50 0 2 "var_1 nH" 1 "" 0>
  <L L8 1 1680 170 -26 -50 0 2 "var_1 nH" 1 "" 0>
  <C C6 1 1740 220 -58 -26 0 3 "var_3 pF" 1 "" 0 "neutral" 0>
  <L L13 1 2040 170 -26 -50 0 2 "var_7 nH" 1 "" 0>
  <L L14 1 1920 170 -26 -50 0 2 "var_7 nH" 1 "" 0>
  <L L15 1 1980 280 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *19 5 1980 310 0 0 0 0>
  <C C9 1 1980 220 -58 -26 0 3 "var_8 pF" 1 "" 0 "neutral" 0>
  <L L17 1 1410 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C11 1 1500 170 -26 -57 0 2 "C_varactor" 1 "" 0 "neutral" 0>
  <L L18 1 1740 300 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <L L9 1 1740 470 -106 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *17 5 1740 500 0 0 0 0>
  <C C12 1 1740 380 -116 -26 0 3 "C_varactor" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "" 0 0 0 "">
  <120 170 310 170 "Vamp1" 130 200 13 "">
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
  <590 170 630 170 "" 0 0 0 "">
  <500 250 500 270 "" 0 0 0 "">
  <500 170 530 170 "" 0 0 0 "">
  <500 170 500 190 "" 0 0 0 "">
  <470 170 500 170 "" 0 0 0 "">
  <370 170 410 170 "" 0 0 0 "">
  <690 170 770 170 "" 0 0 0 "">
  <1240 170 1280 170 "" 0 0 0 "">
  <1020 170 1060 170 "" 0 0 0 "">
  <1150 250 1150 270 "" 0 0 0 "">
  <1120 170 1150 170 "" 0 0 0 "">
  <1150 170 1180 170 "" 0 0 0 "">
  <1150 170 1150 190 "" 0 0 0 "">
  <830 170 860 170 "" 0 0 0 "">
  <920 170 960 170 "" 0 0 0 "">
  <1340 170 1380 170 "" 0 0 0 "">
  <2390 170 2510 170 "Vamp2" 2490 140 80 "">
  <2220 170 2330 170 "Vfb" 2320 140 70 "">
  <1740 170 1770 170 "" 0 0 0 "">
  <1740 170 1740 190 "" 0 0 0 "">
  <1710 170 1740 170 "" 0 0 0 "">
  <1830 170 1890 170 "" 0 0 0 "">
  <2070 170 2160 170 "" 0 0 0 "">
  <1950 170 1980 170 "" 0 0 0 "">
  <1980 170 2010 170 "" 0 0 0 "">
  <1980 170 1980 190 "" 0 0 0 "">
  <1440 170 1470 170 "" 0 0 0 "">
  <1530 170 1650 170 "" 0 0 0 "">
  <1740 250 1740 270 "" 0 0 0 "">
  <1740 330 1740 350 "" 0 0 0 "">
  <1740 410 1740 440 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 220 2030 12 #000000 0 "stepped-impedance lowpass filter \n Chebyshev 8 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
