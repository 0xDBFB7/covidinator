<Qucs Schematic >
<Properties>
  <View=0,-515,2435,800,0.751315,94,0>
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
  <.DC DC1 0 430 260 0 51 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <L L1 1 660 -110 -26 10 1 2 "1 nH" 1 "" 0>
  <L L2 1 720 -110 -26 10 1 2 "1 nH" 1 "" 0>
  <L L3 1 690 30 10 -26 1 3 "0.7 nH" 1 "" 0>
  <GND *1 5 690 60 0 0 0 0>
  <GND *2 5 840 -50 0 0 0 0>
  <GND *3 5 520 -50 0 0 0 0>
  <C C1 1 690 -40 17 -26 0 1 "C2" 1 "" 0 "neutral" 0>
  <Pac P1 1 520 -80 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "5 GHz" 0 "26.85" 0>
  <Pac P2 1 840 -80 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "5 GHz" 0 "26.85" 0>
  <Eqn Eqn2 0 1310 -240 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <.AC AC1 0 230 230 0 51 0 0 "lin" 1 "4 GHz" 1 "4.01 GHz" 1 "2" 1 "no" 0>
  <.SP SP1 1 1090 -250 0 88 0 0 "log" 1 "3 GHz" 1 "15 GHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <.SW SW1 1 690 200 0 88 0 0 "SP1" 1 "lin" 1 "C2" 1 "2 pF" 1 "30 pF" 1 "5" 1>
  <Eqn Eqn1 0 1140 50 -31 17 0 0 "phase_shifter_shift=abs(180-phase(Vps.v))" 1 "yes" 0>
</Components>
<Wires>
  <690 -110 690 -70 "" 0 0 0 "">
  <690 -10 690 0 "" 0 0 0 "">
  <520 -110 630 -110 "" 0 0 0 "">
  <750 -110 840 -110 "Vps" 840 -140 55 "">
</Wires>
<Diagrams>
  <Rect 1020 388 383 198 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S[2,1]" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
