<Qucs Schematic >
<Properties>
  <View=0,-80,1613,1319,0.909091,0,0>
  <Grid=10,10,1>
  <DataSet=amplifier.dat>
  <DataDisplay=amplifier.dpl>
  <OpenDisplay=1>
  <Script=amplifier.m>
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
  <Pac P2 1 900 460 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 900 490 0 0 0 0>
  <GND *1 5 670 460 0 0 0 0>
  <.SP SP1 1 420 700 0 71 0 0 "lin" 1 "1 GHz" 1 "10 GHz" 1 "30" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P1 1 170 460 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 170 490 0 0 0 0>
  <SPfile X1 1 670 430 -26 -61 0 0 "/home/arthurdent/Projects/covidinator/electronics/models/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_30mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <L L2 1 790 340 10 -26 0 1 "1 nH" 1 "" 0>
  <L L1 1 790 400 10 -26 0 1 "1 nH" 1 "" 0>
  <GND * 5 790 310 0 0 0 0>
</Components>
<Wires>
  <700 430 790 430 "" 0 0 0 "">
  <170 430 420 430 "" 0 0 0 "">
  <420 430 420 460 "" 0 0 0 "">
  <420 430 640 430 "" 0 0 0 "">
  <790 430 900 430 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 950 1100 396 396 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1.1022 1 0 1 1 315 0 225 "" "" "" "">
	<"S[1,1]" #0000ff 0 3 0 0 0>
	  <Mkr 9.68966e+09 306 -497 3 0 0 1>
	  <Mkr 2.55172e+09 404 -162 3 0 0 1>
	  <Mkr 5.34483e+09 -113 -433 3 0 0 1>
	  <Mkr 6.89655e+09 114 -468 3 0 0 1>
  </Smith>
</Diagrams>
<Paintings>
  <Text 370 400 12 #000000 0 "Port 1">
  <Text 560 400 12 #000000 0 "Port 2">
</Paintings>
