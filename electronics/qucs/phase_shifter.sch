<Qucs Schematic >
<Properties>
  <View=0,-640,2435,723,0.909092,76,0>
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
  <L L1 1 660 -110 -26 10 1 2 "1 nH" 1 "" 0>
  <L L2 1 720 -110 -26 10 1 2 "1 nH" 1 "" 0>
  <L L3 1 690 30 10 -26 1 3 "0.7 nH" 1 "" 0>
  <GND *1 5 690 60 0 0 0 0>
  <GND *2 5 840 -50 0 0 0 0>
  <GND *3 5 520 -50 0 0 0 0>
  <C C1 1 690 -40 17 -26 0 1 "C2" 1 "" 0 "neutral" 0>
  <Pac P1 1 520 -80 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "5 GHz" 0 "26.85" 0>
  <Pac P2 1 840 -80 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "5 GHz" 0 "26.85" 0>
  <Eqn Eqn1 1 1140 50 -31 17 0 0 "phase_shifter_shift=abs(180-phase(Vps.v))" 1 "yes" 0>
  <.DC DC1 0 420 260 0 51 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 230 260 0 51 0 0 "lin" 1 "4 GHz" 1 "4.01 GHz" 1 "2" 1 "no" 0>
  <.SW SW1 1 620 260 0 88 0 0 "AC1" 1 "lin" 1 "C2" 1 "2 pF" 1 "30 pF" 1 "5" 1>
</Components>
<Wires>
  <690 -110 690 -70 "" 0 0 0 "">
  <690 -10 690 0 "" 0 0 0 "">
  <520 -110 630 -110 "" 0 0 0 "">
  <750 -110 840 -110 "Vps" 840 -140 55 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
