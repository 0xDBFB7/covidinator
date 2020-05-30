<Qucs Schematic >
<Properties>
  <View=0,-39,1074,781,1.21,0,0>
  <Grid=10,10,1>
  <DataSet=transient_test.dat>
  <DataDisplay=transient_test.dpl>
  <OpenDisplay=1>
  <Script=transient_test.m>
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
  <.TR TR1 1 290 530 0 71 0 0 "lin" 1 "0" 1 "10 ns" 1 "100" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <GND * 5 560 420 0 0 0 0>
  <SPICE X1 1 560 340 -26 -91 0 0 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" 1 "_net111,_net22,_net31,_net32" 0 "yes" 0 "none" 0>
  <L L1 1 530 100 -62 -26 0 3 "440 nH" 1 "" 0>
  <Vdc V1 1 390 100 18 -26 0 1 "1 V" 1>
  <GND *1 5 390 130 0 0 0 0>
  <MLIN MS1 1 600 130 -26 15 0 0 "Subst1" 1 "1.5 mm" 1 "100 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 5 590 370 0 0 0 0>
  <GND *3 5 530 370 0 0 0 0>
</Components>
<Wires>
  <560 400 560 420 "" 0 0 0 "">
  <390 70 530 70 "" 0 0 0 "">
  <530 130 530 310 "" 0 0 0 "">
  <590 310 660 310 "" 0 0 0 "">
  <660 130 660 310 "" 0 0 0 "">
  <630 130 660 130 "" 0 0 0 "">
  <530 130 570 130 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 30 180 12 #000000 0 "*BFP620 C B E1 E2\n.SUBCKT BFP620 111 22 31 32">
</Paintings>
