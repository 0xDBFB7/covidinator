<Qucs Schematic >
<Properties>
  <View=-380,-707,2807,2249,1.10015,1010,573>
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
  <Eqn Eqn1 1 -20 850 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn2 0 -20 990 -31 17 0 0 "phase_shift=phase(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 0 -260 910 -31 17 0 0 "C1=0.3e-12" 1 "yes" 0>
  <.AC AC1 1 -310 370 0 51 0 0 "lin" 1 "0.1 GHz" 1 "20GHz" 1 "400" 1 "no" 0>
  <.SW SW1 0 -70 560 0 88 0 0 "SP1" 1 "lin" 1 "Spacing" 1 "0.2e-3" 1 "2e-3" 1 "20" 1>
  <MLIN MS4 1 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 5 180 -130 0 0 0 0>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP3 1 -130 2030 0 79 0 0 "lin" 1 "800 MHz" 1 "80 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 100 2070 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn5 1 250 2130 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <SUBST Subst1 1 1860 -90 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <SUBST Sub1 1 2220 -40 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <L L1 1 210 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <.SW SW2 0 130 570 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "5 pF" 1 "10" 1>
  <Eqn Eqn6 1 300 960 -31 17 0 0 "vfb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <C C7 1 840 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L3 1 740 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <MLIN MS5 1 470 170 -26 15 0 0 "Subst1" 1 "2 mm" 1 "0.72 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 600 170 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "4.71 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SW SW3 1 320 580 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "1 pF" 1 "10" 1>
  <C C8 1 1050 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L4 1 950 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <SPfile X1 1 2010 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *12 5 2010 200 0 0 0 0>
  <R R1 1 2160 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *13 5 2160 230 0 0 0 0>
  <C C11 1 900 200 -58 -26 0 3 "C1" 1 "" 0 "neutral" 0>
  <L L7 1 900 300 -75 -26 0 3 "L_parasitic" 1 "" 0>
  <GND * 5 900 330 0 0 0 0>
  <L L8 1 230 -630 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C12 1 860 -630 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L9 1 760 -630 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <MLIN MS10 1 490 -630 -26 15 0 0 "Subst1" 1 "2 mm" 1 "0.450 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS11 1 620 -630 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "2.955 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS12 1 1180 -630 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "2.955 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS13 1 1310 -630 -26 15 0 0 "Subst1" 1 "2 mm" 1 "0.450 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C13 1 1070 -630 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L10 1 970 -630 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C14 1 320 -630 -26 -57 0 2 "1.2 pF" 1 "" 0 "neutral" 0>
  <L L11 1 1520 -630 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C15 1 1640 -630 -26 -57 0 2 "1.2 pF" 1 "" 0 "neutral" 0>
  <C C16 1 920 -600 -58 -26 0 3 "C1" 1 "" 0 "neutral" 0>
  <L L12 1 920 -500 -75 -26 0 3 "0.2 nH" 1 "" 0>
  <GND *15 5 920 -470 0 0 0 0>
  <C C5 1 300 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L6 1 1810 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C10 1 1930 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <MLIN MS8 1 1610 170 -26 15 0 0 "Subst1" 1 "0.501 mm" 1 "4.71 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 1740 170 -26 15 0 0 "Subst1" 1 "2 mm" 1 "0.72 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C17 1 1280 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L13 1 1180 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C18 1 1490 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
  <L L14 1 1390 170 -26 -50 0 2 "L_parasitic" 1 "" 0>
  <C C19 1 1340 200 -58 -26 0 3 "C1" 1 "" 0 "neutral" 0>
  <L L15 1 1340 300 -75 -26 0 3 "L_parasitic" 1 "" 0>
  <GND *16 5 1340 330 0 0 0 0>
  <Eqn Eqn7 1 460 920 -31 17 0 0 "L_parasitic=0.7e-9" 1 "yes" 0>
</Components>
<Wires>
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "" 0 0 0 "">
  <120 170 180 170 "Vamp1" 150 90 13 "">
  <240 170 270 170 "" 0 0 0 "">
  <770 170 810 170 "" 0 0 0 "">
  <630 170 710 170 "" 0 0 0 "">
  <330 170 440 170 "" 0 0 0 "">
  <500 170 570 170 "" 0 0 0 "">
  <870 170 900 170 "" 0 0 0 "">
  <980 170 1020 170 "" 0 0 0 "">
  <2040 170 2160 170 "" 0 0 0 "">
  <900 170 920 170 "" 0 0 0 "">
  <900 230 900 270 "" 0 0 0 "">
  <260 -630 290 -630 "" 0 0 0 "">
  <790 -630 830 -630 "" 0 0 0 "">
  <650 -630 730 -630 "" 0 0 0 "">
  <350 -630 460 -630 "" 0 0 0 "">
  <520 -630 590 -630 "" 0 0 0 "">
  <890 -630 920 -630 "" 0 0 0 "">
  <1210 -630 1280 -630 "" 0 0 0 "">
  <1100 -630 1150 -630 "" 0 0 0 "">
  <1000 -630 1040 -630 "" 0 0 0 "">
  <1340 -630 1490 -630 "" 0 0 0 "">
  <1550 -630 1610 -630 "" 0 0 0 "">
  <920 -630 940 -630 "" 0 0 0 "">
  <920 -570 920 -530 "" 0 0 0 "">
  <1960 170 1980 170 "Vfb" 1970 140 0 "">
  <1840 170 1900 170 "" 0 0 0 "">
  <1770 170 1780 170 "" 0 0 0 "">
  <1080 170 1150 170 "" 0 0 0 "">
  <1640 170 1710 170 "" 0 0 0 "">
  <1310 170 1340 170 "" 0 0 0 "">
  <1210 170 1250 170 "" 0 0 0 "">
  <1520 170 1580 170 "" 0 0 0 "">
  <1420 170 1460 170 "" 0 0 0 "">
  <1340 170 1360 170 "" 0 0 0 "">
  <1340 230 1340 270 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1180 617 1158 237 3 #c0c0c0 1 00 1 0 2e+09 4e+10 1 -0.00843643 0.02 0.0928036 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"Vfb.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1250 1384 1096 224 3 #c0c0c0 1 00 1 -1 0.1 1 1 -1 0.5 1 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1180 872 1159 206 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1180 1081 1160 176 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"Vout.v" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1120 1330 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 740 450 12 #000000 0 "stepped-impedance lowpass filter \n Butterworth 8 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 220 2030 12 #000000 0 "stepped-impedance lowpass filter \n Chebyshev 8 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
