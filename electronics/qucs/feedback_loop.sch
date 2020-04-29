<Qucs Schematic >
<Properties>
  <View=-535,-225,3715,1381,0.909095,443,510>
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
  <MLIN MS2 1 660 380 -26 15 0 0 "Subst1" 1 "1.487 mm" 1 "L2" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 420 440 0 0 0 0>
  <GND *4 5 530 410 0 0 0 0>
  <Pac P1 1 420 410 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <SPfile X3 1 620 170 -1105 5 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 5 620 200 0 0 0 0>
  <GND *5 5 700 240 0 0 0 0>
  <Pac P5 1 700 200 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <Pac P4 1 1050 410 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1050 440 0 0 0 0>
  <Eqn Eqn8 1 1000 230 -31 17 0 0 "fb_gain_optim=max(Vfb.v/Vamp1.v,5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn3 1 1000 -10 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn9 1 1000 70 -31 17 0 0 "phase_shift_optim=max(abs(180-phase(Vfb.v)),5000e6:6000e6)" 1 "yes" 0>
  <.SP SP3 0 130 570 0 75 0 0 "lin" 1 "1 GHz" 1 "10 GHz" 1 "19" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SPfile X2 1 530 380 -1016 3 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn Eqn5 1 1000 150 -31 17 0 0 "fb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <Eqn OptValues1 1 1140 680 -28 15 0 0 "L1=1.345160E-02" 1 "L2=2.936499E-03" 1 "yes" 0>
  <.AC AC1 1 300 660 0 45 0 0 "lin" 1 "6 GHz" 1 "7 GHz" 1 "40" 1 "no" 0>
  <Pac P6 0 1790 1080 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *6 4 1790 1110 0 0 0 0>
  <C C4 0 1900 1000 -27 10 0 0 "1.57 pF" 1 "" 0 "neutral" 0>
  <L L1 0 1970 1080 17 -26 0 1 "1.37 nH" 1 "" 0>
  <GND *7 4 1970 1110 0 0 0 0>
  <C C5 0 2040 1000 -27 10 0 0 "241 fF" 1 "" 0 "neutral" 0>
  <Pac P7 0 2110 1080 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 4 2110 1110 0 0 0 0>
  <.SP SP1 0 1800 1180 0 75 0 0 "log" 1 "600 MHz" 1 "60 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn6 0 2020 1190 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P8 0 2480 1090 18 -26 0 1 "7" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *9 4 2480 1120 0 0 0 0>
  <L L2 0 2590 1010 -26 10 0 0 "537 pH" 1 "" 0>
  <C C6 0 2660 1090 17 -26 0 1 "618 fF" 1 "" 0 "neutral" 0>
  <GND *10 4 2660 1120 0 0 0 0>
  <L L3 0 2730 1010 -26 10 0 0 "3.51 nH" 1 "" 0>
  <Pac P9 0 2800 1090 18 -26 0 1 "8" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *11 4 2800 1120 0 0 0 0>
  <.SP SP2 0 2490 1190 0 75 0 0 "log" 1 "500 MHz" 1 "50 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn7 0 2710 1200 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <C C2 0 2570 520 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS3 0 2680 520 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 4 2620 680 0 0 0 0>
  <GND * 4 2510 710 0 0 0 0>
  <Pac P3 0 2510 680 18 -26 0 1 "3" 1 "500 Ohm" 1 "0 dBm" 0 "3 GHz" 0 "26.85" 0>
  <Eqn Eqn4 0 2580 410 -31 17 0 0 "y=abs(fft(V1.Vt))" 1 "yes" 0>
  <.TR TR1 0 2500 800 0 75 0 0 "lin" 1 "0" 1 "1 us" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <SPfile X1 0 2620 650 249 -83 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <SUBST Subst1 1 600 640 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <MLIN MS4 1 900 380 -26 15 0 0 "Subst1" 1 "1.487 mm" 1 "L1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 850 1040 15 -26 0 1 "Subst1" 1 "1.487 mm" 1 "L1" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.Opt Opt1 0 1080 1030 0 45 0 0 "Sim=AC1" 0 "DE=3|50|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|3.7e-12|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|0.0135|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|0.00294|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=fb_gain|MAX|1" 0 "Goal=phase_shift|GE|300" 0>
</Components>
<Wires>
  <570 380 630 380 "Vamp1" 640 350 30 "">
  <570 170 570 380 "" 0 0 0 "">
  <570 170 590 170 "" 0 0 0 "">
  <650 170 700 170 "" 0 0 0 "">
  <700 170 730 170 "Vamp2" 750 140 14 "">
  <700 230 700 240 "" 0 0 0 "">
  <560 380 570 380 "" 0 0 0 "">
  <420 380 500 380 "Vsource" 360 330 23 "">
  <1790 1000 1790 1050 "" 0 0 0 "">
  <1790 1000 1870 1000 "" 0 0 0 "">
  <1970 1000 1970 1050 "" 0 0 0 "">
  <2110 1000 2110 1050 "" 0 0 0 "">
  <1970 1000 2010 1000 "" 0 0 0 "">
  <1930 1000 1970 1000 "" 0 0 0 "">
  <2070 1000 2110 1000 "" 0 0 0 "">
  <2480 1010 2480 1060 "" 0 0 0 "">
  <2480 1010 2560 1010 "" 0 0 0 "">
  <2660 1010 2660 1060 "" 0 0 0 "">
  <2800 1010 2800 1060 "" 0 0 0 "">
  <2660 1010 2700 1010 "" 0 0 0 "">
  <2620 1010 2660 1010 "" 0 0 0 "">
  <2760 1010 2800 1010 "" 0 0 0 "">
  <2600 520 2650 520 "" 0 0 0 "">
  <2710 520 2760 520 "V1" 2750 490 1 "">
  <2480 520 2540 520 "" 0 0 0 "">
  <2480 520 2480 650 "" 0 0 0 "">
  <2480 650 2510 650 "" 0 0 0 "">
  <2760 520 2760 650 "" 0 0 0 "">
  <2650 650 2760 650 "" 0 0 0 "">
  <2510 650 2590 650 "" 0 0 0 "">
  <930 380 1050 380 "Vfb" 1040 340 81 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 2130 1180 12 #000000 0 "Bessel high-pass filter \n 6 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 2870 840 12 #000000 0 "Bessel low-pass filter \n 5 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
</Paintings>
