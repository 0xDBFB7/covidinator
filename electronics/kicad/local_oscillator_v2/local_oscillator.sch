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
Text Notes 5500 5200 0    50   ~ 0
Strap tightly down to GND
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
Text Label 5650 4200 0    50   ~ 0
VCC
Wire Wire Line
	6000 4350 5650 4350
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C6
U 1 1 5EAE6A89
P 6100 4350
F 0 "C6" H 5993 4358 45  0000 R CNN
F 1 "10 pF" H 5993 4442 45  0000 R CNN
F 2 "0402" H 6100 4600 20  0001 C CNN
F 3 "" H 6100 4350 50  0001 C CNN
F 4 "" H 5993 4484 60  0000 R CNN "Field4"
	1    6100 4350
	0    1    -1   0   
$EndComp
Wire Wire Line
	5650 4050 5650 4100
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
Wire Wire Line
	5400 4650 5350 4650
$Comp
L conn:CONN_1 P3
U 1 1 5EC1E434
P 5200 3600
F 0 "P3" H 5133 3503 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5150 3640 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5200 3600 50  0001 C CNN
F 3 "" H 5200 3600 50  0001 C CNN
	1    5200 3600
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L3
U 1 1 5EC3E611
P 5350 4850
F 0 "L3" H 5306 4808 45  0000 R CNN
F 1 "220 nH" H 5306 4892 45  0000 R CNN
F 2 "0402" H 5350 5100 20  0001 C CNN
F 3 "" H 5350 4850 50  0001 C CNN
F 4 "" H 5402 4766 60  0000 L CNN "Field4"
	1    5350 4850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EC4266A
P 5350 5050
F 0 "#PWR0105" H 5350 5050 30  0001 C CNN
F 1 "GND" H 5350 4980 30  0001 C CNN
F 2 "" H 5350 5050 50  0001 C CNN
F 3 "" H 5350 5050 50  0001 C CNN
	1    5350 5050
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L4
U 1 1 5EC456F8
P 5650 3900
F 0 "L4" H 5606 3858 45  0000 R CNN
F 1 "220 nH" H 5606 3942 45  0000 R CNN
F 2 "0402" H 5650 4150 20  0001 C CNN
F 3 "" H 5650 3900 50  0001 C CNN
F 4 "" H 5702 3816 60  0000 L CNN "Field4"
	1    5650 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 3700 5650 3700
Connection ~ 5650 3700
Wire Wire Line
	5650 3700 6100 3700
Connection ~ 5650 4100
Wire Wire Line
	5650 4100 5650 4350
Wire Wire Line
	5350 3600 5350 3700
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C1
U 1 1 5ED0CDE7
P 3050 4650
F 0 "C1" H 2943 4658 45  0000 R CNN
F 1 "0.5 pF" H 2943 4742 45  0000 R CNN
F 2 "0402" H 3050 4900 20  0001 C CNN
F 3 "" H 3050 4650 50  0001 C CNN
F 4 "" H 2943 4784 60  0000 R CNN "Field4"
	1    3050 4650
	0    1    -1   0   
$EndComp
Connection ~ 5350 4650
Wire Wire Line
	2950 4650 2950 4050
$Comp
L Device:D_Capacitance D4
U 1 1 5ED19DD8
P 4300 4650
F 0 "D4" H 4300 4395 50  0000 C CNN
F 1 "D_Capacitance" H 4300 4486 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 4300 4650 50  0001 C CNN
F 3 "~" H 4300 4650 50  0001 C CNN
	1    4300 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 4650 5350 4650
$Comp
L Device:D_Capacitance D6
U 1 1 5ED15CAF
P 4600 4650
F 0 "D6" H 4600 4866 50  0000 C CNN
F 1 "D_Capacitance" H 4600 4775 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 4600 4650 50  0001 C CNN
F 3 "~" H 4600 4650 50  0001 C CNN
	1    4600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4650 4700 4650
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C2
U 1 1 5ED0E8E1
P 4850 4650
F 0 "C2" H 4743 4658 45  0000 R CNN
F 1 "0.5 pF" H 4743 4742 45  0000 R CNN
F 2 "0402" H 4850 4900 20  0001 C CNN
F 3 "" H 4850 4650 50  0001 C CNN
F 4 "" H 4743 4784 60  0000 R CNN "Field4"
	1    4850 4650
	0    1    -1   0   
$EndComp
Connection ~ 4750 4650
$Comp
L Device:D_Capacitance D3
U 1 1 5ED12D3F
P 3700 4650
F 0 "D3" H 3700 4866 50  0000 C CNN
F 1 "D_Capacitance" H 3700 4775 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 3700 4650 50  0001 C CNN
F 3 "~" H 3700 4650 50  0001 C CNN
	1    3700 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Capacitance D5
