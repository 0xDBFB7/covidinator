<Qucs Schematic >
<Properties>
  <View=-535,-100,2835,862,1.1,672,52>
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
  <C C2 0 1710 410 -26 17 0 0 "4.7 pF" 1 "" 0 "neutral" 0>
  <MLIN MS3 0 1820 410 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND *3 4 1760 570 0 0 0 0>
  <GND * 4 1650 600 0 0 0 0>
  <Pac P3 0 1650 570 18 -26 0 1 "3" 1 "500 Ohm" 1 "0 dBm" 0 "3 GHz" 0 "26.85" 0>
  <Eqn Eqn4 0 1720 300 -31 17 0 0 "y=abs(fft(V1.Vt))" 1 "yes" 0>
  <.TR TR1 0 1640 690 0 73 0 0 "lin" 1 "0" 1 "1 us" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <MLIN MS2 1 660 380 -26 15 0 0 "Subst1" 1 "2.778 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SPfile X1 0 1760 540 249 -83 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3_v01_2-26G_3V_20mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND *2 5 420 440 0 0 0 0>
  <GND *4 5 530 410 0 0 0 0>
  <Pac P1 1 420 410 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <.AC AC1 1 300 660 0 44 0 0 "lin" 1 "2.5 GHz" 1 "20 GHz" 1 "40" 1 "no" 0>
  <SPfile X2 1 530 380 -1016 3 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 5 880 460 0 0 0 0>
  <C C1 1 790 380 -26 17 0 0 "2 pF" 1 "" 0 "neutral" 0>
  <Pac P4 1 1210 410 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
  <GND * 5 1210 440 0 0 0 0>
  <C C3 1 1000 380 -26 17 0 0 "2 pF" 1 "" 0 "neutral" 0>
  <MLIN MS4 1 880 430 15 -26 0 1 "Subst1" 1 "2.778 mm" 1 "10 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST Subst1 1 630 650 -30 24 0 0 "4.4" 1 "1.6 mm" 1 "32 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Eqn Eqn3 1 990 100 -31 17 0 0 "phase_shift=abs(180-phase(Vfb.v))" 1 "yes" 0>
  <Eqn Eqn5 1 990 180 -31 17 0 0 "fb_gain=Vfb.v/Vsource.v" 1 "yes" 0>
  <SPfile X3 1 620 170 -1105 5 0 0 "/home/arthurdent/Projects/covidinator/electronics/qucs/s2p_CE3520K3/CE3520K3v02n_2-26G_2V_10mA.txt" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 5 620 200 0 0 0 0>
  <GND *5 5 700 240 0 0 0 0>
  <Pac P5 1 700 200 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1" 0 "26.85" 0>
</Components>
<Wires>
  <1740 410 1790 410 "" 0 0 0 "">
  <1850 410 1900 410 "V1" 1890 380 1 "">
  <1620 410 1680 410 "" 0 0 0 "">
  <1620 410 1620 540 "" 0 0 0 "">
  <1620 540 1650 540 "" 0 0 0 "">
  <1900 410 1900 540 "" 0 0 0 "">
  <1790 540 1900 540 "" 0 0 0 "">
  <1650 540 1730 540 "" 0 0 0 "">
  <560 380 570 380 "" 0 0 0 "">
  <420 380 500 380 "Vsource" 360 330 23 "">
  <690 380 760 380 "" 0 0 0 "">
  <820 380 880 380 "" 0 0 0 "">
  <1030 380 1210 380 "Vfb" 1120 340 72 "">
  <880 380 970 380 "" 0 0 0 "">
  <570 380 630 380 "Vamp1" 640 350 30 "">
  <880 380 880 400 "" 0 0 0 "">
  <570 170 570 380 "" 0 0 0 "">
  <570 170 590 170 "" 0 0 0 "">
  <650 170 700 170 "" 0 0 0 "">
  <700 170 730 170 "Vamp2" 750 140 14 "">
  <700 230 700 240 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>