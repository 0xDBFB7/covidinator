<Qucs Schematic >
<Properties>
  <View=0,-155,2435,800,0.620922,0,12>
  <Grid=10,10,1>
  <DataSet=phase_shifter.dat>
  <DataDisplay=phase_shifter.dpl>
  <OpenDisplay=1>
  <Script=phase_shifter.m>
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
  <L L1 1 630 -20 -26 10 1 2 "1 nH" 1 "" 0>
  <L L2 1 690 -20 -26 10 1 2 "1 nH" 1 "" 0>
  <L L3 1 660 120 10 -26 1 3 "0.2 nH" 1 "" 0>
  <GND *1 5 660 150 0 0 0 0>
  <R R1 1 810 10 15 -26 1 3 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND *2 5 810 40 0 0 0 0>
  <GND *3 5 490 40 0 0 0 0>
  <C C1 1 660 50 17 -26 0 1 "C2" 1 "" 0 "neutral" 0>
  <Pac P1 1 490 10 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "5 GHz" 0 "26.85" 0>
  <.SW SW1 1 800 270 0 88 0 0 "AC1" 1 "lin" 1 "C2" 1 "2 pF" 1 "30 pF" 1 "5" 1>
  <Eqn Eqn1 1 1490 40 -31 17 0 0 "phase_shifter_shift=abs(180-phase(Vps.v))" 1 "yes" 0>
  <.DC DC1 0 430 260 0 51 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 440 90 0 51 0 0 "lin" 1 "4 GHz" 1 "4.01 GHz" 1 "2" 1 "no" 0>
</Components>
<Wires>
  <660 -20 660 20 "" 0 0 0 "">
  <660 80 660 90 "" 0 0 0 "">
  <490 -20 600 -20 "" 0 0 0 "">
  <720 -20 810 -20 "Vps" 810 -50 55 "">
</Wires>
<Diagrams>
  <Rect 980 222 323 192 3 #c0c0c0 1 00 1 4e+09 2e+08 5e+09 1 -11.9133 100 237.292 1 -1 0.5 1 315 0 225 "" "" "" "">
	<"phase_shifter_shift" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
