<Qucs Schematic >
<Properties>
  <View=-1430,-1130,5106,3110,0.466552,56,178>
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
  <.ID -20 -16 SUB>
  <Line -20 20 40 0 #000080 2 1>
  <Line 20 20 0 -40 #000080 2 1>
  <Line -20 -20 40 0 #000080 2 1>
  <Line -20 20 0 -40 #000080 2 1>
</Symbol>
<Components>
  <Pac P8 0 3770 1690 18 -26 0 1 "7" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *9 4 3770 1720 0 0 0 0>
  <L L2 0 3880 1610 -26 10 0 0 "537 pH" 1 "" 0>
  <C C6 0 3950 1690 17 -26 0 1 "618 fF" 1 "" 0 "neutral" 0>
  <GND *10 4 3950 1720 0 0 0 0>
  <L L3 0 4020 1610 -26 10 0 0 "3.51 nH" 1 "" 0>
  <Pac P9 0 4090 1690 18 -26 0 1 "8" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *11 4 4090 1720 0 0 0 0>
  <.SP SP2 0 3780 1790 0 88 0 0 "log" 1 "500 MHz" 1 "50 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn7 0 4000 1800 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <C C2 0 3860 1120 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS3 0 3970 1120 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 4 3910 1280 0 0 0 0>
  <GND * 4 3800 1310 0 0 0 0>
  <Pac P3 0 3800 1280 18 -26 0 1 "3" 1 "500 Ohm" 1 "0 dBm" 0 "3 GHz" 0 "26.85" 0>
  <Eqn Eqn4 0 3870 1010 -31 17 0 0 "y=abs(fft(V1.Vt))" 1 "yes" 0>
  <.TR TR1 0 3790 1400 0 88 0 0 "lin" 1 "0" 1 "1 us" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <SPfile X1 0 3910 1250 249 -83 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP5 0 4020 740 0 88 0 0 "lin" 1 "2.75GHz" 1 "20GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn12 0 3870 740 -28 15 0 0 "S11_dB=dB(S[1,1])" 1 "S21_dB=dB(S[2,1])" 1 "S31_dB=dB(S[3,1])" 1 "S22_dB=dB(S[2,2])" 1 "S33_dB=dB(S[3,3])" 1 "yes" 0>
  <MLIN MS17 1 3940 510 -26 20 0 0 "Sub1" 0 "1.49 mm" 1 "7.44 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS18 1 4090 450 -26 20 0 0 "Sub1" 0 "316 um" 1 "7.92 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P17 1 4350 600 18 -26 0 1 "16" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *23 5 4350 640 0 0 0 0>
  <Pac P16 1 4360 480 18 -26 0 1 "17" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *22 5 4360 510 0 0 0 0>
  <SUBST Sub1 1 4240 760 -30 24 0 0 "4.4" 1 "0.79mm" 1 "32um" 1 "0.0125" 1 "2.43902e-08" 1 "1.5e-07" 1>
  <Pac P15 1 3810 540 18 -26 0 1 "15" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *21 5 3810 570 0 0 0 0>
  <MLIN MS20 1 4230 450 -26 20 0 0 "Sub1" 0 "0.790 um" 1 "5.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS19 1 4090 570 -26 20 0 0 "Sub1" 0 "316 um" 1 "7.92 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS21 1 4230 570 -26 20 0 0 "Sub1" 0 "0.790 um" 1 "5.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L8 1 1710 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <GND *25 5 1840 -700 0 0 0 0>
  <MLIN MS32 1 1840 -740 15 -26 0 1 "Subst1" 1 "2.5 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L9 1 1880 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <C C11 1 1790 -860 -26 17 0 0 "4.7pF" 1 "" 0 "neutral" 0>
  <C C12 1 1960 -860 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MCOUPLED MS34 1 100 -550 -137 -26 1 1 "Subst1" 1 "Zwidth" 1 "6 mm" 1 "0.38 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS30 1 1310 -1010 -26 15 0 0 "Subst1" 1 "Zwidth" 1 " 4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L7 1 1270 -830 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS31 1 1240 -920 -115 -26 1 1 "Subst1" 1 "Zwidth" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C10 1 1350 -830 -26 17 0 0 "0.3 pF" 1 "" 0 "neutral" 0>
  <MLIN MS35 1 620 -970 -26 20 0 0 "Sub1" 0 "316 um" 1 "7.92 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS36 1 710 -970 -26 20 0 0 "Sub1" 0 "0.790 um" 1 "5.3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS39 1 620 -710 -26 20 0 0 "Sub1" 0 "1 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS40 1 710 -710 -26 20 0 0 "Sub1" 0 "1 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS44 1 660 -530 -26 20 0 0 "Sub1" 0 "0.47 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS48 1 1400 -920 15 -26 0 1 "Subst1" 1 "Zwidth" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C16 1 2490 -860 -26 17 0 0 "4 pF" 1 "" 0 "neutral" 0>
  <C C15 1 2660 -860 -26 17 0 0 "4pF" 1 "" 0 "neutral" 0>
  <L L13 1 2580 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS50 1 2320 -860 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L12 1 2410 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS52 1 2840 -730 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS51 1 2540 -740 15 -26 0 1 "Subst1" 1 "1.5 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R6 1 3360 -740 15 -26 0 1 "1000 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L17 1 4360 -670 -26 10 1 2 "0.2 nH" 1 "" 0>
  <C C20 1 4430 -670 -26 -57 0 2 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS60 1 4260 -670 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C21 2 4130 -920 -26 -57 0 2 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS61 1 4160 -830 15 -26 1 3 "Subst1" 1 "Zwidth" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L18 2 4060 -920 -26 10 1 2 "0.2 nH" 1 "" 0>
  <MLIN MS62 1 3990 -830 -115 -26 0 3 "Subst1" 1 "Zwidth" 1 "6mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS63 1 3990 -670 -26 34 0 2 "Subst1" 1 "Zwidth" 1 "Zwidth" 1 "Zwidth" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS64 1 4160 -670 -26 34 0 2 "Subst1" 1 "Zwidth" 1 "Zwidth" 1 "Zwidth" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS65 1 4510 -670 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R9 1 4160 -750 15 -26 0 1 "200 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R10 1 3990 -750 15 -26 0 1 "200 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L22 1 3870 -120 -26 10 1 2 "0.2 nH" 1 "" 0>
  <MLIN MS67 1 3770 -120 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "0.1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS68 1 4020 -120 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "0.1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS69 1 3690 -200 15 -26 1 3 "Subst1" 1 "2.5 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C23 1 3940 -120 -26 -57 0 2 "10 pF" 1 "" 0 "neutral" 0>
  <MLIN MS70 1 3420 -200 -115 -26 0 3 "Subst1" 1 "2.5 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS71 1 3420 -120 -26 34 0 2 "Subst1" 1 "Zwidth" 1 "Zwidth" 1 "Zwidth" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <L L24 1 3470 -290 -26 10 1 2 "8.2 nH" 1 "" 0>
  <L L25 1 3570 -290 -26 10 1 2 "0.2 nH" 1 "" 0>
  <C C24 1 3660 -290 -26 -57 0 2 "4.7 pF" 1 "" 0 "neutral" 0>
  <L L23 1 3580 -120 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R11 1 3660 -120 -26 15 0 0 "1" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <MLIN MS76 0 4500 30 -26 -95 0 2 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS77 0 4500 140 -26 15 1 2 "Subst1" 1 "Zwidth" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L34 0 4570 30 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R13 0 4650 30 -26 15 0 0 "R2" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L36 0 4570 140 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R15 0 4650 140 -26 15 0 0 "R1" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L37 1 3740 2540 10 -26 1 3 "0.7 nH" 1 "" 0>
  <GND *26 5 3740 2670 0 0 0 0>
  <C C25 1 3740 2620 17 -26 0 1 "10 pF" 1 "" 0 "neutral" 0>
  <C C26 1 3740 2480 17 -26 0 1 "5 pF" 1 "" 0 "neutral" 0>
  <R R4 1 1710 430 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 5 1710 460 0 0 0 0>
  <GND * 5 1610 430 0 0 0 0>
  <SPfile X4 1 1610 400 -12 -40 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <MLIN MS105 1 1520 500 20 -26 0 1 "Sub1" 0 "0.2 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS107 1 1490 530 -26 -80 0 2 "Sub1" 0 "4 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R20 1 1520 560 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *42 5 1520 590 0 0 0 0>
  <.AC AC1 1 1180 -270 0 51 0 0 "lin" 1 "0.1 GHz" 1 "10 GHz" 1 "40" 1 "no" 0>
  <Eqn MicrostripParameters 1 -890 -130 -31 17 0 0 "Zwidth=1.487e-3" 1 "Lenbias=5.5e-3" 1 "Zbias=0.2e-3" 1 "yes" 0>
  <.SP SP6 0 -940 410 0 88 0 0 "lin" 1 "1 GHz" 1 "15 GHz" 1 "30" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn13 0 -910 310 -31 17 0 0 "output_dB=dB(S[2,1])" 1 "yes" 0>
  <GND *2 5 -30 460 0 0 0 0>
  <GND *4 5 80 430 0 0 0 0>
  <Pac P1 1 -30 430 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <SPfile X2 1 80 400 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *20 5 230 50 0 0 0 1>
  <Pac P18 0 200 50 -26 -78 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *24 5 220 130 0 0 0 1>
  <MLIN MS10 1 160 260 15 -26 0 1 "Subst1" 1 "Zwidth" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R5 1 190 130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <MLIN MS116 1 160 510 20 -26 0 1 "Sub1" 0 "0.2 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *43 5 160 630 0 0 0 0>
  <MLIN MS117 1 130 550 -26 -80 0 2 "Sub1" 0 "4 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R21 1 160 590 15 -26 1 3 "1 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <MLIN MS118 2 250 400 -26 20 0 0 "Sub1" 0 "0.47 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P6 0 4240 1410 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *6 4 4240 1440 0 0 0 0>
  <C C4 0 4350 1330 -27 10 0 0 "1.57 pF" 1 "" 0 "neutral" 0>
  <L L1 0 4420 1410 17 -26 0 1 "1.37 nH" 1 "" 0>
  <GND *7 4 4420 1440 0 0 0 0>
  <C C5 0 4490 1330 -27 10 0 0 "241 fF" 1 "" 0 "neutral" 0>
  <Pac P7 0 4560 1410 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 4 4560 1440 0 0 0 0>
  <Pac P19 1 2190 1890 18 -26 0 1 "20" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *44 5 2190 1920 0 0 0 0>
  <MLIN MS119 1 2250 1740 -26 15 0 0 "Sub1" 1 "1.491 mm" 1 "6.806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *45 5 2300 1610 0 0 0 2>
  <MLIN MS120 1 2300 1640 15 -15 0 1 "Sub1" 1 "20.52 mm" 1 "6.806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS121 1 2340 1740 -26 15 0 0 "Sub1" 1 "1.491 mm" 1 "6.806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *46 5 2390 1610 0 0 0 2>
  <MLIN MS122 1 2390 1640 15 -15 0 1 "Sub1" 1 "81.65 mm" 1 "6.806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS123 1 2430 1740 -26 15 0 0 "Sub1" 1 "1.491 mm" 1 "6.806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P20 1 2510 1890 18 -26 0 1 "10" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *47 5 2510 1920 0 0 0 0>
  <.SP SP7 0 2200 2020 0 88 0 0 "lin" 1 "500 MHz" 1 "50 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub2 1 2430 2060 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn20 1 2580 2120 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P21 1 2190 2620 18 -26 0 1 "21" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *50 5 2190 2650 0 0 0 0>
  <Pac P22 1 2510 2620 18 -26 0 1 "11" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *53 5 2510 2650 0 0 0 0>
  <MLIN MS129 1 2260 2470 -26 15 0 0 "Sub1" 1 "1.5 mm" 1 "4.61 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *60 5 2310 2340 0 0 0 2>
  <MLIN MS130 1 2310 2370 15 -15 0 1 "Sub1" 1 "31.52 mm" 1 "4.61 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS131 1 2350 2470 -26 15 0 0 "Sub1" 1 "1.5 mm" 1 "4.61 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *61 5 2400 2340 0 0 0 2>
  <MLIN MS132 1 2400 2370 15 -15 0 1 "Sub1" 1 "121.3 mm" 1 "4.61 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS133 1 2440 2470 -26 15 0 0 "Sub1" 1 "1.5 mm" 1 "4.61 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST Subst1 1 -890 -330 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "0.02" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Pac P10 2 -70 2000 18 -26 0 1 "9" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *13 5 -70 2030 0 0 0 0>
  <Pac P11 2 430 2000 18 -26 0 1 "10" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *14 5 430 2030 0 0 0 0>
  <MLIN MS7 2 70 1970 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 2 330 1970 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SPfile X5 2 180 1970 -7 -45 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *15 5 180 2000 0 0 0 0>
  <Pac P13 1 1060 1980 18 -26 0 1 "12" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *18 5 1060 2010 0 0 0 0>
  <MLIN MS9 1 1200 1950 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P14 1 1340 1980 18 -26 0 1 "13" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *19 5 1340 2010 0 0 0 0>
  <.SP SP4 0 1050 2100 0 88 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn6 0 310 2170 -28 15 0 0 "S21_dB=dB(S[11,9])" 1 "yes" 0>
  <Eqn Eqn10 0 1310 2150 -28 15 0 0 "microstrip_S21_dB=dB(S[13,12])" 1 "yes" 0>
  <MLIN MS16 2 250 1860 -115 -26 1 1 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *16 5 340 1840 0 0 0 0>
  <Pac P12 2 430 1840 18 -26 0 1 "11" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *17 5 430 1870 0 0 0 0>
  <SPfile X6 2 340 1810 -8 -47 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP1 0 20 2130 0 88 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn15 1 1432 984 -31 17 0 0 "R2=500-R1" 1 "yes" 0>
  <Eqn Eqn17 1 1432 1324 -31 17 0 0 "R1=5" 1 "yes" 0>
  <Eqn Eqn19 0 1272 1324 -31 17 0 0 "C1=2e-12" 1 "yes" 0>
  <Eqn Eqn16 1 1282 994 -31 17 0 0 "C2=(30e-12)-C1" 1 "yes" 0>
  <.SW SW2 0 1400 1070 0 88 0 0 "AC1" 1 "lin" 1 "R1" 1 "5" 1 "500" 1 "2" 1>
  <.SW SW1 1 1250 1070 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "0.3 pF" 1 "5 pF" 1 "10" 1>
  <.SW SW3 0 1110 1070 0 88 0 0 "AC1" 1 "lin" 1 "Leng" 1 "3e-3" 1 "20e-3" 1 "20" 1>
  <.Opt Opt1 0 1630 1090 0 51 0 0 "Sim=AC1" 0 "DE=3|50|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|3.7e-12|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|0.0135|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|0.00294|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=fb_gain|MAX|1" 0 "Goal=phase_shift|GE|300" 0>
  <Eqn Eqn9 1 -810 680 -31 17 0 0 "phase_shift_optim=max(abs(180-phase(Vfb.v)),5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn8 1 -810 780 -31 17 0 0 "fb_gain_optim=max(Vfb.v/Vamp1.v,5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn3 1 -810 960 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn5 1 -810 880 -31 17 0 0 "fb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <Eqn Eqn11 1 -560 900 -31 17 0 0 "output_gain=dB(Vout.v/Vsource.v)" 1 "yes" 0>
  <Eqn Eqn14 1 -810 1050 -31 17 0 0 "two_pass_loop_gain=Vfb_amp.v/Vsource.v" 1 "yes" 0>
  <GND *71 5 1120 200 0 0 0 2>
  <L L40 1 800 400 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS140 1 950 400 -26 15 0 0 "Sub1" 1 "1.5  mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L45 1 1030 400 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS141 1 1180 400 -26 15 0 0 "Sub1" 1 "1.5  mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L46 1 1260 400 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS142 1 1410 400 -26 15 0 0 "Sub1" 1 "1.5  mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C28 1 880 400 -26 17 0 0 "C1" 1 "" 0 "neutral" 0>
  <C C34 1 1110 400 -26 17 0 0 "C1" 1 "" 0 "neutral" 0>
  <C C35 1 1340 400 -26 17 0 0 "C1" 1 "" 0 "neutral" 0>
  <.SP SP8 1 1900 2770 0 88 0 0 "lin" 1 "750 MHz" 1 "20 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P23 1 -260 2700 18 -26 0 1 "25" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *72 5 -260 2730 0 0 0 0>
  <MLIN MS143 1 -200 2550 -26 15 0 0 "Sub1" 1 "200 um" 1 "433 um" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS144 1 -110 2550 -26 15 0 0 "Sub1" 1 "5 mm" 1 "1.392 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS145 1 -20 2550 -26 15 0 0 "Sub1" 1 "200 um" 1 "3.703 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS146 1 150 2550 -26 15 0 0 "Sub1" 1 "200 um" 1 "377.1 um" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS147 1 240 2550 -26 15 0 0 "Sub1" 1 "5 mm" 1 "1.218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS148 1 330 2550 -26 15 0 0 "Sub1" 1 "200 um" 1 "3.231 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P24 1 410 2710 18 -26 0 1 "24" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *73 5 410 2740 0 0 0 0>
  <SUBST Sub3 1 -40 2870 -30 24 0 0 "4.4" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
</Components>
<Wires>
  <3770 1610 3770 1660 "" 0 0 0 "">
  <3770 1610 3850 1610 "" 0 0 0 "">
  <3950 1610 3950 1660 "" 0 0 0 "">
  <4090 1610 4090 1660 "" 0 0 0 "">
  <3950 1610 3990 1610 "" 0 0 0 "">
  <3910 1610 3950 1610 "" 0 0 0 "">
  <4050 1610 4090 1610 "" 0 0 0 "">
  <3890 1120 3940 1120 "" 0 0 0 "">
  <4000 1120 4050 1120 "V1" 4040 1090 1 "">
  <3770 1120 3830 1120 "" 0 0 0 "">
  <3770 1120 3770 1250 "" 0 0 0 "">
  <3770 1250 3800 1250 "" 0 0 0 "">
  <4050 1120 4050 1250 "" 0 0 0 "">
  <3940 1250 4050 1250 "" 0 0 0 "">
  <3800 1250 3880 1250 "" 0 0 0 "">
  <3970 510 4020 510 "" 0 0 0 "">
  <4020 450 4020 510 "" 0 0 0 "">
  <4020 450 4060 450 "" 0 0 0 "">
  <4350 630 4350 640 "" 0 0 0 "">
  <3810 510 3910 510 "" 0 0 0 "">
  <4260 450 4360 450 "" 0 0 0 "">
  <4120 450 4200 450 "" 0 0 0 "">
  <4260 570 4350 570 "" 0 0 0 "">
  <4120 570 4200 570 "" 0 0 0 "">
  <4020 510 4020 570 "" 0 0 0 "">
  <4020 570 4060 570 "" 0 0 0 "">
  <1740 -860 1760 -860 "" 0 0 0 "">
  <1820 -860 1840 -860 "" 0 0 0 "">
  <1840 -860 1840 -770 "" 0 0 0 "">
  <1840 -710 1840 -700 "" 0 0 0 "">
  <1910 -860 1930 -860 "" 0 0 0 "">
  <1840 -860 1850 -860 "" 0 0 0 "">
  <1240 -1010 1280 -1010 "" 0 0 0 "">
  <1300 -830 1320 -830 "" 0 0 0 "">
  <1240 -1010 1240 -950 "" 0 0 0 "">
  <1240 -890 1240 -830 "" 0 0 0 "">
  <1340 -1010 1400 -1010 "" 0 0 0 "">
  <1400 -1010 1400 -950 "" 0 0 0 "">
  <1380 -830 1400 -830 "" 0 0 0 "">
  <1400 -890 1400 -830 "" 0 0 0 "">
  <2350 -860 2380 -860 "" 0 0 0 "">
  <2440 -860 2460 -860 "" 0 0 0 "">
  <2520 -860 2550 -860 "" 0 0 0 "">
  <2610 -860 2630 -860 "" 0 0 0 "">
  <4390 -670 4400 -670 "" 0 0 0 "">
  <4290 -670 4330 -670 "" 0 0 0 "">
  <3990 -800 3990 -780 "" 0 0 0 "">
  <4160 -920 4160 -860 "" 0 0 0 "">
  <4090 -920 4100 -920 "" 0 0 0 "">
  <3990 -920 4030 -920 "" 0 0 0 "">
  <3990 -920 3990 -860 "" 0 0 0 "">
  <3990 -720 3990 -700 "" 0 0 0 "">
  <3960 -670 3960 -550 "" 0 0 0 "">
  <4190 -670 4230 -670 "" 0 0 0 "">
  <4160 -800 4160 -780 "" 0 0 0 "">
  <4160 -720 4160 -700 "" 0 0 0 "">
  <4020 -670 4130 -670 "" 0 0 0 "">
  <4460 -670 4480 -670 "" 0 0 0 "">
  <3900 -120 3910 -120 "" 0 0 0 "">
  <3800 -120 3840 -120 "" 0 0 0 "">
  <3970 -120 3990 -120 "" 0 0 0 "">
  <3690 -120 3740 -120 "" 0 0 0 "">
  <3690 -170 3690 -120 "" 0 0 0 "">
  <3690 -290 3690 -230 "" 0 0 0 "">
  <3420 -170 3420 -150 "" 0 0 0 "">
  <3450 -120 3550 -120 "" 0 0 0 "">
  <3420 -290 3420 -230 "" 0 0 0 "">
  <3420 -290 3440 -290 "" 0 0 0 "">
  <3500 -290 3540 -290 "" 0 0 0 "">
  <3600 -290 3630 -290 "" 0 0 0 "">
  <3610 -120 3630 -120 "" 0 0 0 "">
  <4530 30 4540 30 "" 0 0 0 "">
  <4600 30 4620 30 "" 0 0 0 "">
  <4530 140 4540 140 "" 0 0 0 "">
  <4670 0 4670 10 "" 0 0 0 "">
  <4660 10 4670 10 "" 0 0 0 "">
  <4540 140 4580 140 "" 0 0 0 "">
  <4600 140 4620 140 "" 0 0 0 "">
  <4680 30 4680 140 "" 0 0 0 "">
  <3735 2545 3745 2545 "" 0 0 0 "">
  <3735 2515 3735 2545 "" 0 0 0 "">
  <3740 2570 3740 2590 "" 0 0 0 "">
  <3740 2650 3740 2670 "" 0 0 0 "">
  <1640 400 1710 400 "Vfb_amp" 1700 350 20 "">
  <1520 400 1580 400 "Vfb" 1510 330 31 "">
  <1520 400 1520 470 "" 0 0 0 "">
  <-30 400 50 400 "Vsource" -90 350 13 "">
  <110 400 160 400 "Vamp1" 100 310 3 "">
  <160 50 160 130 "" 0 0 0 "">
  <160 50 170 50 "" 0 0 0 "">
  <160 290 160 400 "" 0 0 0 "">
  <160 400 160 480 "" 0 0 0 "">
  <160 130 160 230 "Vout" 90 60 40 "">
  <160 540 160 550 "" 0 0 0 "">
  <160 620 160 630 "" 0 0 0 "">
  <160 550 160 560 "" 0 0 0 "">
  <160 400 220 400 "" 0 0 0 "">
  <4240 1330 4240 1380 "" 0 0 0 "">
  <4240 1330 4320 1330 "" 0 0 0 "">
  <4420 1330 4420 1380 "" 0 0 0 "">
  <4560 1330 4560 1380 "" 0 0 0 "">
  <4420 1330 4460 1330 "" 0 0 0 "">
  <4380 1330 4420 1330 "" 0 0 0 "">
  <4520 1330 4560 1330 "" 0 0 0 "">
  <2190 1740 2190 1860 "" 0 0 0 "">
  <2190 1740 2220 1740 "" 0 0 0 "">
  <2510 1740 2510 1860 "" 0 0 0 "">
  <2460 1740 2510 1740 "" 0 0 0 "">
  <2280 1740 2300 1740 "" 0 0 0 "">
  <2300 1740 2310 1740 "" 0 0 0 "">
  <2300 1670 2300 1740 "" 0 0 0 "">
  <2370 1740 2390 1740 "" 0 0 0 "">
  <2390 1740 2400 1740 "" 0 0 0 "">
  <2390 1670 2390 1740 "" 0 0 0 "">
  <2190 2470 2190 2590 "" 0 0 0 "">
  <2510 2470 2510 2590 "" 0 0 0 "">
  <2510 2470 2520 2470 "" 0 0 0 "">
  <2470 2470 2510 2470 "" 0 0 0 "">
  <2290 2470 2310 2470 "" 0 0 0 "">
  <2310 2470 2320 2470 "" 0 0 0 "">
  <2310 2400 2310 2470 "" 0 0 0 "">
  <2380 2470 2400 2470 "" 0 0 0 "">
  <2400 2470 2410 2470 "" 0 0 0 "">
  <2400 2400 2400 2470 "" 0 0 0 "">
  <2190 2470 2230 2470 "" 0 0 0 "">
  <-70 1970 40 1970 "" 0 0 0 "">
  <360 1970 430 1970 "" 0 0 0 "">
  <100 1970 150 1970 "" 0 0 0 "">
  <1060 1950 1170 1950 "" 0 0 0 "">
  <1230 1950 1340 1950 "" 0 0 0 "">
  <210 1970 250 1970 "" 0 0 0 "">
  <250 1970 300 1970 "" 0 0 0 "">
  <250 1890 250 1970 "" 0 0 0 "">
  <370 1810 430 1810 "" 0 0 0 "">
  <250 1810 250 1830 "" 0 0 0 "">
  <250 1810 310 1810 "" 0 0 0 "">
  <1440 400 1520 400 "" 0 0 0 "">
  <280 400 320 400 "" 0 0 0 "">
  <320 400 340 400 "" 0 0 0 "">
  <320 400 320 660 "" 0 0 0 "">
  <1120 200 1120 260 "" 0 0 0 "">
  <660 660 730 660 "" 0 0 0 "">
  <730 400 730 660 "" 0 0 0 "">
  <730 400 770 400 "" 0 0 0 "">
  <830 400 850 400 "" 0 0 0 "">
  <910 400 920 400 "" 0 0 0 "">
  <1060 400 1080 400 "" 0 0 0 "">
  <1140 400 1150 400 "" 0 0 0 "">
  <1290 400 1310 400 "" 0 0 0 "">
  <1370 400 1380 400 "" 0 0 0 "">
  <1210 400 1230 400 "" 0 0 0 "">
  <980 400 1000 400 "" 0 0 0 "">
  <-260 2550 -260 2670 "" 0 0 0 "">
  <-260 2550 -230 2550 "" 0 0 0 "">
  <-170 2550 -140 2550 "" 0 0 0 "">
  <-80 2550 -50 2550 "" 0 0 0 "">
  <360 2550 410 2550 "" 0 0 0 "">
  <180 2550 210 2550 "" 0 0 0 "">
  <270 2550 300 2550 "" 0 0 0 "">
  <410 2550 410 2680 "" 0 0 0 "">
  <100 2550 120 2550 "" 0 0 0 "">
  <10 2550 40 2550 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 4560 632 499 222 3 #c0c0c0 1 00 1 2.75e+09 2e+09 2e+10 1 0.25 0.05 0.46655 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[16,15]" #0000ff 0 3 0 0 0>
	<"S[17,15]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1880 770 570 338 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1880 380 562 331 3 #c0c0c0 1 00 1 0 1e+09 1e+10 0 0 0.5 3.81341 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"fb_gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1880 12 590 323 3 #c0c0c0 1 00 1 2.5e+09 1e+09 1e+10 1 0 10 10 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"two_pass_loop_gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 2550 380 491 336 3 #c0c0c0 1 00 1 0 2e+09 1e+10 1 1 1 4 1 -1 1 1 315 0 225 "" "" "" "">
	<"Vfb_amp.v" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 2550 -59 508 211 3 #c0c0c0 1 00 1 2e+09 2e+09 1e+10 0 0 0.5 2 1 -1 1 1 315 0 225 "" "" "" "">
	<"Vout.v" #aaaaff 0 3 0 0 0>
	<"Vamp1.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect -940 200 240 160 3 #c0c0c0 1 00 1 0 5e+09 1.5e+10 0 0 5 15 1 -1 1 1 315 0 225 "" "" "" "">
	<"output_dB" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 2780 1850 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[20,10]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 2720 2500 240 160 3 #c0c0c0 1 00 1 0 2e+10 8e+10 1 -0.0999682 0.5 1.09988 1 -1 1 1 315 0 225 "" "" "" "">
	<"S[21,11]" #0000ff 0 3 0 0 0>
	<"S[21,11]" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 590 2010 281 175 3 #c0c0c0 1 00 1 2.5e+09 5e+09 2e+10 0 0 2 15 1 -1 1 1 315 0 225 "" "" "" "">
	<"S[11,9]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 590 2260 281 186 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[10,9]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1060 1780 267 64 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"microstrip_S21_dB" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1610 2790 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[22,105]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 680 2690 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[25,24]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 590 1790 284 55 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S21_dB" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Rectangle -1390 -1110 6360 4200 #000000 0 1 #c0c0c0 1 0>
  <Text 3840 360 12 #000000 0 "Wilkinson requires a precision microwave resistor.">
  <Text 3850 300 12 #000000 0 "50% Tee splitter for output | feedback loop\n50 -> 100 -> 1/4 λ 70.7 -> 50">
  <Rectangle -970 -430 4110 1830 #000000 0 1 #c0c0c0 1 0>
  <Text 1170 -340 12 #000000 0 "val.V = peak DC voltage\nval.v = peak AC voltage\n\n">
  <Text 1850 -950 12 #000000 0 "6-7 GHz shift, good resonance">
  <Text 30 -680 12 #000000 0 "Replacing DC block cap with a microstrip gap \nwith Zwidth and a 0.38 mm gap destroys the FB gain.">
  <Text 0 -610 12 #000000 0 "Coupler also kills gain.\n">
  <Text 1280 -770 12 #000000 0 "Varactor\n">
  <Text 510 -880 12 #000000 0 "5.5 GHz λ/4 50Z--(?Z)>100Z--(70Z)>50Z \ntransformer. Smoothens Vout power a bit,\nand sharpens resonance at Vfb\nPut immediately at output of Vamp\nWorks really well, recommended, but too long for 8 GHz\n">
  <Text 530 -620 12 #000000 0 "Sharper res, higher FB, and 8.5 GHz max fb\nSlightly mismatched at 7 GHz - only 75 deg phase shift\nToo much power through FB, zero at Vout">
  <Text 2450 -990 12 #000000 0 "Basically perfect\n">
  <Text 2820 -840 12 #000000 0 "Also works, sharper resonance\nPrefer 1.5x4 though\n">
  <Text 2270 -600 12 #000000 0 "Contrary to previous belief, the chosen varactor C varies from \n2 to 40 pF.">
  <Text 3240 -840 12 #000000 0 "PIN diode also doesn't have the dynamic range in that phase-shifter capacity">
  <Text 1810 -600 12 #000000 0 "Fhigh = 0.5 pF\nFlow = 4 pF">
  <Text 4010 -450 12 #000000 0 "Works pretty well, but PIN inductance not modelled">
  <Text 3450 -370 12 #000000 0 "Good dynamic range. V. good.">
  <Text 4460 -340 12 #000000 0 "Phase shift is fine, but filter isn't">
  <Text 3740 2400 12 #000000 0 "Varies phase around 5 GHz. Resonance is static.">
  <Text 4140 1750 12 #000000 0 "Bessel low-pass filter \n 5 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 4460 -140 12 #000000 0 "Switched line: this works well.">
  <Text -140 690 12 #000000 0 "The way this is teed doesn't seem to make a difference.\n">
  <Text -100 200 12 #000000 0 "This length doesn't \naffect the FB loop at all!">
  <Arrow 90 650 30 -210 20 8 #000000 0 1 0>
  <Text 4580 1510 12 #000000 0 "Bessel high-pass filter \n 6 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 2550 2020 12 #000000 0 "Quarter wave bandpass filter \n Bessel 5 GHz...5.5 GHz \n Impedance matching 50 Ohm">
  <Text 2550 2750 12 #000000 0 "Quarter wave bandpass filter \n Bessel 7.5 GHz...8 GHz \n Impedance matching 50 Ohm">
  <Text 2800 2050 12 #000000 0 "Quarter wave bandpass filter \n Bessel 5 GHz...8 GHz \n Impedance matching 50 Ohm">
  <Rectangle -130 1710 1070 630 #000000 0 1 #c0c0c0 1 0>
  <Text -500 1290 12 #000000 0 "Using higher-impedance lines raises frequency">
  <Text -510 1330 12 #000000 0 "A short length of wide (2.5 mm) microstrip completely destroys the FB gain">
  <Text -510 1240 12 #000000 0 "Adding pure inductance to ground (0.2 nH) raises frequency.">
  <Text -520 1180 12 #000000 0 "4mm long microstrip to ground: Fres increases with width >10 mm.\nWhy's that?">
  <Text 110 1280 12 #000000 0 "Adding 1 pF in parallel with the varactor broadens the FB gain.">
  <Text 110 1310 12 #000000 0 "0.2 nH corresponds to a 0402 package.\n">
  <Text -1020 1340 12 #000000 0 "Using 8.2 nH bias tees still introduces undesirable modes">
  <Text -1020 1290 12 #000000 0 "Adding a HP pi or tee filter just doesn't work.">
  <Text 1410 820 12 #000000 0 "Rather than do a transient sim of the oscillation,\nthis second amp represents the first amp on the second\nFB loop around\n">
  <Text 750 -530 12 #000000 0 "Just right.">
  <Text -760 1060 12 #000000 0 "Unhelpful because of phase">
  <Text 530 770 12 #000000 0 "Quarter wave bandpass filter \n Bessel 7.5 GHz...8 GHz \n Impedance matching 50 Ohm">
  <Text 390 150 12 #000000 0 "Quarter wave bandpass filter \n Bessel 5 GHz...5.5 GHz \n Impedance matching 50 Ohm">
  <Text 320 2880 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 7 GHz...9 GHz \n impedance matching 50 Ohm">
  <Text 100 2830 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 7 GHz...9 GHz \n impedance matching 50 Ohm">
  <Text -530 2870 12 #000000 0 "stepped-impedance lowpass filter \n Bessel 8 GHz...9 GHz \n impedance matching 50 Ohm">
</Paintings>
