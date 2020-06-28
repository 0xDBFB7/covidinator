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
	4800 3000 5250 3000
Connection ~ 4800 3000
$Comp
L 0xDBFB7:BFP620 U1
U 1 1 5EE06AC3
P 4650 3650
F 0 "U1" H 4944 3146 50  0000 L CNN
F 1 "BFP620" H 4944 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 4650 3650 50  0001 C CNN
F 3 "" H 4650 3650 50  0001 C CNN
F 4 "X" H 4650 3650 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 4650 3650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4650 3650 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 4650 3650 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 4650 3650 50  0001 C CNN "Spice_Node_Sequence"
	1    4650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4400 4900 4400
$Comp
L Connector:Test_Point TPOP1
U 1 1 5EE35A86
P 3250 3000
F 0 "TPOP1" V 3445 3072 50  0000 C CNN
F 1 "Voutput" V 3354 3072 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 3450 3000 50  0001 C CNN
F 3 "~" H 3450 3000 50  0001 C CNN
F 4 "R" H 3250 3000 50  0001 C CNN "Spice_Primitive"
F 5 "100M" H 3250 3000 50  0001 C CNN "Spice_Model"
F 6 "N" H 3250 3000 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3250 3000
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C4
U 1 1 5EE408DC
P 3750 3000
F 0 "C4" V 3516 3050 45  0000 C CNN
F 1 "10 pF" V 3600 3050 45  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3750 3250 20  0001 C CNN
F 3 "" H 3750 3000 50  0001 C CNN
F 4 "" H 3858 2966 60  0000 L CNN "Field4"
F 5 "X" H 3750 3000 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 3750 3000 50  0001 C CNN "Spice_Model"
F 7 "Y" H 3750 3000 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 3750 3000 50  0001 C CNN "Spice_Lib_File"
	1    3750 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3000 3650 3000
$Comp
L SparkFun-Resistors:RESISTOR0402 R6
U 1 1 5EED81DA
P 3250 2800
F 0 "R6" V 3155 2868 45  0000 L CNN
F 1 "50" V 3239 2868 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3250 2950 20  0001 C CNN
F 3 "" H 3250 2800 60  0001 C CNN
F 4 " " V 3334 2868 60  0000 L CNN "Field4"
	1    3250 2800
	0    1    1    0   
$EndComp
Connection ~ 3250 3000
$Comp
L power:GND #PWR0109
U 1 1 5EEDC0A6
P 3250 2600
F 0 "#PWR0109" H 3250 2600 30  0001 C CNN
F 1 "GND" H 3250 2530 30  0001 C CNN
F 2 "" H 3250 2600 50  0001 C CNN
F 3 "" H 3250 2600 50  0001 C CNN
	1    3250 2600
	-1   0    0    1   
$EndComp
Connection ~ 4800 2200
$Comp
L power:GND #PWR0106
U 1 1 5EE45343
P 4050 2200
F 0 "#PWR0106" H 4050 2200 30  0001 C CNN
F 1 "GND" H 4050 2130 30  0001 C CNN
F 2 "" H 4050 2200 50  0001 C CNN
F 3 "" H 4050 2200 50  0001 C CNN
	1    4050 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2200 4800 2200
$Comp
L SparkFun-Capacitors:4.7UF0603 C3
U 1 1 5EE4533B
P 4250 2200
F 0 "C3" V 4016 2250 45  0000 C CNN
F 1 "0.1 uF" V 4100 2250 45  0000 C CNN
F 2 "0603" H 4250 2450 20  0001 C CNN
F 3 "" H 4250 2200 50  0001 C CNN
F 4 "" H 4358 2166 60  0000 L CNN "Field4"
	1    4250 2200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Test_Point TPSO1
U 1 1 5EE45334
P 4800 2200
F 0 "TPSO1" H 4858 2318 50  0000 L CNN
F 1 "Vsource" H 4858 2227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5000 2200 50  0001 C CNN
F 3 "~" H 5000 2200 50  0001 C CNN
F 4 "V" H 4800 2200 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20p 5p 1p 1 1)" H 4800 2200 50  0001 C CNN "Spice_Model"
F 6 "N" H 4800 2200 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4800 2200
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L2
U 1 1 5EE08A1B
P 4800 2400
F 0 "L2" H 4853 2442 45  0000 L CNN
F 1 "220 nH" H 4853 2358 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4800 2650 20  0001 C CNN
F 3 "" H 4800 2400 50  0001 C CNN
F 4 "" H 4852 2316 60  0000 L CNN "Field4"
	1    4800 2400
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L3
U 1 1 5EE07869
P 4800 2800
F 0 "L3" H 4853 2842 45  0000 L CNN
F 1 "220 nH" H 4853 2758 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4800 3050 20  0001 C CNN
F 3 "" H 4800 2800 50  0001 C CNN
F 4 "" H 4852 2716 60  0000 L CNN "Field4"
	1    4800 2800
	1    0    0    -1  
