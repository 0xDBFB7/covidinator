<Qucs Schematic >
<Properties>
  <View=-1050,-99,2144,2089,0.909158,881,5>
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
  <MLIN MS6 1 380 370 15 -15 0 1 "Sub1" 1 "9.176 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *4 5 380 320 0 0 0 2>
  <MLIN MS7 1 500 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 80 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS11 1 170 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "3.321 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS12 1 380 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "9.176 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS5 1 280 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS1 1 -140 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS8 1 -30 470 -26 15 0 2 "Sub1" 1 "1.324  mm" 1 "1.324 mm" 1 "0.560 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS2 1 -30 380 15 -15 0 1 "Sub1" 1 "560.7 um" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 -30 320 0 0 0 2>
  <MLIN MS4 1 170 370 15 -15 0 1 "Sub1" 1 "3.321 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 5 170 320 0 0 0 2>
  <Eqn Eqn1 1 344 845 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <GND *1 5 -186 645 0 0 0 0>
  <.SP SP1 1 -36 745 0 88 0 0 "lin" 1 "1000 MHz" 1 "20 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P1 1 -190 620 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *5 5 674 565 0 0 0 0>
  <Pac P2 1 680 500 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
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
  <-186 645 -186 650 "" 0 0 0 "">
  <-190 650 -186 650 "" 0 0 0 "">
  <530 470 680 470 "" 0 0 0 "">
  <674 530 680 530 "" 0 0 0 "">
  <674 530 674 565 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 310 750 12 #000000 0 "Quarter wave bandpass filter \n Bessel 6 GHz...12 GHz \n Impedance matching 50 Ohm">
</Paintings>
