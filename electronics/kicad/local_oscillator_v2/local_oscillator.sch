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
$Comp
L 0xDBFB7:CE3520K3 U1
U 1 1 5EAA1A86
P 5650 4650
F 0 "U1" H 5791 4696 50  0000 L CNN
F 1 "CE3520K3" H 5791 4605 50  0000 L CNN
F 2 "0xDBFB7:4-Micro-X" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4850 5750 4850
Connection ~ 5650 4850
$Comp
L power:GND #PWR0101
U 1 1 5EAB3B29
P 5750 4850
F 0 "#PWR0101" H 5750 4850 30  0001 C CNN
F 1 "GND" H 5750 4780 30  0001 C CNN
F 2 "" H 5750 4850 50  0001 C CNN
F 3 "" H 5750 4850 50  0001 C CNN
	1    5750 4850
	1    0    0    -1  
$EndComp
Connection ~ 5750 4850
$Comp
L power:GND #PWR0102
U 1 1 5EAB3B63
P 5650 4850
F 0 "#PWR0102" H 5650 4850 30  0001 C CNN
F 1 "GND" H 5650 4780 30  0001 C CNN
F 2 "" H 5650 4850 50  0001 C CNN
F 3 "" H 5650 4850 50  0001 C CNN
	1    5650 4850
	1    0    0    -1  
$EndComp
Text Notes 5350 5100 0    50   ~ 0
Strap tightly down to GND
Wire Wire Line
	5350 3700 5650 3700
$Comp
L SparkFun-Capacitors:4.7UF0603 C4
U 1 1 5EADDFB9
P 6100 3900
F 0 "C4" H 6208 4045 45  0000 L CNN
F 1 "0.1 uF" H 6208 3961 45  0000 L CNN
F 2 "0603" H 6100 4150 20  0001 C CNN
F 3 "" H 6100 3900 50  0001 C CNN
F 4 "CAP-08280" V 6208 3866 60  0001 L CNN "Field4"
	1    6100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3700 6100 3700
Connection ~ 5650 3700
$Comp
L power:GND #PWR0103
U 1 1 5EAE14E0
P 6100 4000
F 0 "#PWR0103" H 6100 4000 30  0001 C CNN
F 1 "GND" H 6100 3930 30  0001 C CNN
F 2 "" H 6100 4000 50  0001 C CNN
F 3 "" H 6100 4000 50  0001 C CNN
	1    6100 4000
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C5
U 1 1 5EAE2635
P 6550 3900
F 0 "C5" H 6658 4045 45  0000 L CNN
F 1 "0.1 uF" H 6658 3961 45  0000 L CNN
F 2 "0603" H 6550 4150 20  0001 C CNN
F 3 "" H 6550 3900 50  0001 C CNN
F 4 "CAP-08280" V 6658 3866 60  0001 L CNN "Field4"
	1    6550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3700 6100 3700
Connection ~ 6100 3700
$Comp
L power:GND #PWR0104
U 1 1 5EAE3489
P 6550 4000
F 0 "#PWR0104" H 6550 4000 30  0001 C CNN
F 1 "GND" H 6550 3930 30  0001 C CNN
F 2 "" H 6550 4000 50  0001 C CNN
F 3 "" H 6550 4000 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
Text Label 5650 4000 0    50   ~ 0
VCC
$Comp
L Device:D_Capacitance D1
U 1 1 5EB17680
P 4350 4650
F 0 "D1" H 4350 4395 50  0000 C CNN
F 1 "D_Capacitance" H 4350 4486 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 4350 4650 50  0001 C CNN
F 3 "~" H 4350 4650 50  0001 C CNN
	1    4350 4650
	1    0    0    1   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C2
U 1 1 5EB2D82E
P 4700 4650
F 0 "C2" H 4593 4658 45  0000 R CNN
F 1 "1 pF" H 4593 4742 45  0000 R CNN
F 2 "0402" H 4700 4900 20  0001 C CNN
F 3 "" H 4700 4650 50  0001 C CNN
F 4 "" H 4593 4784 60  0000 R CNN "Field4"
	1    4700 4650
	0    -1   1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C1
U 1 1 5EB30B32
P 3750 4650
F 0 "C1" H 3643 4658 45  0000 R CNN
F 1 "1 pF" H 3643 4742 45  0000 R CNN
F 2 "0402" H 3750 4900 20  0001 C CNN
F 3 "" H 3750 4650 50  0001 C CNN
F 4 "" H 3643 4784 60  0000 R CNN "Field4"
	1    3750 4650
	0    -1   1    0   
$EndComp
Wire Wire Line
	6000 4350 5650 4350
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C6
U 1 1 5EAE6A89
P 6100 4350
F 0 "C6" H 5993 4358 45  0000 R CNN
F 1 "4.7 pF" H 5993 4442 45  0000 R CNN
F 2 "0402" H 6100 4600 20  0001 C CNN
F 3 "" H 6100 4350 50  0001 C CNN
F 4 "" H 5993 4484 60  0000 R CNN "Field4"
	1    6100 4350
	0    1    -1   0   
