EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4050 2700 4500 2700
Wire Wire Line
	4050 3100 4150 3100
$Comp
L Connector:Test_Point TPOP1
U 1 1 5EE35A86
P 5200 2700
F 0 "TPOP1" V 5395 2772 50  0000 C CNN
F 1 "Voutput" V 5304 2772 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5400 2700 50  0001 C CNN
F 3 "~" H 5400 2700 50  0001 C CNN
F 4 "R" H 5200 2700 50  0001 C CNN "Spice_Primitive"
F 5 "100M" H 5200 2700 50  0001 C CNN "Spice_Model"
F 6 "N" H 5200 2700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    5200 2700
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C4
U 1 1 5EE408DC
P 4700 2700
F 0 "C4" V 4466 2750 45  0000 C CNN
F 1 "10 pF" V 4550 2750 45  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4700 2950 20  0001 C CNN
F 3 "" H 4700 2700 50  0001 C CNN
F 4 "" H 4808 2666 60  0000 L CNN "Field4"
F 5 "X" H 4700 2700 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 4700 2700 50  0001 C CNN "Spice_Model"
F 7 "Y" H 4700 2700 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 4700 2700 50  0001 C CNN "Spice_Lib_File"
	1    4700 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 2700 4800 2700
$Comp
L power:GND #PWR0106
U 1 1 5EE45343
P 3750 2300
F 0 "#PWR0106" H 3750 2300 30  0001 C CNN
F 1 "GND" H 3750 2230 30  0001 C CNN
F 2 "" H 3750 2300 50  0001 C CNN
F 3 "" H 3750 2300 50  0001 C CNN
	1    3750 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 1800 4500 1800
$Comp
L SparkFun-Capacitors:4.7UF0603 C3
U 1 1 5EE4533B
P 3950 2300
F 0 "C3" V 3716 2350 45  0000 C CNN
F 1 "100 nF" V 3800 2350 45  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3950 2550 20  0001 C CNN
F 3 "" H 3950 2300 50  0001 C CNN
F 4 "" H 4058 2266 60  0000 L CNN "Field4"
	1    3950 2300
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Test_Point TPSO1
U 1 1 5EE45334
P 4500 1800
F 0 "TPSO1" H 4558 1918 50  0000 L CNN
F 1 "Vsource" H 4558 1827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4700 1800 50  0001 C CNN
F 3 "~" H 4700 1800 50  0001 C CNN
F 4 "V" H 4500 1800 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20p 5p 1p 1 1)" H 4500 1800 50  0001 C CNN "Spice_Model"
F 6 "N" H 4500 1800 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4500 1800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L3
U 1 1 5EE07869
P 4050 2500
F 0 "L3" H 4103 2542 45  0000 L CNN
F 1 "440 nH" H 4103 2458 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4050 2750 20  0001 C CNN
F 3 "" H 4050 2500 50  0001 C CNN
F 4 "" H 4102 2416 60  0000 L CNN "Field4"
	1    4050 2500
	1    0    0    -1  
$EndComp
Text GLabel 4500 1800 2    50   Input ~ 0
nsource
$Comp
L power:GND #PWR0101
U 1 1 5EF81D29
P 4050 3100
F 0 "#PWR0101" H 4050 3100 30  0001 C CNN
F 1 "GND" H 4050 3030 30  0001 C CNN
F 2 "" H 4050 3100 50  0001 C CNN
F 3 "" H 4050 3100 50  0001 C CNN
	1    4050 3100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R1
U 1 1 5F960EE5
P 3400 3100
F 0 "R1" V 3305 3168 45  0000 L CNN
F 1 "10k" V 3389 3168 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3400 3250 20  0001 C CNN
F 3 "" H 3400 3100 60  0001 C CNN
F 4 " " V 3484 3168 60  0000 L CNN "Field4"
	1    3400 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2900 3400 2900
Connection ~ 3400 2900
$Comp
L power:GND #PWR0102
U 1 1 5F96B8DD
P 3400 3300
F 0 "#PWR0102" H 3400 3300 30  0001 C CNN
F 1 "GND" H 3400 3230 30  0001 C CNN
F 2 "" H 3400 3300 50  0001 C CNN
F 3 "" H 3400 3300 50  0001 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
Text Notes 1100 4350 0    50   ~ 0
The small gap between the board and this SMD connector is\na bit concerning; some sort of resonance could probably be set up\nin there.
$Comp
L 0xDBFB7:CE3520K3 U2
U 1 1 5F97ADF9
P 4050 2900
F 0 "U2" H 4194 2946 50  0000 L CNN
F 1 "CE3520K3" H 4194 2855 50  0000 L CNN
F 2 "0xDBFB7:4-Micro-X" H 4050 2900 50  0001 C CNN
F 3 "" H 4050 2900 50  0001 C CNN
	1    4050 2900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C2
U 1 1 5F342E17
P 3950 1800
F 0 "C2" V 3716 1850 45  0000 C CNN
F 1 "100 nF" V 3800 1850 45  0000 C CNN
F 2 "0603" H 3950 2050 20  0001 C CNN
F 3 "" H 3950 1800 50  0001 C CNN
F 4 "" H 4058 1766 60  0000 L CNN "Field4"
	1    3950 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F345368
P 3750 1800
F 0 "#PWR0104" H 3750 1800 30  0001 C CNN
F 1 "GND" H 3750 1730 30  0001 C CNN
F 2 "" H 3750 1800 50  0001 C CNN
F 3 "" H 3750 1800 50  0001 C CNN
	1    3750 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 1800 4050 2300
Connection ~ 4050 1800
Connection ~ 4050 2300
$Comp
L Connector:Test_Point TPOP2
U 1 1 5F346658
P 2650 2900
F 0 "TPOP2" V 2845 2972 50  0000 C CNN
F 1 "Voutput" V 2754 2972 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 2850 2900 50  0001 C CNN
F 3 "~" H 2850 2900 50  0001 C CNN
F 4 "R" H 2650 2900 50  0001 C CNN "Spice_Primitive"
F 5 "100M" H 2650 2900 50  0001 C CNN "Spice_Model"
F 6 "N" H 2650 2900 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2650 2900
	0    -1   -1   0   
$EndComp
Connection ~ 4050 2700
Connection ~ 4050 3100
Wire Wire Line
	3400 2900 3800 2900
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C1
U 1 1 5F34B7A8
P 2850 2900
F 0 "C1" V 2616 2950 45  0000 C CNN
F 1 "10 pF" V 2700 2950 45  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2850 3150 20  0001 C CNN
F 3 "" H 2850 2900 50  0001 C CNN
F 4 "" H 2958 2866 60  0000 L CNN "Field4"
F 5 "X" H 2850 2900 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 2850 2900 50  0001 C CNN "Spice_Model"
F 7 "Y" H 2850 2900 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 2850 2900 50  0001 C CNN "Spice_Lib_File"
	1    2850 2900
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C?
U 1 1 5F355F2B
P 4150 2300
F 0 "C?" V 3916 2350 45  0000 C CNN
F 1 "100 nF" V 4000 2350 45  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4150 2550 20  0001 C CNN
F 3 "" H 4150 2300 50  0001 C CNN
F 4 "" H 4258 2266 60  0000 L CNN "Field4"
	1    4150 2300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3567EF
P 4350 2300
F 0 "#PWR?" H 4350 2300 30  0001 C CNN
F 1 "GND" H 4350 2230 30  0001 C CNN
F 2 "" H 4350 2300 50  0001 C CNN
F 3 "" H 4350 2300 50  0001 C CNN
	1    4350 2300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC