<Qucs Schematic >
<Properties>
  <View=-420,132,1104,1062,1.33104,160,4>
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
  <Pac P1 1 -50 620 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 5 -50 650 0 0 0 0>
  <MLIN MS1 1 10 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 60 340 0 0 0 2>
  <MLIN MS2 1 60 370 15 -15 0 1 "Sub1" 1 "560.7 um" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 100 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 5 150 340 0 0 0 2>
  <MLIN MS4 1 150 370 15 -15 0 1 "Sub1" 1 "3.321 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 190 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *4 5 240 340 0 0 0 2>
  <MLIN MS6 1 240 370 15 -15 0 1 "Sub1" 1 "9.176 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS7 1 280 470 -26 15 0 0 "Sub1" 1 "1.324 mm" 1 "3.926 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 360 620 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *5 5 360 650 0 0 0 0>
  <.SP SP1 1 -40 750 0 73 0 0 "lin" 1 "600 MHz" 1 "60 GHz" 1 "300" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Sub1 1 190 790 -30 24 0 0 "4.5" 1 "700 um" 1 "12.5 um" 1 "0" 1 "1e-10" 1 "0" 1>
  <Eqn Eqn1 1 340 850 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
</Components>
<Wires>
  <-50 470 -50 590 "" 0 0 0 "">
  <-50 470 -20 470 "" 0 0 0 "">
  <360 470 360 590 "" 0 0 0 "">
  <310 470 360 470 "" 0 0 0 "">
  <40 470 60 470 "" 0 0 0 "">
  <60 470 70 470 "" 0 0 0 "">
  <60 400 60 470 "" 0 0 0 "">
  <130 470 150 470 "" 0 0 0 "">
  <150 470 160 470 "" 0 0 0 "">
  <150 400 150 470 "" 0 0 0 "">
  <220 470 240 470 "" 0 0 0 "">
  <240 470 250 470 "" 0 0 0 "">
  <240 400 240 470 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 310 750 12 #000000 0 "Quarter wave bandpass filter \n Bessel 6 GHz...12 GHz \n Impedance matching 50 Ohm">
</Paintings>
