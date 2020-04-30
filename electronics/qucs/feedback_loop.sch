<Qucs Schematic >
<Properties>
  <View=-1607,-1130,5010,3110,0.846722,1409,719>
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
  <Eqn OptValues1 1 1140 680 -28 15 0 0 "L1=1.345160E-02" 1 "L2=2.936499E-03" 1 "yes" 0>
  <Pac P6 0 1790 1080 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *6 4 1790 1110 0 0 0 0>
  <C C4 0 1900 1000 -27 10 0 0 "1.57 pF" 1 "" 0 "neutral" 0>
  <L L1 0 1970 1080 17 -26 0 1 "1.37 nH" 1 "" 0>
  <GND *7 4 1970 1110 0 0 0 0>
  <C C5 0 2040 1000 -27 10 0 0 "241 fF" 1 "" 0 "neutral" 0>
  <Pac P7 0 2110 1080 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 4 2110 1110 0 0 0 0>
  <Pac P8 0 2480 1090 18 -26 0 1 "7" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *9 4 2480 1120 0 0 0 0>
  <L L2 0 2590 1010 -26 10 0 0 "537 pH" 1 "" 0>
  <C C6 0 2660 1090 17 -26 0 1 "618 fF" 1 "" 0 "neutral" 0>
  <GND *10 4 2660 1120 0 0 0 0>
  <L L3 0 2730 1010 -26 10 0 0 "3.51 nH" 1 "" 0>
  <Pac P9 0 2800 1090 18 -26 0 1 "8" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *11 4 2800 1120 0 0 0 0>
  <.SP SP2 0 2490 1190 0 85 0 0 "log" 1 "500 MHz" 1 "50 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn7 0 2710 1200 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <C C2 0 2570 520 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS3 0 2680 520 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 4 2620 680 0 0 0 0>
  <GND * 4 2510 710 0 0 0 0>
  <Pac P3 0 2510 680 18 -26 0 1 "3" 1 "500 Ohm" 1 "0 dBm" 0 "3 GHz" 0 "26.85" 0>
  <Eqn Eqn4 0 2580 410 -31 17 0 0 "y=abs(fft(V1.Vt))" 1 "yes" 0>
  <.TR TR1 0 2500 800 0 85 0 0 "lin" 1 "0" 1 "1 us" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <SPfile X1 0 2620 650 249 -83 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 5 1080 410 0 0 0 0>
  <MLIN MS4 1 870 380 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P10 1 -10 1420 18 -26 0 1 "9" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *13 5 -10 1450 0 0 0 0>
  <Pac P11 1 490 1420 18 -26 0 1 "10" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *14 5 490 1450 0 0 0 0>
  <MLIN MS7 1 130 1390 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 390 1390 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SPfile X4 1 1080 380 -12 -40 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <SPfile X5 1 240 1390 -7 -45 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *15 5 240 1420 0 0 0 0>
  <Pac P13 1 1120 1400 18 -26 0 1 "12" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *18 5 1120 1430 0 0 0 0>
  <MLIN MS9 1 1260 1370 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P14 1 1400 1400 18 -26 0 1 "13" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *19 5 1400 1430 0 0 0 0>
  <.SP SP4 0 1110 1520 0 85 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn6 0 370 1590 -28 15 0 0 "S21_dB=dB(S[11,9])" 1 "yes" 0>
  <Eqn Eqn10 0 1370 1570 -28 15 0 0 "microstrip_S21_dB=dB(S[13,12])" 1 "yes" 0>
  <.Opt Opt1 0 690 660 0 50 0 0 "Sim=AC1" 0 "DE=3|50|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|3.7e-12|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|0.0135|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|0.00294|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=fb_gain|MAX|1" 0 "Goal=phase_shift|GE|300" 0>
  <GND * 5 1180 440 0 0 0 0>
  <MLIN MS2 1 660 380 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C8 1 770 380 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <R R4 1 1180 410 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Eqn Eqn9 1 780 -290 -31 17 0 0 "phase_shift_optim=max(abs(180-phase(Vfb.v)),5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn8 1 780 -190 -31 17 0 0 "fb_gain_optim=max(Vfb.v/Vamp1.v,5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn3 1 780 -10 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn5 1 780 -90 -31 17 0 0 "fb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <Eqn Eqn11 1 1030 -70 -31 17 0 0 "output_gain=dB(Vout.v/Vsource.v)" 1 "yes" 0>
  <Eqn MicrostripParameters 1 -380 -270 -31 17 0 0 "Zwidth=1.487e-3" 1 "yes" 0>
  <MLIN MS16 1 310 1280 -115 -26 1 1 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SP5 0 2730 140 0 85 0 0 "lin" 1 "2.75GHz" 1 "20GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn12 0 2580 140 -28 15 0 0 "S11_dB=dB(S[1,1])" 1 "S21_dB=dB(S[2,1])" 1 "S31_dB=dB(S[3,1])" 1 "S22_dB=dB(S[2,2])" 1 "S33_dB=dB(S[3,3])" 1 "yes" 0>
  <MLIN MS17 1 2650 -90 -26 20 0 0 "Sub1" 0 "1.49 mm" 1 "7.44 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS18 1 2800 -150 -26 20 0 0 "Sub1" 0 "316 um" 1 "7.92 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P17 1 3060 0 18 -26 0 1 "16" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *23 5 3060 40 0 0 0 0>
  <Pac P16 1 3070 -120 18 -26 0 1 "17" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *22 5 3070 -90 0 0 0 0>
  <SUBST Sub1 1 2950 160 -30 24 0 0 "4.4" 1 "0.79mm" 1 "32um" 1 "0.0125" 1 "2.43902e-08" 1 "1.5e-07" 1>
  <Pac P15 1 2520 -60 18 -26 0 1 "15" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *21 5 2520 -30 0 0 0 0>
  <MLIN MS20 1 2940 -150 -26 20 0 0 "Sub1" 0 "0.790 um" 1 "5.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.Opt Opt2 0 2070 -120 0 50 0 0 "Sim=AC1" 0 "DE=3|50|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|3.7e-12|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|0.0135|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|0.00294|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=fb_gain|MAX|1" 0 "Goal=phase_shift|GE|300" 0>
  <.AC AC1 1 340 640 0 50 0 0 "lin" 1 "2.5 GHz" 1 "10 GHz" 1 "40" 1 "no" 0>
  <.SP SP6 0 140 640 0 85 0 0 "lin" 1 "1 GHz" 1 "15 GHz" 1 "30" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <GND *2 5 180 440 0 0 0 0>
  <GND *4 5 290 410 0 0 0 0>
  <Pac P1 1 180 410 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <SPfile X2 1 290 380 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <MLIN MS19 1 2800 -30 -26 20 0 0 "Sub1" 0 "316 um" 1 "7.92 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS21 1 2940 -30 -26 20 0 0 "Sub1" 0 "0.790 um" 1 "5.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST Subst1 1 -310 30 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <MLIN MS10 1 410 160 15 -26 0 1 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *20 5 480 -10 0 0 0 1>
  <Pac P18 0 450 -10 -26 -78 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <R R5 1 440 70 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *24 5 482 82 0 0 0 2>
  <GND *16 5 400 1260 0 0 0 0>
  <Pac P12 1 490 1260 18 -26 0 1 "11" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *17 5 490 1290 0 0 0 0>
  <SPfile X6 1 400 1230 -8 -47 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP1 0 80 1550 0 85 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <MLIN MS22 1 840 520 -115 -26 1 1 "Subst1" 1 "1 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS23 1 900 520 15 -26 0 1 "Subst1" 1 "1 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C7 1 870 570 -26 17 0 0 "4pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
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
  <900 380 1050 380 "Vfb" 960 340 111 "">
  <-10 1390 100 1390 "" 0 0 0 "">
  <420 1390 490 1390 "" 0 0 0 "">
  <270 1390 310 1390 "" 0 0 0 "">
  <160 1390 210 1390 "" 0 0 0 "">
  <1120 1370 1230 1370 "" 0 0 0 "">
  <1290 1370 1400 1370 "" 0 0 0 "">
  <1110 380 1180 380 "" 0 0 0 "">
  <800 380 840 380 "" 0 0 0 "">
  <690 380 740 380 "" 0 0 0 "">
  <310 1390 360 1390 "" 0 0 0 "">
  <310 1310 310 1390 "" 0 0 0 "">
  <2680 -90 2730 -90 "" 0 0 0 "">
  <2730 -150 2730 -90 "" 0 0 0 "">
  <2730 -150 2770 -150 "" 0 0 0 "">
  <3060 30 3060 40 "" 0 0 0 "">
  <2520 -90 2620 -90 "" 0 0 0 "">
  <2970 -150 3070 -150 "" 0 0 0 "">
  <2830 -150 2910 -150 "" 0 0 0 "">
  <180 380 260 380 "Vsource" 120 330 23 "">
  <2970 -30 3060 -30 "" 0 0 0 "">
  <2830 -30 2910 -30 "" 0 0 0 "">
  <2730 -90 2730 -30 "" 0 0 0 "">
  <2730 -30 2770 -30 "" 0 0 0 "">
  <410 -10 410 70 "" 0 0 0 "">
  <410 -10 420 -10 "" 0 0 0 "">
  <410 70 410 130 "Vout" 350 60 40 "">
  <320 380 630 380 "Vamp1" 340 330 55 "">
  <430 1230 490 1230 "" 0 0 0 "">
  <310 1230 310 1250 "" 0 0 0 "">
  <310 1230 370 1230 "" 0 0 0 "">
  <900 380 900 490 "" 0 0 0 "">
  <840 380 840 490 "" 0 0 0 "">
  <840 550 840 570 "" 0 0 0 "">
  <900 550 900 570 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 650 1430 281 175 3 #c0c0c0 1 00 1 2.5e+09 5e+09 2e+10 0 0 2 15 1 -1 1 1 315 0 225 "" "" "" "">
	<"S[11,9]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 650 1680 281 186 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[10,9]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 650 1210 284 55 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S21_dB" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1130 1240 267 64 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"microstrip_S21_dB" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1440 720 570 338 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1440 350 562 331 3 #c0c0c0 1 00 1 2.5e+09 1e+09 1.5e+10 1 -0.415026 1 5 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"fb_gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 3270 32 499 222 3 #c0c0c0 1 00 1 2.75e+09 2e+09 2e+10 1 0.25 0.05 0.46655 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[16,15]" #0000ff 0 3 0 0 0>
	<"S[17,15]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1040 248 279 178 3 #c0c0c0 1 00 1 2e+09 2e+09 1.5e+10 1 0 1 2.35455 1 -1 1 1 315 0 225 "" "" "" "">
	<"Vout.v" #aaaaff 0 3 0 0 0>
	<"Vamp1.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1500 -130 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[1,2]" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 2130 1180 12 #000000 0 "Bessel high-pass filter \n 6 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 2870 840 12 #000000 0 "Bessel low-pass filter \n 5 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Rectangle -70 1130 1070 630 #000000 0 1 #c0c0c0 1 0>
  <Rectangle -1390 -1110 6360 4200 #000000 0 1 #c0c0c0 1 0>
  <Rectangle -430 -100 1790 950 #000000 0 1 #c0c0c0 1 0>
  <Text 2550 -240 12 #000000 0 "Wilkinson requires a precision microwave resistor.">
  <Text 2560 -300 12 #000000 0 "50% Tee splitter for output | feedback loop\n50 -> 100 -> 1/4 λ 70.7 -> 50">
</Paintings>
