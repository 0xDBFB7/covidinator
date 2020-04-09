<Qucs Schematic >
<Properties>
  <View=-84,-435,1461,234,2.85312,2439,0>
  <Grid=10,10,1>
  <DataSet=global.dat>
  <DataDisplay=global.dpl>
  <OpenDisplay=1>
  <Script=global.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID -20 -16 SUB>
  <Line -20 20 40 0 #000080 2 1>
  <Line 20 20 0 -40 #000080 2 1>
  <Line -20 -20 40 0 #000080 2 1>
  <Line -20 20 0 -40 #000080 2 1>
</Symbol>
<Components>
  <Pac P1 0 30 -260 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *1 4 30 -230 0 0 0 0>
  <MLIN MSTC1 0 120 -310 -26 15 0 0 "MG587" 1 "1.54626 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn EqnTC1 0 170 -110 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <GND *2 4 250 -230 0 0 0 0>
  <SUBST MG587 1 420 -270 -30 24 0 0 "4.2" 1 "0.79 mm" 1 "34.29 um" 1 "0" 1 "2.43902e-08" 1 "0" 1>
  <.SP SPTC1 0 -30 -170 0 75 0 0 "log" 1 "0.8 GHz" 1 "80 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P2 0 250 -280 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <.TR TR1 1 770 40 0 75 0 0 "lin" 1 "0" 1 "3e-9" 1 "10000" 1 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <C C1 1 820 -200 -70 -26 0 3 "1 pF" 1 "" 0 "neutral" 0>
  <L L2 2 900 -170 -27 -57 0 0 "1 nH" 1 "" 0>
  <GND *5 5 970 -330 0 0 0 2>
  <C C2 2 970 -300 -83 -26 0 3 "0.1 pF" 1 "0" 0 "neutral" 0>
  <GND * 5 1080 -170 0 0 0 0>
  <C C3 1 1250 -300 -70 -26 1 1 "1 pF" 1 "" 0 "neutral" 0>
  <GND * 5 1250 -330 0 0 0 2>
  <Vpulse V1 1 1280 -200 68 -55 0 1 "0 V" 1 "10 V" 1 "0.1e-9" 1 "1 ms" 1 "1 ns" 0 "1 ns" 0>
  <GND *3 5 1280 -170 0 0 0 0>
  <R R1 1 1140 -230 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L3 1 1220 -220 -26 10 0 0 "1 nH" 1 "" 0>
  <L L1 2 900 -230 -27 -57 0 0 "0.1 nH" 1 "" 0>
</Components>
<Wires>
  <30 -310 90 -310 "" 0 0 0 "">
  <30 -310 30 -290 "" 0 0 0 "">
  <250 -250 250 -230 "" 0 0 0 "">
  <150 -310 250 -310 "" 0 0 0 "">
  <820 -170 870 -170 "" 0 0 0 "">
  <930 -170 1050 -170 "Vgate" 970 -200 8 "0">
  <1050 -200 1050 -170 "" 0 0 0 "">
  <970 -230 1110 -230 "Vosc" 1040 -260 46 "">
  <970 -270 970 -230 "" 0 0 0 "">
  <1250 -270 1250 -230 "" 0 0 0 "">
  <1250 -230 1280 -230 "" 0 0 0 "">
  <1250 -230 1250 -220 "" 0 0 0 "">
  <1170 -230 1190 -230 "Vexcite" 1210 -260 8 "">
  <1190 -230 1190 -220 "" 0 0 0 "">
  <930 -230 970 -230 "" 0 0 0 "">
  <820 -230 870 -230 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text -20 110 12 #000000 0 "± 5 ohm tolerances are about ± 0.15 mm">
  <Text -10 60 12 #000000 0 "Microstrip impedance is relatively invariant with frequency,\ntrace thickness.">
</Paintings>
