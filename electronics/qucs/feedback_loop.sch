<Qucs Schematic >
<Properties>
  <View=-1410,-1158,5106,3110,0.51325,550,241>
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
  <Pac P10 2 -10 1420 18 -26 0 1 "9" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *13 5 -10 1450 0 0 0 0>
  <Pac P11 2 490 1420 18 -26 0 1 "10" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *14 5 490 1450 0 0 0 0>
  <MLIN MS7 2 130 1390 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 2 390 1390 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SPfile X5 2 240 1390 -7 -45 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *15 5 240 1420 0 0 0 0>
  <Pac P13 1 1120 1400 18 -26 0 1 "12" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *18 5 1120 1430 0 0 0 0>
  <MLIN MS9 1 1260 1370 -26 15 0 0 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P14 1 1400 1400 18 -26 0 1 "13" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *19 5 1400 1430 0 0 0 0>
  <.SP SP4 0 1110 1520 0 88 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn6 0 370 1590 -28 15 0 0 "S21_dB=dB(S[11,9])" 1 "yes" 0>
  <Eqn Eqn10 0 1370 1570 -28 15 0 0 "microstrip_S21_dB=dB(S[13,12])" 1 "yes" 0>
  <MLIN MS16 2 310 1280 -115 -26 1 1 "Subst1" 1 "Zwidth" 1 "1 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *16 5 400 1260 0 0 0 0>
  <Pac P12 2 490 1260 18 -26 0 1 "11" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND *17 5 490 1290 0 0 0 0>
  <SPfile X6 2 400 1230 -8 -47 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP SP1 0 80 1550 0 88 0 0 "log" 1 "2.5 GHz" 1 "20 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn OptValues1 1 970 720 -28 15 0 0 "L1=1.345160E-02" 1 "L2=2.936499E-03" 1 "yes" 0>
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
  <Pac P6 0 3110 1740 18 -26 0 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *6 4 3110 1770 0 0 0 0>
  <C C4 0 3220 1660 -27 10 0 0 "1.57 pF" 1 "" 0 "neutral" 0>
  <L L1 0 3290 1740 17 -26 0 1 "1.37 nH" 1 "" 0>
  <GND *7 4 3290 1770 0 0 0 0>
  <C C5 0 3360 1660 -27 10 0 0 "241 fF" 1 "" 0 "neutral" 0>
  <Pac P7 0 3430 1740 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 4 3430 1770 0 0 0 0>
  <SUBST Subst1 1 -250 -260 -30 24 0 0 "4.4" 1 "0.79 mm" 1 "32 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Eqn MicrostripParameters 1 -250 -30 -31 17 0 0 "Zwidth=1.487e-3" 1 "yes" 0>
  <Eqn Eqn9 1 620 -320 -31 17 0 0 "phase_shift_optim=max(abs(180-phase(Vfb.v)),5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn8 1 620 -220 -31 17 0 0 "fb_gain_optim=max(Vfb.v/Vamp1.v,5000e6:6000e6)" 1 "yes" 0>
  <Eqn Eqn3 1 620 -40 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn5 1 620 -120 -31 17 0 0 "fb_gain=Vfb.v/Vamp1.v" 1 "yes" 0>
  <Eqn Eqn11 1 870 -100 -31 17 0 0 "output_gain=dB(Vout.v/Vsource.v)" 1 "yes" 0>
  <.AC AC1 1 1240 -200 0 51 0 0 "lin" 1 "2.5 GHz" 1 "10 GHz" 1 "40" 1 "no" 0>
  <Eqn Eqn14 1 620 50 -31 17 0 0 "two_pass_loop_gain=Vfb_amp.v/Vsource.v" 1 "yes" 0>
  <L L8 1 1710 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <GND *25 5 1840 -700 0 0 0 0>
  <MLIN MS32 1 1840 -740 15 -26 0 1 "Subst1" 1 "2.5 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <L L9 1 1880 -860 -26 10 0 0 "0.7 nH" 1 "" 0>
  <C C11 1 1790 -860 -26 17 0 0 "4.7pF" 1 "" 0 "neutral" 0>
  <C C12 1 1960 -860 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MCOUPLED MS34 1 100 -550 -137 -26 1 1 "Subst1" 1 "Zwidth" 1 "6 mm" 1 "0.38 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
  <.SP SP6 0 -410 520 0 88 0 0 "lin" 1 "1 GHz" 1 "15 GHz" 1 "30" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn13 0 -400 420 -31 17 0 0 "output_dB=dB(S[2,1])" 1 "yes" 0>
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
  <GND *2 5 0 460 0 0 0 0>
  <GND *4 5 110 430 0 0 0 0>
  <Pac P1 1 0 430 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <SPfile X2 1 110 400 -10 -44 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *20 5 260 50 0 0 0 1>
  <Pac P18 0 230 50 -26 -78 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <R R5 1 220 130 -26 -55 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *24 5 250 130 0 0 0 1>
  <MLIN MS10 1 190 260 15 -26 0 1 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
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
  <.SW SW1 0 1180 640 0 88 0 0 "AC1" 1 "lin" 1 "C1" 1 "2 pF" 1 "30 pF" 1 "5" 1>
  <MLIN MS45 2 260 400 -26 20 0 0 "Sub1" 0 "0.47 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SW SW2 1 1340 640 0 88 0 0 "AC1" 1 "lin" 1 "R1" 1 "5" 1 "500" 1 "2" 1>
  <R R4 1 1490 430 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 5 1490 460 0 0 0 0>
  <GND * 5 1390 430 0 0 0 0>
  <SPfile X4 1 1390 400 -12 -40 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <L L14 1 1140 400 -26 10 1 2 "0.2 nH" 1 "" 0>
  <C C17 1 1210 400 -26 17 0 0 "10 pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn15 1 950 260 -31 17 0 0 "R2=500-R1" 1 "yes" 0>
  <L L32 1 1280 510 -26 10 1 2 "0.2 nH" 1 "" 0>
  <L L33 2 4340 30 -26 10 0 0 "0.7 nH" 1 "" 0>
  <MLIN MS76 1 4500 30 -26 -95 0 2 "Subst1" 1 "Zwidth" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS77 1 4500 140 -26 15 1 2 "Subst1" 1 "Zwidth" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R12 2 4420 30 -26 15 0 0 "R2" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L34 1 4570 30 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R13 1 4650 30 -26 15 0 0 "R2" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L35 2 4340 140 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R14 2 4420 140 -26 15 0 0 "R1" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L36 1 4570 140 -26 10 0 0 "0.7 nH" 1 "" 0>
  <R R15 1 4650 140 -26 15 0 0 "R1" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.Opt Opt1 0 1590 630 0 51 0 0 "Sim=AC1" 0 "DE=3|50|2|20|0.85|1|3|1e-6|10|100" 0 "Var=C1|yes|3.7e-12|0.3e-12|4.7e-12|LIN_DOUBLE" 0 "Var=L1|yes|0.0135|1e-3|20e-3|LIN_DOUBLE" 0 "Var=L2|yes|0.00294|1e-3|20e-3|LIN_DOUBLE" 0 "Goal=fb_gain|MAX|1" 0 "Goal=phase_shift|GE|300" 0>
  <MLIN MS72 1 1290 400 -26 20 0 0 "Sub1" 0 "Zwidth" 1 "3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS75 2 1050 400 -26 20 0 0 "Sub1" 0 "Zwidth" 1 "3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <C C25 1 1350 510 -26 17 0 0 "10 pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <-10 1390 100 1390 "" 0 0 0 "">
  <420 1390 490 1390 "" 0 0 0 "">
  <270 1390 310 1390 "" 0 0 0 "">
  <160 1390 210 1390 "" 0 0 0 "">
  <1120 1370 1230 1370 "" 0 0 0 "">
  <1290 1370 1400 1370 "" 0 0 0 "">
  <310 1390 360 1390 "" 0 0 0 "">
  <310 1310 310 1390 "" 0 0 0 "">
  <430 1230 490 1230 "" 0 0 0 "">
  <310 1230 310 1250 "" 0 0 0 "">
  <310 1230 370 1230 "" 0 0 0 "">
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
  <3110 1660 3110 1710 "" 0 0 0 "">
  <3110 1660 3190 1660 "" 0 0 0 "">
  <3290 1660 3290 1710 "" 0 0 0 "">
  <3430 1660 3430 1710 "" 0 0 0 "">
  <3290 1660 3330 1660 "" 0 0 0 "">
  <3250 1660 3290 1660 "" 0 0 0 "">
  <3390 1660 3430 1660 "" 0 0 0 "">
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
  <0 400 80 400 "Vsource" -60 350 23 "">
  <140 400 190 400 "Vamp1" 130 310 13 "">
  <190 50 190 130 "" 0 0 0 "">
  <190 50 200 50 "" 0 0 0 "">
  <190 130 190 230 "Vout" 120 60 40 "">
  <190 290 190 400 "" 0 0 0 "">
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
  <190 400 230 400 "" 0 0 0 "">
  <1420 400 1490 400 "Vfb_amp" 1480 350 20 "">
  <1170 400 1180 400 "" 0 0 0 "">
  <1240 400 1250 400 "" 0 0 0 "">
  <1310 510 1320 510 "" 0 0 0 "">
  <1250 400 1250 510 "" 0 0 0 "">
  <1380 460 1380 510 "" 0 0 0 "">
  <1340 460 1380 460 "" 0 0 0 "">
  <1340 400 1360 400 "" 0 0 0 "">
  <1340 400 1340 460 "" 0 0 0 "">
  <4370 30 4390 30 "" 0 0 0 "">
  <4530 30 4540 30 "" 0 0 0 "">
  <4450 30 4470 30 "" 0 0 0 "">
  <4600 30 4620 30 "" 0 0 0 "">
  <4530 140 4540 140 "" 0 0 0 "">
  <4670 0 4670 10 "" 0 0 0 "">
  <4660 10 4670 10 "" 0 0 0 "">
  <4450 140 4470 140 "" 0 0 0 "">
  <4370 140 4390 140 "" 0 0 0 "">
  <4540 140 4580 140 "" 0 0 0 "">
  <4600 140 4620 140 "" 0 0 0 "">
  <4310 30 4310 140 "" 0 0 0 "">
  <4680 30 4680 140 "" 0 0 0 "">
  <1080 400 1110 400 "" 0 0 0 "">
  <290 400 1020 400 "" 0 0 0 "">
  <1320 400 1340 400 "Vfb" 1330 330 11 "">
  <1250 400 1260 400 "" 0 0 0 "">
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
  <Rect 4560 632 499 222 3 #c0c0c0 1 00 1 2.75e+09 2e+09 2e+10 1 0.25 0.05 0.46655 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"S[16,15]" #0000ff 0 3 0 0 0>
	<"S[17,15]" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1880 770 570 338 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_shift" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 1880 380 562 331 3 #c0c0c0 1 00 1 2.5e+09 1e+09 1e+10 1 -1.70613 5 25 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"fb_gain" #0000ff 0 3 0 0 0>
	<"Vfb_amp.v" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 1880 12 590 323 3 #c0c0c0 1 00 1 2.5e+09 1e+09 1e+10 1 0 10 10 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"two_pass_loop_gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 2580 181 508 211 3 #c0c0c0 1 00 1 2e+09 2e+09 1e+10 0 0 0.5 2 1 -1 1 1 315 0 225 "" "" "" "">
	<"Vout.v" #aaaaff 0 3 0 0 0>
	<"Vamp1.v" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect -420 340 240 160 3 #c0c0c0 1 00 1 0 5e+09 1.5e+10 0 0 5 15 1 -1 1 1 315 0 225 "" "" "" "">
	<"output_dB" #ff0000 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Rectangle -70 1130 1070 630 #000000 0 1 #c0c0c0 1 0>
  <Rectangle -1390 -1110 6360 4200 #000000 0 1 #c0c0c0 1 0>
  <Text 4160 1440 12 #000000 0 "Bessel low-pass filter \n 5 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Text 3840 360 12 #000000 0 "Wilkinson requires a precision microwave resistor.">
  <Text 3850 300 12 #000000 0 "50% Tee splitter for output | feedback loop\n50 -> 100 -> 1/4 λ 70.7 -> 50">
  <Text 3450 1840 12 #000000 0 "Bessel high-pass filter \n 6 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
  <Rectangle -530 -400 3320 1380 #000000 0 1 #c0c0c0 1 0>
  <Text 670 60 12 #000000 0 "Unhelpful because of phase">
  <Text 1170 -340 12 #000000 0 "val.V = peak DC voltage\nval.v = peak AC voltage\n\n">
  <Text 1850 -950 12 #000000 0 "6-7 GHz shift, good resonance">
  <Text 60 890 12 #000000 0 "Using higher-impedance lines raises frequency">
  <Text 800 880 12 #000000 0 "Adding 1 pF in parallel with the varactor broadens the FB gain.">
  <Text 800 910 12 #000000 0 "0.2 nH corresponds to a 0402 package.\n">
  <Text 50 930 12 #000000 0 "A short length of wide (2.5 mm) microstrip completely destroys the FB gain">
  <Text 50 840 12 #000000 0 "Adding pure inductance to ground (0.2 nH) raises frequency.">
  <Text 40 780 12 #000000 0 "4mm long microstrip to ground: Fres increases with width >10 mm.\nWhy's that?">
  <Text 30 -680 12 #000000 0 "Replacing DC block cap with a microstrip gap \nwith Zwidth and a 0.38 mm gap destroys the FB gain.">
  <Text 0 -610 12 #000000 0 "Coupler also kills gain.\n">
  <Text 1280 -770 12 #000000 0 "Varactor\n">
  <Text 510 -880 12 #000000 0 "5.5 GHz λ/4 50Z--(?Z)>100Z--(70Z)>50Z \ntransformer. Smoothens Vout power a bit,\nand sharpens resonance at Vfb\nPut immediately at output of Vamp\nWorks really well, recommended, but too long for 8 GHz\n">
  <Text 530 -620 12 #000000 0 "Sharper res, higher FB, and 8.5 GHz max fb\nSlightly mismatched at 7 GHz - only 75 deg phase shift\nToo much power through FB, zero at Vout">
  <Text 630 -440 12 #000000 0 "Just right.">
  <Text 2450 -990 12 #000000 0 "Basically perfect\n">
  <Text 2820 -840 12 #000000 0 "Also works, sharper resonance\nPrefer 1.5x4 though\n">
  <Text 2270 -600 12 #000000 0 "Contrary to previous belief, the chosen varactor C varies from \n2 to 40 pF.">
  <Text 3240 -840 12 #000000 0 "PIN diode also doesn't have the dynamic range in that phase-shifter capacity">
  <Text -60 660 12 #000000 0 "The way this is teed doesn't seem to make a difference.\n">
  <Arrow 120 630 30 -210 20 8 #000000 0 1 0>
  <Text -70 200 12 #000000 0 "This length doesn't \naffect the FB loop at all!">
  <Text 1810 -600 12 #000000 0 "Fhigh = 0.5 pF\nFlow = 4 pF">
  <Text 4010 -450 12 #000000 0 "Works pretty well, but PIN inductance not modelled">
  <Text 3450 -370 12 #000000 0 "Good dynamic range. V. good.">
  <Text 1500 760 12 #000000 0 "Rather than do a transient sim of the oscillation,\nthis second amp represents the first amp on the second\nFB loop around\n">
  <Text 4460 -340 12 #000000 0 "Phase shift is fine, but filter isn't">
</Paintings>
