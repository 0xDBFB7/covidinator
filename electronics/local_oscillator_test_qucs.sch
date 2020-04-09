<Qucs Schematic >
<Properties>
  <View=0,-310,800,1610,0.909095,97,0>
  <Grid=10,10,1>
  <DataSet=local_oscillator_test_qucs.dat>
  <DataDisplay=local_oscillator_test_qucs.dpl>
  <OpenDisplay=1>
  <Script=local_oscillator_test_qucs.m>
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
  <_MOSFET T1 1 460 -200 8 -26 0 0 "nfet" 0 "1.0 V" 1 "2e-5" 1 "0.0" 0 "0.6 V" 0 "0.0" 1 "0.0 Ohm" 0 "0.0 Ohm" 0 "0.0 Ohm" 0 "1e-14 A" 0 "1.0" 0 "1 um" 0 "1 um" 0 "0.0" 0 "0.1 um" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0 F" 0 "0.0 F" 0 "0.8 V" 0 "0.5" 0 "0.5" 0 "0.0" 0 "0.33" 0 "0.0 ps" 0 "0.0" 0 "0.0" 0 "1" 0 "600.0" 0 "0.0" 0 "1" 0 "1" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0 m" 0 "0.0 m" 0 "0.0" 0 "1.0" 0 "1.0" 0 "26.85" 0 "26.85" 0>
  <.SP SPTC1 1 242 221 0 73 0 0 "log" 1 "0.55 GHz" 1 "55 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST SubstTC1 1 642 111 -30 24 0 0 "4.35" 1 "0.79 mm" 1 "2.54 um" 1 "0" 1 "2.43902e-08" 1 "0" 1>
  <Eqn EqnTC1 1 432 231 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <Pac P1 1 282 101 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 462 101 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 5 282 131 0 0 0 0>
  <GND *2 5 462 131 0 0 0 0>
  <MLIN MSTC1 1 372 51 -60 -98 0 0 "SubstTC1" 1 "1.52372 mm" 1 "0 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <282 51 342 51 "" 0 0 0 "">
  <282 51 282 71 "" 0 0 0 "">
  <402 51 462 51 "" 0 0 0 "">
  <462 51 462 71 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
