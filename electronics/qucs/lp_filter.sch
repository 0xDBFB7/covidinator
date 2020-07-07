<Qucs Schematic >
<Properties>
  <View=0,102,1434,1494,0.909091,270,200>
  <Grid=10,10,1>
  <DataSet=lp_filter.dat>
  <DataDisplay=lp_filter.dpl>
  <OpenDisplay=1>
  <Script=lp_filter.m>
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
  <Pac P1 1 380 660 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 5 380 690 0 0 0 0>
  <L L1 1 490 580 -26 10 0 0 "0.5 nH" 1 "" 0>
  <GND *2 5 560 690 0 0 0 0>
  <L L2 1 630 580 -26 10 0 0 "1.5nH" 1 "" 0>
  <GND *3 5 700 690 0 0 0 0>
  <L L3 1 770 580 -26 10 0 0 "0.5nH" 1 "" 0>
  <Pac P2 1 840 660 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *4 5 840 690 0 0 0 0>
  <Eqn Eqn1 1 610 770 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <C C1 1 560 660 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <C C2 1 700 660 17 -26 0 1 "0.5 pF" 1 "" 0 "neutral" 0>
  <.SP SP1 1 390 760 0 73 0 0 "log" 1 "1" 1 "25 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <380 580 380 630 "" 0 0 0 "">
  <380 580 460 580 "" 0 0 0 "">
  <560 580 560 630 "" 0 0 0 "">
  <700 580 700 630 "" 0 0 0 "">
  <840 580 840 630 "" 0 0 0 "">
  <560 580 600 580 "" 0 0 0 "">
  <520 580 560 580 "" 0 0 0 "">
  <700 580 740 580 "" 0 0 0 "">
  <660 580 700 580 "" 0 0 0 "">
  <800 580 840 580 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 720 760 12 #000000 0 "Butterworth low-pass filter \n 11 GHz cutoff, tee-type, \n impedance matching 50 Ohm">
</Paintings>
