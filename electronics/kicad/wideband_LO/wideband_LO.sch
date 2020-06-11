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
	3500 3050 3950 3050
$Comp
L SparkFun-Resistors:RESISTOR0402 R3
U 1 1 5EE13E6D
P 4750 2550
F 0 "R3" V 4655 2618 45  0000 L CNN
F 1 "10K" V 4739 2618 45  0000 L CNN
F 2 "0402" H 4750 2700 20  0001 C CNN
F 3 "" H 4750 2550 60  0001 C CNN
F 4 " " V 4834 2618 60  0000 L CNN "Field4"
	1    4750 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 3050 4750 2750
Wire Wire Line
	3200 3250 3100 3250
Wire Wire Line
	1900 3250 2000 3250
$Comp
L SparkFun-Resistors:RESISTOR0402 R1
U 1 1 5EE21C0B
P 2000 4200
F 0 "R1" V 2095 4132 45  0000 R CNN
F 1 "10K" V 2011 4132 45  0000 R CNN
F 2 "0402" H 2000 4350 20  0001 C CNN
F 3 "" H 2000 4200 60  0001 C CNN
F 4 " " V 1916 4132 60  0000 R CNN "Field4"
	1    2000 4200
	0    -1   -1   0   
$EndComp
Connection ~ 2000 3250
Wire Wire Line
	2100 3250 2000 3250
Connection ~ 3500 3050
$Comp
L 0xDBFB7:BFP620 U1
U 1 1 5EE06AC3
P 3350 2700
F 0 "U1" H 3644 2196 50  0000 L CNN
F 1 "BFP620" H 3644 2105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 3350 2700 50  0001 C CNN
F 3 "" H 3350 2700 50  0001 C CNN
F 4 "X" H 3350 2700 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 3350 2700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3350 2700 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 3350 2700 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 3350 2700 50  0001 C CNN "Spice_Node_Sequence"
	1    3350 2700
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L5
U 1 1 5EE2AFDA
P 3500 4050
F 0 "L5" H 3553 4092 45  0000 L CNN
F 1 "220 nH" H 3553 4008 45  0000 L CNN
F 2 "0402" H 3500 4300 20  0001 C CNN
F 3 "" H 3500 4050 50  0001 C CNN
F 4 "" H 3552 3966 60  0000 L CNN "Field4"
	1    3500 4050
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L4
U 1 1 5EE2AFE1
P 3500 3650
F 0 "L4" H 3553 3692 45  0000 L CNN
F 1 "220 nH" H 3553 3608 45  0000 L CNN
F 2 "0402" H 3500 3900 20  0001 C CNN
F 3 "" H 3500 3650 50  0001 C CNN
F 4 "" H 3552 3566 60  0000 L CNN "Field4"
	1    3500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3450 3600 3450
Connection ~ 3500 3450
$Comp
L SparkFun-Resistors:RESISTOR0402 R2
U 1 1 5EE2D2F4
P 3100 3750
F 0 "R2" V 3195 3682 45  0000 R CNN
F 1 "10K" V 3111 3682 45  0000 R CNN
F 2 "0402" H 3100 3900 20  0001 C CNN
F 3 "" H 3100 3750 60  0001 C CNN
F 4 " " V 3016 3682 60  0000 R CNN "Field4"
	1    3100 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3550 3100 3250
Connection ~ 3100 3250
$Comp
L power:GND #PWR0103
U 1 1 5EE2EA29
P 3100 3950
F 0 "#PWR0103" H 3100 3950 30  0001 C CNN
F 1 "GND" H 3100 3880 30  0001 C CNN
F 2 "" H 3100 3950 50  0001 C CNN
F 3 "" H 3100 3950 50  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Test_Point TP3
U 1 1 5EE3076A
P 3500 4250
F 0 "TP3" H 3442 4276 50  0000 R CNN
F 1 "Vemitter" H 3442 4367 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3700 4250 50  0001 C CNN
F 3 "~" H 3700 4250 50  0001 C CNN
F 4 "V" H 3500 4250 50  0001 C CNN "Spice_Primitive"
F 5 "dc -2" H 3500 4250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3500 4250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3500 4250
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C6
U 1 1 5EE32EB3
P 4050 4250
F 0 "C6" V 3816 4300 45  0000 C CNN
F 1 "0.1 uF" V 3900 4300 45  0000 C CNN
F 2 "0603" H 4050 4500 20  0001 C CNN
F 3 "" H 4050 4250 50  0001 C CNN
F 4 "" H 4158 4216 60  0000 L CNN "Field4"
	1    4050 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 4250 3500 4250