$EndComp
Text GLabel 4800 2200 2    50   Input ~ 0
nsource
Text GLabel 3250 3000 0    50   Input ~ 0
noutput
$Comp
L power:GND #PWR?
U 1 1 5EF81D29
P 4800 4400
F 0 "#PWR?" H 4800 4400 30  0001 C CNN
F 1 "GND" H 4800 4330 30  0001 C CNN
F 2 "" H 4800 4400 50  0001 C CNN
F 3 "" H 4800 4400 50  0001 C CNN
	1    4800 4400
	1    0    0    -1  
$EndComp
Connection ~ 4800 4400
$Comp
L 0xDBFB7:BFP620 U?
U 1 1 5EF86CDF
P 4650 3250
F 0 "U?" H 4944 2746 50  0000 L CNN
F 1 "BFP620" H 4944 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 4650 3250 50  0001 C CNN
F 3 "" H 4650 3250 50  0001 C CNN
F 4 "X" H 4650 3250 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 4650 3250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4650 3250 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 4650 3250 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 4650 3250 50  0001 C CNN "Spice_Node_Sequence"
	1    4650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4000 4900 4000
Connection ~ 4800 4000
$Comp
L 0xDBFB7:BFP620 U?
U 1 1 5EF89BFC
P 4650 2850
F 0 "U?" H 4944 2346 50  0000 L CNN
F 1 "BFP620" H 4944 2255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 4650 2850 50  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
F 4 "X" H 4650 2850 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 4650 2850 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4650 2850 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 4650 2850 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 4650 2850 50  0001 C CNN "Spice_Node_Sequence"
	1    4650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3600 4900 3600
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5EF8AECE
P 4150 3200
F 0 "R?" V 4055 3268 45  0000 L CNN
F 1 "50" V 4139 3268 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4150 3350 20  0001 C CNN
F 3 "" H 4150 3200 60  0001 C CNN
F 4 " " V 4234 3268 60  0000 L CNN "Field4"
	1    4150 3200
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5EF98BB7
P 4150 3600
F 0 "R?" V 4055 3668 45  0000 L CNN
F 1 "50" V 4139 3668 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4150 3750 20  0001 C CNN
F 3 "" H 4150 3600 60  0001 C CNN
F 4 " " V 4234 3668 60  0000 L CNN "Field4"
	1    4150 3600
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5EF9951E
P 4150 4000
F 0 "R?" V 4055 4068 45  0000 L CNN
F 1 "50" V 4139 4068 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4150 4150 20  0001 C CNN
F 3 "" H 4150 4000 60  0001 C CNN
F 4 " " V 4234 4068 60  0000 L CNN "Field4"
	1    4150 4000
	0    1    1    0   
$EndComp
Connection ~ 4800 3600
Wire Wire Line
	4150 3400 4500 3400
Connection ~ 4150 3400
Wire Wire Line
	4500 3800 4150 3800
Connection ~ 4150 3800
Wire Wire Line
	4500 4200 4150 4200
$Comp
L power:GND #PWR?
U 1 1 5EF9D993
P 4150 4600
F 0 "#PWR?" H 4150 4600 30  0001 C CNN
F 1 "GND" H 4150 4530 30  0001 C CNN
F 2 "" H 4150 4600 50  0001 C CNN
F 3 "" H 4150 4600 50  0001 C CNN
	1    4150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3200 4800 3000
Wire Wire Line
	4150 3000 4800 3000
Wire Wire Line
	4150 3000 3950 3000
Connection ~ 4150 3000
$Comp
L 0xDBFB7:BFP620 U?
U 1 1 5EF9F4AC
P 4000 3850
F 0 "U?" H 4294 3346 50  0000 L CNN
F 1 "BFP620" H 4294 3255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 4000 3850 50  0001 C CNN
F 3 "" H 4000 3850 50  0001 C CNN
F 4 "X" H 4000 3850 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 4000 3850 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4000 3850 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 4000 3850 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 4000 3850 50  0001 C CNN "Spice_Node_Sequence"
	1    4000 3850
	1    0    0    -1  
$EndComp
Connection ~ 4150 4200
$EndSCHEMATC
