<Qucs Schematic >
<Properties>
  <View=-420,-47,1104,1227,0.909113,310,107>
  <Grid=10,10,1>
  <DataSet=filter.dat>
  <DataDisplay=filter.dpl>
  <OpenDisplay=1>
  <Script=filter.m>
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
  <Pac P1 1 -230 610 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 5 -230 640 0 0 0 0>
  <MLIN MS1 1 -170 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 -120 330 0 0 0 2>
  <MLIN MS2 1 -120 360 15 -15 0 1 "Sub1" 1 "867.9 um" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 -80 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 5 -30 330 0 0 0 2>
  <MLIN MS4 1 -30 360 15 -15 0 1 "Sub1" 1 "6.033 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 10 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SP1 1 -220 740 0 73 0 0 "lin" 1 "550 MHz" 1 "55 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub1 1 10 780 -30 24 0 0 "4.5" 1 "700 um" 1 "12.5 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn1 1 160 840 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <MLIN MS6 1 180 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *5 5 230 330 0 0 0 2>
  <MLIN MS7 1 230 360 15 -15 0 1 "Sub1" 1 "867.9 um" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 270 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *6 5 320 330 0 0 0 2>
  <MLIN MS9 1 320 360 15 -15 0 1 "Sub1" 1 "6.033 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS10 1 360 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS11 1 490 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *7 5 540 330 0 0 0 2>
  <MLIN MS12 1 540 360 15 -15 0 1 "Sub1" 1 "867.9 um" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS13 1 580 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *8 5 630 330 0 0 0 2>
  <MLIN MS14 1 630 360 15 -15 0 1 "Sub1" 1 "6.033 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS15 1 670 460 -26 15 0 0 "Sub1" 1 "1.33 mm" 1 "3.447 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 780 490 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *4 5 780 520 0 0 0 0>
</Components>
<Wires>
  <-230 460 -230 580 "" 0 0 0 "">
  <-230 460 -200 460 "" 0 0 0 "">
  <-140 460 -120 460 "" 0 0 0 "">
  <-120 460 -110 460 "" 0 0 0 "">
  <-120 390 -120 460 "" 0 0 0 "">
  <-50 460 -30 460 "" 0 0 0 "">
  <-30 460 -20 460 "" 0 0 0 "">
  <-30 390 -30 460 "" 0 0 0 "">
  <210 460 230 460 "" 0 0 0 "">
  <230 460 240 460 "" 0 0 0 "">
  <230 390 230 460 "" 0 0 0 "">
  <300 460 320 460 "" 0 0 0 "">
  <320 460 330 460 "" 0 0 0 "">
  <320 390 320 460 "" 0 0 0 "">
  <520 460 540 460 "" 0 0 0 "">
  <540 460 550 460 "" 0 0 0 "">
  <540 390 540 460 "" 0 0 0 "">
  <610 460 630 460 "" 0 0 0 "">
  <630 460 640 460 "" 0 0 0 "">
  <630 390 630 460 "" 0 0 0 "">
  <700 460 780 460 "" 0 0 0 "">
  <390 460 460 460 "" 0 0 0 "">
  <40 460 150 460 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 130 740 12 #000000 0 "Quarter wave bandpass filter \n Bessel 5.5 GHz...15 GHz \n Impedance matching 50 Ohm">
</Paintings>
