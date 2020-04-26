<Qucs Schematic>
<Properties>
  <View=-124,-341,1770,1255,0.826452,24,402>
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
  <GND *1 4 30 -230 0 0 0 0>
  <MLIN MSTC1 0 120 -310 -26 15 0 0 "MG587" 1 "1.54626 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *2 4 250 -230 0 0 0 0>
  <SUBST MG587 1 420 -270 -30 24 0 0 "4.2" 1 "0.79 mm" 1 "34.29 um" 1 "0" 1 "2.43902e-08" 1 "0" 1>
  <SPfile X1 1 950 240 -293 -127 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn EqnTC1 1 920 520 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <Pac P2 1 1180 270 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 950 270 0 0 0 0>
  <GND * 5 1180 300 0 0 0 0>
  <GND * 5 690 300 0 0 0 0>
  <Pac P1 1 690 270 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <MLIN MSTC3 1 1060 240 -26 15 0 0 "MG587" 1 "1.54626 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SPTC1 1 720 460 0 75 0 0 "log" 1 "1 GHz" 1 "20 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SPfile X2 1 920 910 -293 -127 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.AC AC1 1 850 1000 0 44 0 0 "lin" 1 "1 GHz" 1 "10 GHz" 1 "19" 1 "no" 0>
  <MLIN MSTC2 1 840 240 -26 15 0 0 "MG587" 1 "1.54626 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <30 -310 90 -310 "" 0 0 0 "">
  <30 -310 30 -290 "" 0 0 0 "">
  <250 -250 250 -230 "" 0 0 0 "">
  <150 -310 250 -310 "" 0 0 0 "">
  <980 240 1030 240 "" 0 0 0 "">
  <1090 240 1180 240 "" 0 0 0 "">
  <870 240 920 240 "" 0 0 0 "">
  <690 240 810 240 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text -20 110 12 #000000 0 "± 5 ohm tolerances are about ± 0.15 mm">
  <Text -10 60 12 #000000 0 "Microstrip impedance is relatively invariant with frequency,\ntrace thickness.">
</Paintings>