Connection ~ 3500 4250
$Comp
L Connector:Test_Point TP1
U 1 1 5EE35A86
P 2550 3050
F 0 "TP1" V 2745 3122 50  0000 C CNN
F 1 "Voutput" V 2654 3122 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 2750 3050 50  0001 C CNN
F 3 "~" H 2750 3050 50  0001 C CNN
F 4 "R" H 2550 3050 50  0001 C CNN "Spice_Primitive"
F 5 "100M" H 2550 3050 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2550 3050 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2550 3050
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C1
U 1 1 5EE373D5
P 2100 4400
F 0 "C1" V 1866 4450 45  0000 C CNN
F 1 "0.1 uF" V 1950 4450 45  0000 C CNN
F 2 "0603" H 2100 4650 20  0001 C CNN
F 3 "" H 2100 4400 50  0001 C CNN
F 4 "" H 2208 4366 60  0000 L CNN "Field4"
	1    2100 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EE3A599
P 2300 4400
F 0 "#PWR0104" H 2300 4400 30  0001 C CNN
F 1 "GND" H 2300 4330 30  0001 C CNN
F 2 "" H 2300 4400 50  0001 C CNN
F 3 "" H 2300 4400 50  0001 C CNN
	1    2300 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EE3FB1C
P 4250 4250
F 0 "#PWR0105" H 4250 4250 30  0001 C CNN
F 1 "GND" H 4250 4180 30  0001 C CNN
F 2 "" H 4250 4250 50  0001 C CNN
F 3 "" H 4250 4250 50  0001 C CNN
	1    4250 4250
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C4
U 1 1 5EE408DC
P 3050 3050
F 0 "C4" V 2816 3100 45  0000 C CNN
F 1 "10 pF" V 2900 3100 45  0000 C CNN
F 2 "0402" H 3050 3300 20  0001 C CNN
F 3 "" H 3050 3050 50  0001 C CNN
F 4 "" H 3158 3016 60  0000 L CNN "Field4"
F 5 "X" H 3050 3050 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 3050 3050 50  0001 C CNN "Spice_Model"
F 7 "Y" H 3050 3050 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 3050 3050 50  0001 C CNN "Spice_Lib_File"
	1    3050 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 3050 3250 3050
Wire Wire Line
	2550 3050 2950 3050
$Comp
L SparkFun-Resistors:RESISTOR0402 R4
U 1 1 5EE4E4E0
P 2450 3750
F 0 "R4" V 2545 3682 45  0000 R CNN
F 1 "10K" V 2461 3682 45  0000 R CNN
F 2 "0402" H 2450 3900 20  0001 C CNN
F 3 "" H 2450 3750 60  0001 C CNN
F 4 " " V 2366 3682 60  0000 R CNN "Field4"
	1    2450 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EE4ED80
P 2450 3950
F 0 "#PWR0108" H 2450 3950 30  0001 C CNN
F 1 "GND" H 2450 3880 30  0001 C CNN
F 2 "" H 2450 3950 50  0001 C CNN
F 3 "" H 2450 3950 50  0001 C CNN
	1    2450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3550 2450 3250
Wire Wire Line
	2000 3250 2000 4000
$Comp
L Device:D D2
U 1 1 5EE6169E
P 2250 3250
F 0 "D2" H 2250 3466 50  0000 C CNN
F 1 "D" H 2250 3375 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 2250 3250 50  0001 C CNN
F 3 "~" H 2250 3250 50  0001 C CNN
F 4 "X" H 2250 3250 50  0001 C CNN "Spice_Primitive"
F 5 "SMV2019079LF" H 2250 3250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2250 3250 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/SMV2019079LF.lib" H 2250 3250 50  0001 C CNN "Spice_Lib_File"
	1    2250 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3250 2450 3250
$Comp
L Device:D D4
U 1 1 5EE6FD7F
P 5000 3050
F 0 "D4" H 5000 3266 50  0000 C CNN
F 1 "D" H 5000 3175 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 5000 3050 50  0001 C CNN
F 3 "~" H 5000 3050 50  0001 C CNN
F 4 "X" H 5000 3050 50  0001 C CNN "Spice_Primitive"
F 5 "SMV2019079LF" H 5000 3050 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5000 3050 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/SMV2019079LF.lib" H 5000 3050 50  0001 C CNN "Spice_Lib_File"
	1    5000 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EE21C04
