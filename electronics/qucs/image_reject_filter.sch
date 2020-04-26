<Qucs Schematic >
<Properties>
  <View=-420,-508,2164,2346,0.385564,50,129>
  <Grid=10,10,1>
  <DataSet=image_reject_filter.dat>
  <DataDisplay=image_reject_filter.dpl>
  <OpenDisplay=1>
  <Script=image_reject_filter.m>
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
  <SUBST Sub1 1 190 790 -30 24 0 0 "4.5" 1 "790 um" 1 "32 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn1 0 340 850 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <MLIN MS6 0 380 370 15 -15 0 1 "Sub1" 1 "9.176 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *4 5 380 320 0 0 0 2>
  <MLIN MS7 0 500 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 0 80 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS11 0 170 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "3.321 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS12 0 380 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "9.176 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS5 0 280 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P1 0 -190 620 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 4 -190 650 0 0 0 0>
  <MLIN MS1 0 -140 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS8 0 -30 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "0.560 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS2 0 -30 380 15 -15 0 1 "Sub1" 1 "560.7 um" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 -30 320 0 0 0 2>
  <MLIN MS4 0 170 370 15 -15 0 1 "Sub1" 1 "3.321 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 5 170 320 0 0 0 2>
  <.SP SP1 0 -40 750 0 85 0 0 "lin" 1 "1000 MHz" 1 "20 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <MLIN MS13 0 1160 370 15 -15 0 1 "Sub1" 1 "9.176 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *6 5 1160 320 0 0 0 2>
  <MLIN MS14 0 1280 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS15 0 860 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS16 0 950 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "3.321 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS17 0 1160 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "9.176 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS18 0 1060 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS20 0 750 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "0.560 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS21 0 750 380 15 -15 0 1 "Sub1" 1 "560.7 um" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *7 5 750 320 0 0 0 2>
  <MLIN MS22 0 950 370 15 -15 0 1 "Sub1" 1 "3.321 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *8 5 950 320 0 0 0 2>
  <MLIN MS23 0 1820 370 15 -15 0 1 "Sub1" 1 "9.176 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *9 5 1820 320 0 0 0 2>
  <MLIN MS24 0 1940 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS25 0 1520 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS26 0 1610 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "3.321 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS27 0 1820 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "9.176 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS28 0 1720 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS30 0 1410 380 15 -15 0 1 "Sub1" 1 "560.7 um" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *10 5 1410 320 0 0 0 2>
  <MLIN MS31 0 1610 370 15 -15 0 1 "Sub1" 1 "3.321 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *11 5 1610 320 0 0 0 2>
  <MTEE MS29 0 1410 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "0.560 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <Pac P2 0 2030 530 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *5 4 2020 600 0 0 0 0>
  <GND *12 5 220 1720 0 0 0 0>
  <MLIN MS32 1 280 1540 -26 15 0 0 "Sub1" 1 "741.9 um" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS33 1 330 1440 15 -15 0 1 "Sub1" 1 "1.703 mm" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS34 1 370 1540 -26 15 0 0 "Sub1" 1 "741.9 um" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS35 1 420 1440 15 -15 0 1 "Sub1" 1 "4.537 mm" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS36 1 460 1540 -26 15 0 0 "Sub1" 1 "741.9 um" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS37 1 510 1440 15 -15 0 1 "Sub1" 1 "1.703 mm" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS38 1 550 1540 -26 15 0 0 "Sub1" 1 "741.9 um" 1 "8.706 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P4 1 630 1690 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *13 5 630 1720 0 0 0 0>
  <.SP SP2 1 230 1820 0 77 0 0 "lin" 1 "0 Hz" 1 "0 Hz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn2 1 610 1920 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P3 1 220 1690 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
</Components>
<Wires>
  <380 320 380 340 "" 0 0 0 "">
  <410 470 470 470 "" 0 0 0 "">
  <380 400 380 440 "" 0 0 0 "">
  <110 470 140 470 "" 0 0 0 "">
  <310 470 350 470 "" 0 0 0 "">
  <200 470 250 470 "" 0 0 0 "">
  <-190 470 -190 590 "" 0 0 0 "">
  <-190 470 -170 470 "" 0 0 0 "">
  <-110 470 -60 470 "" 0 0 0 "">
  <0 470 50 470 "" 0 0 0 "">
  <-30 410 -30 440 "" 0 0 0 "">
  <-30 320 -30 350 "" 0 0 0 "">
  <170 400 170 440 "" 0 0 0 "">
  <170 320 170 340 "" 0 0 0 "">
  <1160 320 1160 340 "" 0 0 0 "">
  <1190 470 1250 470 "" 0 0 0 "">
  <1160 400 1160 440 "" 0 0 0 "">
  <890 470 920 470 "" 0 0 0 "">
  <1090 470 1130 470 "" 0 0 0 "">
  <980 470 1030 470 "" 0 0 0 "">
  <780 470 830 470 "" 0 0 0 "">
  <750 410 750 440 "" 0 0 0 "">
  <750 320 750 350 "" 0 0 0 "">
  <950 400 950 440 "" 0 0 0 "">
  <950 320 950 340 "" 0 0 0 "">
  <530 470 720 470 "" 0 0 0 "">
  <1820 320 1820 340 "" 0 0 0 "">
  <1850 470 1910 470 "" 0 0 0 "">
  <1820 400 1820 440 "" 0 0 0 "">
  <1550 470 1580 470 "" 0 0 0 "">
  <1750 470 1790 470 "" 0 0 0 "">
  <1640 470 1690 470 "" 0 0 0 "">
  <1410 320 1410 350 "" 0 0 0 "">
  <1610 400 1610 440 "" 0 0 0 "">
  <1610 320 1610 340 "" 0 0 0 "">
  <1410 410 1410 440 "" 0 0 0 "">
  <1310 470 1380 470 "" 0 0 0 "">
  <1440 470 1490 470 "" 0 0 0 "">
  <2020 560 2030 560 "" 0 0 0 "">
  <2020 560 2020 600 "" 0 0 0 "">
  <1970 470 2030 470 "" 0 0 0 "">
  <2030 470 2030 500 "" 0 0 0 "">
  <220 1540 220 1660 "" 0 0 0 "">
  <220 1540 250 1540 "" 0 0 0 "">
  <630 1540 630 1660 "" 0 0 0 "">
  <580 1540 630 1540 "" 0 0 0 "">
  <310 1540 330 1540 "" 0 0 0 "">
  <330 1540 340 1540 "" 0 0 0 "">
  <330 1470 330 1540 "" 0 0 0 "">
  <400 1540 420 1540 "" 0 0 0 "">
  <420 1540 430 1540 "" 0 0 0 "">
  <420 1470 420 1540 "" 0 0 0 "">
  <490 1540 510 1540 "" 0 0 0 "">
  <510 1540 520 1540 "" 0 0 0 "">
  <510 1470 510 1540 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 310 750 12 #000000 0 "Quarter wave bandpass filter \n Bessel 6 GHz...12 GHz \n Impedance matching 50 Ohm">
  <Text 580 1820 12 #000000 0 "Quarter wave bandpass filter \n Butterworth 0 Hz...5.5 GHz \n Impedance matching 50 Ohm">
</Paintings>