$EndComp
Wire Wire Line
	5650 3700 5650 4050
$Comp
L SparkFun-Resistors:RESISTOR0603 R3
U 1 1 5EB624BB
P 4800 5000
F 0 "R3" V 4705 5068 45  0000 L CNN
F 1 "50 Ohm" V 4789 5068 45  0000 L CNN
F 2 "0603" H 4800 5150 20  0001 C CNN
F 3 "" H 4800 5000 60  0001 C CNN
F 4 " " V 4884 5068 60  0000 L CNN "Field4"
	1    4800 5000
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0603 R1
U 1 1 5EB6C83D
P 4050 5000
F 0 "R1" V 3955 5068 45  0000 L CNN
F 1 "50 Ohm" V 4039 5068 45  0000 L CNN
F 2 "0603" H 4050 5150 20  0001 C CNN
F 3 "" H 4050 5000 60  0001 C CNN
F 4 " " V 4134 5068 60  0000 L CNN "Field4"
	1    4050 5000
	0    1    1    0   
$EndComp
$Comp
L conn:CONN_1 P1
U 1 1 5EB6C843
P 4200 4800
F 0 "P1" H 4133 4703 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4150 4840 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4200 4800 50  0001 C CNN
F 3 "" H 4200 4800 50  0001 C CNN
	1    4200 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4650 4050 4800
Wire Wire Line
	4800 4650 4800 4800
Wire Wire Line
	4800 4650 5400 4650
Connection ~ 4800 4650
$Comp
L power:GND #PWR0105
U 1 1 5EB9F3EB
P 4800 5200
F 0 "#PWR0105" H 4800 5200 30  0001 C CNN
F 1 "GND" H 4800 5130 30  0001 C CNN
F 2 "" H 4800 5200 50  0001 C CNN
F 3 "" H 4800 5200 50  0001 C CNN
	1    4800 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4650 4050 4650
Connection ~ 4050 4650
$Comp
L conn:CONN_1 P3
U 1 1 5EAD30DB
P 5200 3200
F 0 "P3" H 5133 3103 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5150 3240 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 5200 3200 50  0001 C CNN
F 3 "" H 5200 3200 50  0001 C CNN
	1    5200 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 3700 5350 3200
Wire Wire Line
	4050 4650 4200 4650
Wire Wire Line
	5650 4050 3550 4050
Wire Wire Line
	3550 4050 3550 4650
Connection ~ 5650 4050
Wire Wire Line
	5650 4050 5650 4350
Connection ~ 5650 4350
Wire Wire Line
	5650 4350 5650 4450
$Comp
L conn:CONN_1 P4
U 1 1 5EBA8EF1
P 6450 4350
F 0 "P4" H 6383 4253 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6400 4390 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6450 4350 50  0001 C CNN
F 3 "" H 6450 4350 50  0001 C CNN
	1    6450 4350
	1    0    0    -1  
$EndComp
Connection ~ 4050 4800
Connection ~ 4500 4650
Wire Wire Line
	4500 4650 4500 4800
$Comp
L SparkFun-Resistors:RESISTOR0603 R2
U 1 1 5EB6A453
P 4500 5000
F 0 "R2" V 4405 5068 45  0000 L CNN
F 1 "50 Ohm" V 4489 5068 45  0000 L CNN
F 2 "0603" H 4500 5150 20  0001 C CNN
F 3 "" H 4500 5000 60  0001 C CNN
F 4 " " V 4584 5068 60  0000 L CNN "Field4"
	1    4500 5000
	0    1    1    0   
$EndComp
Connection ~ 4500 4800
$Comp
L conn:CONN_1 P2
U 1 1 5EB6A459
P 4650 4800
F 0 "P2" H 4583 4703 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4600 4840 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4650 4800 50  0001 C CNN
F 3 "" H 4650 4800 50  0001 C CNN
	1    4650 4800
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P5
U 1 1 5EBD9C61
P 4950 4800
F 0 "P5" H 4883 4703 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4900 4840 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4950 4800 50  0001 C CNN
F 3 "" H 4950 4800 50  0001 C CNN
	1    4950 4800
	1    0    0    -1  
$EndComp
Connection ~ 4800 4800
$Comp
L conn:CONN_1 P6
U 1 1 5EBDC3B9
P 4200 5200
F 0 "P6" H 4133 5103 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4150 5240 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4200 5200 50  0001 C CNN
F 3 "" H 4200 5200 50  0001 C CNN
	1    4200 5200
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P7
U 1 1 5EBDCCB1
P 4650 5200
F 0 "P7" H 4583 5103 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4600 5240 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 4650 5200 50  0001 C CNN
F 3 "" H 4650 5200 50  0001 C CNN
	1    4650 5200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