P 1200 3250
F 0 "#PWR0102" H 1200 3250 30  0001 C CNN
F 1 "GND" H 1200 3180 30  0001 C CNN
F 2 "" H 1200 3250 50  0001 C CNN
F 3 "" H 1200 3250 50  0001 C CNN
	1    1200 3250
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L1
U 1 1 5EE21BFD
P 1400 3250
F 0 "L1" V 1579 3250 45  0000 C CNN
F 1 "1 nH" V 1495 3250 45  0000 C CNN
F 2 "0402" H 1400 3500 20  0001 C CNN
F 3 "" H 1400 3250 50  0001 C CNN
F 4 "" H 1452 3166 60  0000 L CNN "Field4"
	1    1400 3250
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C5
U 1 1 5EEB34DA
P 4050 3050
F 0 "C5" V 3816 3100 45  0000 C CNN
F 1 "10 pF" V 3900 3100 45  0000 C CNN
F 2 "0402" H 4050 3300 20  0001 C CNN
F 3 "" H 4050 3050 50  0001 C CNN
F 4 "" H 4158 3016 60  0000 L CNN "Field4"
F 5 "X" H 4050 3050 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 4050 3050 50  0001 C CNN "Spice_Model"
F 7 "Y" H 4050 3050 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 4050 3050 50  0001 C CNN "Spice_Lib_File"
	1    4050 3050
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C2
U 1 1 5EEB3D3A
P 2600 3250
F 0 "C2" V 2366 3300 45  0000 C CNN
F 1 "10 pF" V 2450 3300 45  0000 C CNN
F 2 "0402" H 2600 3500 20  0001 C CNN
F 3 "" H 2600 3250 50  0001 C CNN
F 4 "" H 2708 3216 60  0000 L CNN "Field4"
F 5 "X" H 2600 3250 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 2600 3250 50  0001 C CNN "Spice_Model"
F 7 "Y" H 2600 3250 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 2600 3250 50  0001 C CNN "Spice_Lib_File"
	1    2600 3250
	0    1    1    0   
$EndComp
$Comp
L Connector:Test_Point Vvaractor1
U 1 1 5EED7014
P 2000 4400
F 0 "Vvaractor1" V 2195 4472 50  0000 C CNN
F 1 " " V 2104 4472 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 2200 4400 50  0001 C CNN
F 3 "~" H 2200 4400 50  0001 C CNN
F 4 "V" H 2000 4400 50  0001 C CNN "Spice_Primitive"
F 5 "dc 1" H 2000 4400 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2000 4400 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2000 4400
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R6
U 1 1 5EED81DA
P 2550 2850
F 0 "R6" V 2455 2918 45  0000 L CNN
F 1 "50" V 2539 2918 45  0000 L CNN
F 2 "0402" H 2550 3000 20  0001 C CNN
F 3 "" H 2550 2850 60  0001 C CNN
F 4 " " V 2634 2918 60  0000 L CNN "Field4"
	1    2550 2850
	0    1    1    0   
$EndComp
Connection ~ 2550 3050
$Comp
L Device:D D1
U 1 1 5EE5E8B1
P 1750 3250
F 0 "D1" H 1750 3034 50  0000 C CNN
F 1 "D" H 1750 3125 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 1750 3250 50  0001 C CNN
F 3 "~" H 1750 3250 50  0001 C CNN
F 4 "X" H 1750 3250 50  0001 C CNN "Spice_Primitive"
F 5 "SMV2019079LF" H 1750 3250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 1750 3250 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/SMV2019079LF.lib" H 1750 3250 50  0001 C CNN "Spice_Lib_File"
	1    1750 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:D D3
U 1 1 5EE6E7EB
P 4500 3050
F 0 "D3" H 4500 2834 50  0000 C CNN
F 1 "D" H 4500 2925 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 4500 3050 50  0001 C CNN
F 3 "~" H 4500 3050 50  0001 C CNN
F 4 "X" H 4500 3050 50  0001 C CNN "Spice_Primitive"
F 5 "SMV2019079LF" H 4500 3050 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4500 3050 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/SMV2019079LF.lib" H 4500 3050 50  0001 C CNN "Spice_Lib_File"
	1    4500 3050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EEDC0A6
P 2550 2650
F 0 "#PWR0109" H 2550 2650 30  0001 C CNN
F 1 "GND" H 2550 2580 30  0001 C CNN
F 2 "" H 2550 2650 50  0001 C CNN
F 3 "" H 2550 2650 50  0001 C CNN
	1    2550 2650
	-1   0    0    1   
