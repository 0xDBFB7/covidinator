<Qucs Schematic >
<Properties>
  <View=-535,-205,2835,1559,0.826449,421,0>
  <Grid=10,10,1>
  <DataSet=feedback_loop.dat>
  <DataDisplay=feedback_loop.dpl>
  <OpenDisplay=1>
  <Script=feedback_loop.m>
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
  <C C2 0 1710 410 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS3 0 1820 410 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 4 1760 570 0 0 0 0>
  <GND * 4 1650 600 0 0 0 0>
  <Pac P3 0 1650 570 18 -26 0 1 "3" 1 "500 Ohm" 1 "0 dBm" 0 "3 GHz" 0 "26.85" 0>
  <Eqn Eqn4 0 1720 300 -31 17 0 0 "y=abs(fft(V1.Vt))" 1 "yes" 0>
  <.TR TR1 0 1640 690 0 73 0 0 "lin" 1 "0" 1 "1 us" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <MLIN MS2 1 660 380 -26 15 0 0 "Subst1" 1 "1.487 mm" 1 "L2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SPfile X1 0 1760 540 249 -83 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *2 5 420 440 0 0 0 0>
  <GND *4 5 530 410 0 0 0 0>
  <Pac P1 1 420 410 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <SPfile X2 1 530 380 -1016 3 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <SPfile X3 1 620 170 -1105 5 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 5 620 200 0 0 0 0>
  <GND *5 5 700 240 0 0 0 0>
  <Pac P5 1 700 200 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <Pac P6 0 590 1260 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *6 4 590 1290 0 0 0 0>
  <C C4 0 700 1180 -27 10 0 0 "1.57 pF" 1 "" 0 "neutral" 0>
  <L L1 0 770 1260 17 -26 0 1 "1.37 nH" 1 "" 0>
  <GND *7 4 770 1290 0 0 0 0>
  <C C5 0 840 1180 -27 10 0 0 "241 fF" 1 "" 0 "neutral" 0>
  <Pac P7 0 910 1260 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 4 910 1290 0 0 0 0>
  <.SP SP1 0 600 1360 0 73 0 0 "log" 1 "600 MHz" 1 "60 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn6 0 820 1370 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P8 0 1280 1270 18 -26 0 1 "7" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *9 4 1280 1300 0 0 0 0>
  <L L2 0 1390 1190 -26 10 0 0 "537 pH" 1 "" 0>
  <C C6 0 1460 1270 17 -26 0 1 "618 fF" 1 "" 0 "neutral" 0>
  <GND *10 4 1460 1300 0 0 0 0>
  <L L3 0 1530 1190 -26 10 0 0 "3.51 nH" 1 "" 0>
  <Pac P9 0 1600 1270 18 -26 0 1 "8" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *11 4 1600 1300 0 0 0 0>
  <.SP SP2 0 1290 1370 0 73 0 0 "log" 1 "500 MHz" 1 "50 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn7 0 1510 1380 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P4 1 1050 410 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1050 440 0 0 0 0>
  <MLIN MS4 1 900 380 -26 15 0 0 "Subst1" 1 "1.487 mm" 1 "L1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *12 5 780 440 0 0 0 0>
  <SUBST Subst1 1 630 650 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <.AC AC1 1 300 660 0 44 0 0 "lin" 1 "2.5 GHz" 1 "15 GHz" 1 "40" 1 "no" 0>
  <Eqn Eqn8 1 1000 230 -31 17 0 0 "fb_gain_optim=max(Vfb.v/Vamp1.v,5000e6:6000e6)" 1 "yes" 0>
  <C C7 1 780 410 17 -26 0 1 "C1" 1 "" 0 "neutral" 0>
  <Eqn Eqn3 1 1000 -10 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn9 1 1000 70 -31 17 0 0 "phase_shift_optim=max(abs(180-phase(Vfb.v)),5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn5 1 1000 150 -31 17 0 0 "fb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <.Opt Opt1 1 800 640 0 44 0 0 "Sim=AC1" 0 "DE=3|100|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|1|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|1|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|1|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=phase_shift_optim|GE|300" 0 "Goal=fb_gain_optim|MAX|1" 0>
</Components>
<Wires>
  <1740 410 1790 410 "" 0 0 0 "">
  <1850 410 1900 410 "V1" 1890 380 1 "">
  <1620 410 1680 410 "" 0 0 0 "">
  <1620 410 1620 540 "" 0 0 0 "">
  <1620 540 1650 540 "" 0 0 0 "">
  <1900 410 1900 540 "" 0 0 0 "">
  <1790 540 1900 540 "" 0 0 0 "">
  <1650 540 1730 540 "" 0 0 0 "">
  <560 380 570 380 "" 0 0 0 "">
  <420 380 500 380 "Vsource" 360 330 23 "">
  <570 380 630 380 "Vamp1" 640 350 30 "">
  <570 170 570 380 "" 0 0 0 "">
  <570 170 590 170 "" 0 0 0 "">
  <650 170 700 170 "" 0 0 0 "">
  <700 170 730 170 "Vamp2" 750 140 14 "">
  <700 230 700 240 "" 0 0 0 "">
  <590 1180 590 1230 "" 0 0 0 "">
  <590 1180 670 1180 "" 0 0 0 "">
  <770 1180 770 1230 "" 0 0 0 "">
  <910 1180 910 1230 "" 0 0 0 "">
  <770 1180 810 1180 "" 0 0 0 "">
  <730 1180 770 1180 "" 0 0 0 "">
  <870 1180 910 1180 "" 0 0 0 "">
  <1280 1190 1280 1240 "" 0 0 0 "">
  <1280 1190 1360 1190 "" 0 0 0 "">
  <1460 1190 1460 1240 "" 0 0 0 "">
  <1600 1190 1600 1240 "" 0 0 0 "">
  <1460 1190 1500 1190 "" 0 0 0 "">
  <1420 1190 1460 1190 "" 0 0 0 "">
  <1560 1190 1600 1190 "" 0 0 0 "">
  <690 380 780 380 "" 0 0 0 "">
  <930 380 1050 380 "Vfb" 1050 350 81 "">
  <780 380 870 380 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 930 1360 12 #000000 0 "Bessel high-pass filter \n 6 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 1620 1370 12 #000000 0 "Bessel low-pass filter \n 5 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
</Paintings>
