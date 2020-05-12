<Qucs Schematic >
<Properties>
  <View=-360,-550,3652,2249,0.826531,740,330>
  <Grid=10,10,1>
  <DataSet=inductor_test.dat>
  <DataDisplay=inductor_test.dpl>
  <OpenDisplay=1>
  <Script=inductor_test.m>
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
  <.SP SP1 0 -330 550 0 88 0 0 "lin" 1 "0.5 GHz" 1 "15 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 -20 850 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn2 0 -20 990 -31 17 0 0 "phase_shift=phase(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 0 -260 910 -31 17 0 0 "C1=2e-12" 1 "yes" 0>
  <.AC AC1 1 -310 370 0 51 0 0 "lin" 1 "0.1 GHz" 1 "25 GHz" 1 "100" 1 "no" 0>
  <.SW SW1 0 -70 560 0 88 0 0 "SP1" 1 "lin" 1 "Spacing" 1 "0.2e-3" 1 "2e-3" 1 "20" 1>
  <MLIN MS4 0 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 0 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 4 180 -130 0 0 0 0>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP3 1 -130 2030 0 79 0 0 "lin" 1 "800 MHz" 1 "80 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 100 2070 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn5 1 250 2130 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <SUBST Subst1 1 1860 -90 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <SUBST Sub1 1 2220 -40 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <.SW SW2 1 130 570 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "2.22 pF" 1 "10" 1>
  <Eqn Eqn6 1 300 960 -31 17 0 0 "vfb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <GND *2 5 50 200 0 0 0 0>
  <L L1 1 1060 170 -26 10 0 0 "0.5 nH" 1 "" 0>
  <C C4 1 820 170 -26 -57 0 2 "10 pF" 1 "" 0 "neutral" 0>
  <L L3 1 740 170 -26 10 0 0 "0.2 nH" 1 "" 0>
  <C C2 1 1140 210 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C1 1 960 210 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <L L4 1 960 290 10 -26 0 1 "0.2 nH" 1 "" 0>
  <L L6 1 1210 -510 -26 10 0 0 "0.5 nH" 1 "" 0>
  <C C7 1 1290 -470 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <L L7 1 1290 -400 10 -26 0 1 "0.7 nH" 1 "" 0>
  <C C8 1 1110 -470 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <L L8 1 1110 -390 10 -26 0 1 "0.7 nH" 1 "" 0>
  <C C9 1 1290 -300 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <GND *17 5 1110 -260 0 0 0 0>
  <C C10 1 1110 -310 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <GND *18 5 1290 -260 0 0 0 0>
  <L L9 1 1260 0 10 -26 0 1 "0.2 nH" 1 "" 0>
  <L L10 1 1440 0 10 -26 0 1 "0.2 nH" 1 "" 0>
  <C C11 1 1260 -90 17 -26 0 1 "1 pF" 1 "" 0 "neutral" 0>
  <C C12 1 1440 -90 17 -26 0 1 "1 pF" 1 "" 0 "neutral" 0>
  <L L5 1 1140 290 10 -26 0 1 "0.2 nH" 1 "" 0>
  <GND *19 5 1140 340 0 0 0 0>
  <GND *20 5 960 340 0 0 0 0>
  <L L11 1 1400 170 -26 10 0 0 "0.5 nH" 1 "" 0>
  <C C13 1 1480 210 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <C C14 1 1300 210 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <L L12 1 1300 290 10 -26 0 1 "0.2 nH" 1 "" 0>
  <L L13 1 1480 290 10 -26 0 1 "0.2 nH" 1 "" 0>
  <GND *21 5 1480 340 0 0 0 0>
  <GND *22 5 1300 340 0 0 0 0>
  <SPfile X1 1 1990 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *12 5 1990 200 0 0 0 0>
  <R R1 1 2140 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *13 5 2140 230 0 0 0 0>
  <C C3 1 1680 170 -26 -57 0 2 "10 pF" 1 "" 0 "neutral" 0>
  <L L2 1 1600 170 -26 10 0 0 "0.2 nH" 1 "" 0>
</Components>
<Wires>
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "" 0 0 0 "">
  <40 200 50 200 "" 0 0 0 "">
  <120 170 710 170 "Vamp1" 130 90 13 "">
  <1090 170 1140 170 "" 0 0 0 "">
  <850 170 960 170 "" 0 0 0 "">
  <770 170 790 170 "" 0 0 0 "">
  <1140 170 1140 180 "" 0 0 0 "">
  <960 170 1030 170 "" 0 0 0 "">
  <960 170 960 180 "" 0 0 0 "">
  <960 240 960 260 "" 0 0 0 "">
  <960 320 960 340 "" 0 0 0 "">
  <1240 -510 1290 -510 "" 0 0 0 "">
  <1290 -510 1290 -500 "" 0 0 0 "">
  <1290 -440 1290 -430 "" 0 0 0 "">
  <1110 -510 1180 -510 "" 0 0 0 "">
  <1110 -510 1110 -500 "" 0 0 0 "">
  <1110 -440 1110 -420 "" 0 0 0 "">
  <1290 -370 1290 -330 "" 0 0 0 "">
  <1110 -360 1110 -340 "" 0 0 0 "">
  <1110 -280 1110 -260 "" 0 0 0 "">
  <1290 -270 1290 -260 "" 0 0 0 "">
  <1260 -60 1260 -30 "" 0 0 0 "">
  <1440 -60 1440 -30 "" 0 0 0 "">
  <1140 240 1140 260 "" 0 0 0 "">
  <1140 320 1140 340 "" 0 0 0 "">
  <1430 170 1480 170 "" 0 0 0 "">
  <1480 170 1480 180 "" 0 0 0 "">
  <1140 170 1300 170 "" 0 0 0 "">
  <1300 170 1370 170 "" 0 0 0 "">
  <1300 170 1300 180 "" 0 0 0 "">
  <1300 240 1300 260 "" 0 0 0 "">
  <1300 320 1300 340 "" 0 0 0 "">
  <1480 240 1480 260 "" 0 0 0 "">
  <1480 320 1480 340 "" 0 0 0 "">
  <1480 170 1570 170 "" 0 0 0 "">
  <2020 170 2140 170 "Vamp2" 1970 140 46 "">
  <1630 170 1650 170 "" 0 0 0 "">
  <1710 170 1960 170 "Vfb" 1760 140 152 "">
</Wires>
<Diagrams>
  <Rect 2520 640 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"Vout.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1360 617 1158 237 3 #c0c0c0 1 00 1 0 2e+09 4e+10 1 -0.00843643 0.02 0.0928036 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"Vfb.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1360 902 1085 192 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1440 1354 1096 224 3 #c0c0c0 1 00 1 -1 0.1 1 1 -1 0.5 1 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 2550 323 805 423 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"Vamp2.v" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1120 1330 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 220 2030 12 #000000 0 "stepped-impedance lowpass filter \n Chebyshev 8 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 620 500 12 #000000 0 "stepped-impedance lowpass filter \n Butterworth 8 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 1430 -530 12 #000000 0 "ooh, interesting\n\nThis sweeps 8-12 GHz pretty reasonably;\nwithout the 0.5 pF caps and with a 2 nF inductor, 5.9-9.">
</Paintings>