$EndComp
Connection ~ 3500 2250
$Comp
L power:GND #PWR0106
U 1 1 5EE45343
P 2750 2250
F 0 "#PWR0106" H 2750 2250 30  0001 C CNN
F 1 "GND" H 2750 2180 30  0001 C CNN
F 2 "" H 2750 2250 50  0001 C CNN
F 3 "" H 2750 2250 50  0001 C CNN
	1    2750 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 2250 3500 2250
$Comp
L SparkFun-Capacitors:4.7UF0603 C3
U 1 1 5EE4533B
P 2950 2250
F 0 "C3" V 2716 2300 45  0000 C CNN
F 1 "0.1 uF" V 2800 2300 45  0000 C CNN
F 2 "0603" H 2950 2500 20  0001 C CNN
F 3 "" H 2950 2250 50  0001 C CNN
F 4 "" H 3058 2216 60  0000 L CNN "Field4"
	1    2950 2250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Test_Point TP2
U 1 1 5EE45334
P 3500 2250
F 0 "TP2" H 3558 2368 50  0000 L CNN
F 1 "Vsource" H 3558 2277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3700 2250 50  0001 C CNN
F 3 "~" H 3700 2250 50  0001 C CNN
F 4 "V" H 3500 2250 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20e-12 5e-12 1e-12 1 1)" H 3500 2250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3500 2250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3500 2250
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L2
U 1 1 5EE08A1B
P 3500 2450
F 0 "L2" H 3553 2492 45  0000 L CNN
F 1 "220 nH" H 3553 2408 45  0000 L CNN
F 2 "0402" H 3500 2700 20  0001 C CNN
F 3 "" H 3500 2450 50  0001 C CNN
F 4 "" H 3552 2366 60  0000 L CNN "Field4"
	1    3500 2450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L3
U 1 1 5EE07869
P 3500 2850
F 0 "L3" H 3553 2892 45  0000 L CNN
F 1 "220 nH" H 3553 2808 45  0000 L CNN
F 2 "0402" H 3500 3100 20  0001 C CNN
F 3 "" H 3500 2850 50  0001 C CNN
F 4 "" H 3552 2766 60  0000 L CNN "Field4"
	1    3500 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5EE4D5D3
P 4250 3450
F 0 "#PWR0107" H 4250 3450 30  0001 C CNN
F 1 "GND" H 4250 3380 30  0001 C CNN
F 2 "" H 4250 3450 50  0001 C CNN
F 3 "" H 4250 3450 50  0001 C CNN
	1    4250 3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R5
U 1 1 5EE4C71F
P 4250 3250
F 0 "R5" V 4155 3318 45  0000 L CNN
F 1 "10K" V 4239 3318 45  0000 L CNN
F 2 "0402" H 4250 3400 20  0001 C CNN
F 3 "" H 4250 3250 60  0001 C CNN
F 4 " " V 4334 3318 60  0000 L CNN "Field4"
	1    4250 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3050 4750 3050
$Comp
L power:GND #PWR0101
U 1 1 5EE11FB7
P 5550 3050
F 0 "#PWR0101" H 5550 3050 30  0001 C CNN
F 1 "GND" H 5550 2980 30  0001 C CNN
F 2 "" H 5550 3050 50  0001 C CNN
F 3 "" H 5550 3050 50  0001 C CNN
	1    5550 3050
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L6
U 1 1 5EE100FA
P 5350 3050
F 0 "L6" V 5529 3050 45  0000 C CNN
F 1 "1 nH" V 5445 3050 45  0000 C CNN
F 2 "0402" H 5350 3300 20  0001 C CNN
F 3 "" H 5350 3050 50  0001 C CNN
F 4 "" H 5402 2966 60  0000 L CNN "Field4"
	1    5350 3050
	0    -1   -1   0   
$EndComp
Connection ~ 4250 3050
Wire Wire Line
	4350 3050 4250 3050
Connection ~ 4750 3050
Wire Wire Line
	4650 3050 4750 3050
Wire Wire Line
	2800 3250 3100 3250
Wire Wire Line
	2450 3250 2500 3250
Connection ~ 2450 3250
Text GLabel 3500 2250 2    50   Input ~ 0
nsource
Text GLabel 2700 3050 0    50   Input ~ 0
noutput
Text GLabel 3500 4250 0    50   Input ~ 0
nemitter
Connection ~ 2000 4400
Text GLabel 2000 4400 3    50   Input ~ 0
nvaractor
Text GLabel 4750 2350 1    50   Input ~ 0
nvaractor
$EndSCHEMATC
