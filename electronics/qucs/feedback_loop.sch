<Qucs Schematic >
<Properties>
  <View=-60,175,1334,1152,1.21,100,270>
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
  <L L2 1 790 390 -26 10 0 0 "L_1 nH" 1 "" 0>
  <Eqn Eqn1 1 630 210 -31 17 0 0 "cap_1=1" 1 "yes" 0>
  <C C2 1 870 480 17 -26 0 1 "1 pF" 1 "" 0 "neutral" 0>
  <L L1 1 950 390 -26 10 0 0 "L_1 nH" 1 "" 0>
  <L L3 1 1090 390 -26 10 0 0 "L_1 nH" 1 "" 0>
  <C C4 1 1020 480 17 -26 0 1 "1 pF" 1 "" 0 "neutral" 0>
  <GND * 5 870 510 0 0 0 0>
  <GND * 5 1020 510 0 0 0 0>
  <Eqn Eqn2 1 750 210 -31 17 0 0 "L_1=1" 1 "yes" 0>
  <Pac P1 1 530 420 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 1190 420 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "8 GHz" 0 "26.85" 0>
  <C C1 1 710 390 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <820 390 870 390 "" 0 0 0 "">
  <870 390 870 450 "" 0 0 0 "">
  <870 390 920 390 "" 0 0 0 "">
  <980 390 1020 390 "" 0 0 0 "">
  <1020 390 1060 390 "" 0 0 0 "">
  <1020 390 1020 450 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
