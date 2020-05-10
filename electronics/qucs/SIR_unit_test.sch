<Qucs Schematic >
<Properties>
  <View=-380,-205,2807,2238,0.826483,264,71>
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
  <L L1 2 180 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <.AC AC1 1 -310 370 0 51 0 0 "lin" 1 "0.1 GHz" 1 "40 GHz" 1 "100" 1 "no" 0>
  <.SW SW1 0 -70 560 0 88 0 0 "SP1" 1 "lin" 1 "Spacing" 1 "0.2e-3" 1 "2e-3" 1 "20" 1>
  <MLIN MS4 1 120 20 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 150 -130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *14 5 180 -130 0 0 0 0>
  <.SW SW2 1 130 570 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.05 pF" 1 "5 pF" 1 "10" 1>
  <SPfile X2 1 40 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP3 1 -130 2030 0 79 0 0 "lin" 1 "800 MHz" 1 "80 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 100 2070 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn5 1 250 2130 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <C C5 1 300 170 -26 -57 0 2 "0.17 pF" 1 "" 0 "neutral" 0>
  <SUBST Subst1 1 1860 -90 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <SUBST Sub1 1 2220 -40 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <SPfile X1 1 1550 170 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *12 5 1550 200 0 0 0 0>
  <R R1 1 1700 200 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *13 5 1700 230 0 0 0 0>
  <L L2 2 1250 170 -26 -50 0 2 "0.2 nH" 1 "" 0>
  <C C6 1 1370 170 -26 -57 0 2 "0.17 pF" 1 "" 0 "neutral" 0>
  <MLIN MS8 1 910 170 -26 15 0 0 "Subst1" 1 "0.501" 1 "2.955 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 1040 170 -26 15 0 0 "Subst1" 1 "4.139 mm" 1 "0.450 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 420 170 -26 15 0 0 "Subst1" 1 "4.139 mm" 1 "0.450 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 550 170 -26 15 0 0 "Subst1" 1 "0.501" 1 "2.955 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L3 1 690 170 -26 -50 0 2 "0.7 nH" 1 "" 0>
  <C C7 1 790 170 -26 -57 0 2 "C1" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <210 170 270 170 "" 0 0 0 "">
  <120 50 120 170 "" 0 0 0 "">
  <120 -130 120 -10 "Vout" 150 -90 63 "">
  <70 170 120 170 "" 0 0 0 "">
  <-80 170 -80 180 "" 0 0 0 "">
  <-80 170 10 170 "" 0 0 0 "">
  <120 170 150 170 "" 0 0 0 "">
  <1580 170 1700 170 "" 0 0 0 "">
  <1400 170 1520 170 "Vfb" 1390 70 46 "">
  <1280 170 1340 170 "" 0 0 0 "">
  <1070 170 1220 170 "" 0 0 0 "">
  <940 170 1010 170 "" 0 0 0 "">
  <330 170 390 170 "" 0 0 0 "">
  <450 170 520 170 "" 0 0 0 "">
  <820 170 880 170 "" 0 0 0 "">
  <580 170 660 170 "" 0 0 0 "">
  <720 170 760 170 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 1180 617 1158 237 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"Vfb.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1250 1384 1096 224 3 #c0c0c0 1 00 1 -1 0.1 1 1 -1 0.5 1 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1170 872 1085 192 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 2520 640 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"Vout.v" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 1120 1330 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 1 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 740 450 12 #000000 0 "stepped-impedance lowpass filter \n Butterworth 8 GHz...2 GHz \n impedance matching 50 Ohm">
  <Text 220 2030 12 #000000 0 "stepped-impedance lowpass filter \n Chebyshev 8 GHz...2 GHz \n impedance matching 50 Ohm">
</Paintings>