U 1 1 5ED164DA
P 4450 4800
F 0 "D5" V 4404 4879 50  0000 L CNN
F 1 "D_Capacitance" V 4495 4879 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 4450 4800 50  0001 C CNN
F 3 "~" H 4450 4800 50  0001 C CNN
	1    4450 4800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5ED177E8
P 4450 4950
F 0 "#PWR0106" H 4450 4950 30  0001 C CNN
F 1 "GND" H 4450 4880 30  0001 C CNN
F 2 "" H 4450 4950 50  0001 C CNN
F 3 "" H 4450 4950 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
Connection ~ 3550 4650
$Comp
L Device:D_Capacitance D1
U 1 1 5ED19292
P 3400 4650
F 0 "D1" H 3400 4395 50  0000 C CNN
F 1 "D_Capacitance" H 3400 4486 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 3400 4650 50  0001 C CNN
F 3 "~" H 3400 4650 50  0001 C CNN
	1    3400 4650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5ED14708
P 3550 4950
F 0 "#PWR0107" H 3550 4950 30  0001 C CNN
F 1 "GND" H 3550 4880 30  0001 C CNN
F 2 "" H 3550 4950 50  0001 C CNN
F 3 "" H 3550 4950 50  0001 C CNN
	1    3550 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Capacitance D2
U 1 1 5ED0FC00
P 3550 4800
F 0 "D2" V 3504 4879 50  0000 L CNN
F 1 "D_Capacitance" V 3595 4879 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 3550 4800 50  0001 C CNN
F 3 "~" H 3550 4800 50  0001 C CNN
	1    3550 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 4050 5650 4050
Connection ~ 4450 4650
Wire Wire Line
	4150 4650 3850 4650
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L2
U 1 1 5ED2E2A3
P 4450 4450
F 0 "L2" H 4406 4408 45  0000 R CNN
F 1 "220 nH" H 4406 4492 45  0000 R CNN
F 2 "0402" H 4450 4700 20  0001 C CNN
F 3 "" H 4450 4450 50  0001 C CNN
F 4 "" H 4502 4366 60  0000 L CNN "Field4"
	1    4450 4450
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L1
U 1 1 5ED2EEFE
P 3550 4450
F 0 "L1" H 3506 4408 45  0000 R CNN
F 1 "220 nH" H 3506 4492 45  0000 R CNN
F 2 "0402" H 3550 4700 20  0001 C CNN
F 3 "" H 3550 4450 50  0001 C CNN
F 4 "" H 3602 4366 60  0000 L CNN "Field4"
	1    3550 4450
	-1   0    0    1   
$EndComp
$Comp
L conn:CONN_1 P2
U 1 1 5ED2FA6B
P 4450 4100
F 0 "P2" H 4383 4003 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4400 4140 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4450 4100 50  0001 C CNN
F 3 "" H 4450 4100 50  0001 C CNN
	1    4450 4100
	0    -1   -1   0   
$EndComp
$Comp
L conn:CONN_1 P1
U 1 1 5ED30ECA
P 3550 4100
F 0 "P1" H 3483 4003 40  0000 C CNN
F 1 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 3500 4140 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 3550 4100 50  0001 C CNN
F 3 "" H 3550 4100 50  0001 C CNN
	1    3550 4100
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C?
U 1 1 5ED6E617
P 3650 4250
F 0 "C?" H 3758 4395 45  0000 L CNN
F 1 "0.1 uF" H 3758 4311 45  0000 L CNN
F 2 "0603" H 3650 4500 20  0001 C CNN
F 3 "" H 3650 4250 50  0001 C CNN
F 4 "CAP-08280" V 3758 4216 60  0001 L CNN "Field4"
	1    3650 4250
	0    1    1    0   
$EndComp
Connection ~ 3550 4250
$Comp
L SparkFun-Capacitors:4.7UF0603 C?
U 1 1 5ED6F7F8
P 4550 4250
F 0 "C?" H 4658 4395 45  0000 L CNN
F 1 "0.1 uF" H 4658 4311 45  0000 L CNN
F 2 "0603" H 4550 4500 20  0001 C CNN
F 3 "" H 4550 4250 50  0001 C CNN
F 4 "CAP-08280" V 4658 4216 60  0001 L CNN "Field4"
	1    4550 4250
	0    1    1    0   
$EndComp
Connection ~ 4450 4250
$Comp
L power:GND #PWR?
U 1 1 5ED6FEF6
P 4750 4250
F 0 "#PWR?" H 4750 4250 30  0001 C CNN
F 1 "GND" H 4750 4180 30  0001 C CNN
F 2 "" H 4750 4250 50  0001 C CNN
F 3 "" H 4750 4250 50  0001 C CNN
	1    4750 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED70604
P 3850 4250
F 0 "#PWR?" H 3850 4250 30  0001 C CNN
F 1 "GND" H 3850 4180 30  0001 C CNN
F 2 "" H 3850 4250 50  0001 C CNN
F 3 "" H 3850 4250 50  0001 C CNN
	1    3850 4250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
