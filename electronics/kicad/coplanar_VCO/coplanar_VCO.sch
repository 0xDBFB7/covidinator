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
L 0xDBFB7:HMC732 U2
U 1 1 5F7369B2
P 3150 3350
F 0 "U2" H 3125 3315 50  0000 C CNN
F 1 "HMC732" H 3125 3224 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 3150 3350 50  0001 C CNN
F 3 "" H 3150 3350 50  0001 C CNN
	1    3150 3350
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C5
U 1 1 5F7AC4E2
P 2250 4800
F 0 "C5" H 2358 4892 45  0000 L CNN
F 1 "1 nF" H 2358 4808 45  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2250 5050 20  0001 C CNN
F 3 "" H 2250 4800 50  0001 C CNN
F 4 "" H 2358 4766 60  0000 L CNN "Field4"
	1    2250 4800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY07
U 1 1 5F7ADBAB
P 2700 3800
F 0 "#SUPPLY07" H 2750 3800 45  0001 L BNN
F 1 "5V" V 2700 3927 45  0000 L CNN
F 2 "" V 2742 3928 60  0000 L CNN
F 3 "" H 2700 3800 60  0001 C CNN
	1    2700 3800
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY04
U 1 1 5F7AF25B
P 2250 4600
F 0 "#SUPPLY04" H 2300 4600 45  0001 L BNN
F 1 "5V" V 2250 4727 45  0000 L CNN
F 2 "" V 2292 4728 60  0000 L CNN
F 3 "" H 2250 4600 60  0001 C CNN
	1    2250 4600
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C2
U 1 1 5F7B2CEB
P 1550 4800
F 0 "C2" H 1658 4892 45  0000 L CNN
F 1 "0.1 uF" H 1658 4808 45  0000 L CNN
F 2 "0603" H 1550 5050 20  0001 C CNN
F 3 "" H 1550 4800 50  0001 C CNN
F 4 "" H 1658 4766 60  0000 L CNN "Field4"
	1    1550 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F7B2CF7
P 1550 4900
F 0 "#PWR02" H 1550 4900 30  0001 C CNN
F 1 "GND" H 1550 4830 30  0001 C CNN
F 2 "" H 1550 4900 50  0001 C CNN
F 3 "" H 1550 4900 50  0001 C CNN
	1    1550 4900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY02
U 1 1 5F7B2D77
P 1550 4600
F 0 "#SUPPLY02" H 1600 4600 45  0001 L BNN
F 1 "5V" V 1550 4728 45  0000 L CNN
F 2 "" V 1592 4728 60  0000 L CNN
F 3 "" H 1550 4600 60  0001 C CNN
	1    1550 4600
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5F7B3DBB
P 2700 3900
F 0 "#PWR010" H 2700 3900 30  0001 C CNN
F 1 "GND" H 2700 3830 30  0001 C CNN
F 2 "" H 2700 3900 50  0001 C CNN
F 3 "" H 2700 3900 50  0001 C CNN
	1    2700 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F7B43A4
P 2700 4000
F 0 "#PWR011" H 2700 4000 30  0001 C CNN
F 1 "GND" H 2700 3930 30  0001 C CNN
F 2 "" H 2700 4000 50  0001 C CNN
F 3 "" H 2700 4000 50  0001 C CNN
	1    2700 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F7B5B6D
P 2250 4900
F 0 "#PWR05" H 2250 4900 30  0001 C CNN
F 1 "GND" H 2250 4830 30  0001 C CNN
F 2 "" H 2250 4900 50  0001 C CNN
F 3 "" H 2250 4900 50  0001 C CNN
	1    2250 4900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_01 J2
U 1 1 5F806CC2
P 2250 2600
F 0 "J2" H 2208 2804 45  0000 C CNN
F 1 "CONN_01" H 2208 2720 45  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 2250 2800 20  0001 C CNN
F 3 "" H 2250 2600 50  0001 C CNN
F 4 "" H 2208 2731 60  0000 C CNN "Field4"
	1    2250 2600
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY06
U 1 1 5F8072BD
P 2350 2600
F 0 "#SUPPLY06" H 2400 2600 45  0001 L BNN
F 1 "5V" V 2350 2728 45  0000 L CNN
F 2 "" V 2392 2728 60  0000 L CNN
F 3 "" H 2350 2600 60  0001 C CNN
	1    2350 2600
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-Connectors:CONN_01 J1
U 1 1 5F807819
P 850 3650
F 0 "J1" H 808 3854 45  0000 C CNN
F 1 "CONN_01" H 808 3770 45  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 850 3850 20  0001 C CNN
F 3 "" H 850 3650 50  0001 C CNN
F 4 "" H 808 3781 60  0000 C CNN "Field4"
	1    850  3650
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C4
U 1 1 5F80A53E
P 1350 3850
F 0 "C4" H 1458 3942 45  0000 L CNN
F 1 "0.1 uF" H 1458 3858 45  0000 L CNN
F 2 "0603" H 1350 4100 20  0001 C CNN
F 3 "" H 1350 3850 50  0001 C CNN
F 4 "" H 1458 3816 60  0000 L CNN "Field4"
	1    1350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F80A9C8
P 1350 3950
F 0 "#PWR04" H 1350 3950 30  0001 C CNN
F 1 "GND" H 1350 3880 30  0001 C CNN
F 2 "" H 1350 3950 50  0001 C CNN
F 3 "" H 1350 3950 50  0001 C CNN
	1    1350 3950
	1    0    0    -1  
$EndComp
Text Notes 750  6800 0    50   ~ 0
On this part the N/C pins are truly not connected; for ease of layout they're manually set to ground on the PCB.
Wire Wire Line
	4950 4000 5050 4000
$Comp
L power:GND #PWR032
U 1 1 5EE45343
P 4650 3200
F 0 "#PWR032" H 4650 3200 30  0001 C CNN
F 1 "GND" H 4650 3130 30  0001 C CNN
F 2 "" H 4650 3200 50  0001 C CNN
F 3 "" H 4650 3200 50  0001 C CNN
	1    4650 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 2700 5400 2700
$Comp
L SparkFun-Capacitors:4.7UF0603 C22
U 1 1 5EE4533B
P 4850 3200
F 0 "C22" V 4616 3250 45  0000 C CNN
F 1 "10 nF" V 4700 3250 45  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4850 3450 20  0001 C CNN
F 3 "" H 4850 3200 50  0001 C CNN
F 4 "" H 4958 3166 60  0000 L CNN "Field4"
	1    4850 3200
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L1
U 1 1 5EE07869
P 4950 3400
F 0 "L1" H 5003 3442 45  0000 L CNN
F 1 "220 nH" H 5003 3358 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4950 3650 20  0001 C CNN
F 3 "" H 4950 3400 50  0001 C CNN
F 4 "" H 5002 3316 60  0000 L CNN "Field4"
	1    4950 3400
	1    0    0    -1  
$EndComp
Text GLabel 5400 2700 2    50   Input ~ 0
nsource
$Comp
L power:GND #PWR036
U 1 1 5EF81D29
P 4950 4000
F 0 "#PWR036" H 4950 4000 30  0001 C CNN
F 1 "GND" H 4950 3930 30  0001 C CNN
F 2 "" H 4950 4000 50  0001 C CNN
F 3 "" H 4950 4000 50  0001 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R1
U 1 1 5F960EE5
P 1150 3650
F 0 "R1" V 1055 3718 45  0000 L CNN
F 1 "10k" V 1139 3718 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1150 3800 20  0001 C CNN
F 3 "" H 1150 3650 60  0001 C CNN
F 4 " " V 1234 3718 60  0000 L CNN "Field4"
	1    1150 3650
	1    0    0    -1  
$EndComp
$Comp
L 0xDBFB7:CE3520K3 U7
U 1 1 5F97ADF9
P 4950 3800
F 0 "U7" H 5094 3846 50  0000 L CNN
F 1 "CE3520K3" H 5094 3755 50  0000 L CNN
F 2 "0xDBFB7:4-Micro-X" H 4950 3800 50  0001 C CNN
F 3 "" H 4950 3800 50  0001 C CNN
	1    4950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2700 4950 2750
Connection ~ 4950 3200
Connection ~ 4950 3600
Connection ~ 4950 4000
$Comp
L SparkFun-Capacitors:4.7UF0603 C23
U 1 1 5F355F2B
P 5050 3200
F 0 "C23" V 4816 3250 45  0000 C CNN
F 1 "1 nF" V 4900 3250 45  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5050 3450 20  0001 C CNN
F 3 "" H 5050 3200 50  0001 C CNN
F 4 "" H 5158 3166 60  0000 L CNN "Field4"
	1    5050 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5F3567EF
P 5250 3200
F 0 "#PWR040" H 5250 3200 30  0001 C CNN
F 1 "GND" H 5250 3130 30  0001 C CNN
F 2 "" H 5250 3200 50  0001 C CNN
F 3 "" H 5250 3200 50  0001 C CNN
	1    5250 3200
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C8
U 1 1 5F36297B
P 2050 3850
F 0 "C8" H 2158 3942 45  0000 L CNN
F 1 "1 nF" H 2158 3858 45  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2050 4100 20  0001 C CNN
F 3 "" H 2050 3850 50  0001 C CNN
F 4 "" H 2158 3816 60  0000 L CNN "Field4"
	1    2050 3850
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C6
U 1 1 5F363168
P 2250 5350
F 0 "C6" H 2358 5442 45  0000 L CNN
F 1 "1 nF" H 2358 5358 45  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2250 5600 20  0001 C CNN
F 3 "" H 2250 5350 50  0001 C CNN
F 4 "" H 2358 5316 60  0000 L CNN "Field4"
	1    2250 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F374179
P 2250 5450
F 0 "#PWR06" H 2250 5450 30  0001 C CNN
F 1 "GND" H 2250 5380 30  0001 C CNN
F 2 "" H 2250 5450 50  0001 C CNN
F 3 "" H 2250 5450 50  0001 C CNN
	1    2250 5450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY05
U 1 1 5F374BFA
P 2250 5150
F 0 "#SUPPLY05" H 2300 5150 45  0001 L BNN
F 1 "5V" V 2250 5277 45  0000 L CNN
F 2 "" V 2292 5278 60  0000 L CNN
F 3 "" H 2250 5150 60  0001 C CNN
	1    2250 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 3650 2050 3650
$Comp
L power:GND #PWR08
U 1 1 5F37BD1F
P 2050 3950
F 0 "#PWR08" H 2050 3950 30  0001 C CNN
F 1 "GND" H 2050 3880 30  0001 C CNN
F 2 "" H 2050 3950 50  0001 C CNN
F 3 "" H 2050 3950 50  0001 C CNN
	1    2050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3650 1350 3650
Connection ~ 2050 3650
Connection ~ 1350 3650
$Comp
L SparkFun-Resistors:RESISTOR0402 R10
U 1 1 5F3970DF
P 4650 4000
F 0 "R10" V 4555 3932 45  0000 R CNN
F 1 "10k" V 4639 3932 45  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4650 4150 20  0001 C CNN
F 3 "" H 4650 4000 60  0001 C CNN
F 4 " " V 4734 3932 60  0000 R CNN "Field4"
	1    4650 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR033
U 1 1 5F39CCF9
P 4650 4200
F 0 "#PWR033" H 4650 4200 30  0001 C CNN
F 1 "GND" H 4650 4130 30  0001 C CNN
F 2 "" H 4650 4200 50  0001 C CNN
F 3 "" H 4650 4200 50  0001 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
Text Notes 750  7450 0    50   ~ 0
"since the detector does not conserve phase information, all phasors that appear as factors can be replaced by their magnitudes." - *happiness noise*
Text Notes 750  7300 0    50   ~ 0
RF diode detector based on infineon appnote AN_1807.
Text Notes 750  7100 0    50   ~ 0
Stub lengths < 7 mm probably don't need termination; see Shockman, termination.\nIn fact, the reflection overshoot will aid getting the signal levels between the thresholds.
Wire Wire Line
	4650 3800 4700 3800
$Comp
L Connector:Test_Point TPSO1
U 1 1 5F45EF57
P 4250 1500
F 0 "TPSO1" H 4308 1618 50  0000 L CNN
F 1 "Vsource" H 4308 1527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 4450 1500 50  0001 C CNN
F 3 "~" H 4450 1500 50  0001 C CNN
F 4 "V" H 4250 1500 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20p 5p 1p 1 1)" H 4250 1500 50  0001 C CNN "Spice_Model"
F 6 "N" H 4250 1500 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4250 1500
	1    0    0    -1  
$EndComp
Text GLabel 4250 1650 2    50   Input ~ 0
nsource
Wire Wire Line
	4250 1500 4250 1650
Wire Wire Line
	4950 3600 6000 3600
$Comp
L power:GND #PWR0101
U 1 1 5F6EE06F
P 7250 1950
F 0 "#PWR0101" H 7250 1950 30  0001 C CNN
F 1 "GND" H 7250 1880 30  0001 C CNN
F 2 "" H 7250 1950 50  0001 C CNN
F 3 "" H 7250 1950 50  0001 C CNN
	1    7250 1950
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C10
U 1 1 5F6EE076
P 7050 2250
F 0 "C10" V 6816 2300 45  0000 C CNN
F 1 "1 nF" V 6900 2300 45  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7050 2500 20  0001 C CNN
F 3 "" H 7050 2250 50  0001 C CNN
F 4 "" H 7158 2216 60  0000 L CNN "Field4"
	1    7050 2250
	0    -1   -1   0   
$EndComp
$Comp
L Diode:BAS40-04 D3
U 1 1 5F6EE07C
P 6950 2900
F 0 "D3" H 6950 3225 50  0000 C CNN
F 1 "BAT15-04" H 6950 3134 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6700 3200 50  0001 L CNN
F 3 "http://www.vishay.com/docs/85701/bas40v.pdf" H 6830 3000 50  0001 C CNN
	1    6950 2900
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R5
U 1 1 5F6EE083
P 7050 1950
F 0 "R5" V 6955 2018 45  0000 L CNN
F 1 "10k" V 7039 2018 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7050 2100 20  0001 C CNN
F 3 "" H 7050 1950 60  0001 C CNN
F 4 " " V 7134 2018 60  0000 L CNN "Field4"
	1    7050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2600 6850 2250
Wire Wire Line
	6850 2250 6850 1950
Connection ~ 6850 2250
$Comp
L conn:CONN_1 P6
U 1 1 5F6EE08C
P 6850 850
F 0 "P6" H 6783 753 40  0000 C CNN
F 1 "a" H 6800 890 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6850 850 50  0001 C CNN
F 3 "" H 6850 850 50  0001 C CNN
	1    6850 850 
	0    -1   -1   0   
$EndComp
Connection ~ 6850 1950
$Comp
L power:GND #PWR0102
U 1 1 5F6EE093
P 7150 2250
F 0 "#PWR0102" H 7150 2250 30  0001 C CNN
F 1 "GND" H 7150 2180 30  0001 C CNN
F 2 "" H 7150 2250 50  0001 C CNN
F 3 "" H 7150 2250 50  0001 C CNN
	1    7150 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 2900 7050 3600
$Comp
L SparkFun-Capacitors:4.7UF0603 C9
U 1 1 5F6EE09B
P 7050 1000
F 0 "C9" V 6816 1050 45  0000 C CNN
F 1 "100 nF" V 6900 1050 45  0000 C CNN
F 2 "0603" H 7050 1250 20  0001 C CNN
F 3 "" H 7050 1000 50  0001 C CNN
F 4 "" H 7158 966 60  0000 L CNN "Field4"
	1    7050 1000
	0    -1   -1   0   
$EndComp
Connection ~ 6850 1000
Wire Wire Line
	6850 1700 6850 1950
$Comp
L power:GND #PWR0103
U 1 1 5F6EE0A3
P 7150 1000
F 0 "#PWR0103" H 7150 1000 30  0001 C CNN
F 1 "GND" H 7150 930 30  0001 C CNN
F 2 "" H 7150 1000 50  0001 C CNN
F 3 "" H 7150 1000 50  0001 C CNN
	1    7150 1000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6850 1000 6850 1300
$Comp
L SparkFun-Resistors:RESISTOR0402 R4
U 1 1 5F6EE0B1
P 6850 1500
F 0 "R4" V 6755 1568 45  0000 L CNN
F 1 "10k" V 6839 1568 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6850 1650 20  0001 C CNN
F 3 "" H 6850 1500 60  0001 C CNN
F 4 " " V 6934 1568 60  0000 L CNN "Field4"
	1    6850 1500
	0    1    1    0   
$EndComp
$Comp
L conn:CONN_1 P5
U 1 1 5F6EE0B7
P 6700 1950
F 0 "P5" H 6633 1853 40  0000 C CNN
F 1 "a" H 6650 1990 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6700 1950 50  0001 C CNN
F 3 "" H 6700 1950 50  0001 C CNN
	1    6700 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 3600 7050 3600
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C14
U 1 1 5F70201C
P 6100 3600
F 0 "C14" H 6208 3692 45  0000 L CNN
F 1 "1 nF" H 6208 3608 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6100 3850 20  0001 C CNN
F 3 "" H 6100 3600 50  0001 C CNN
F 4 "" H 6208 3566 60  0000 L CNN "Field4"
	1    6100 3600
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C15
U 1 1 5F7029B7
P 7400 3600
F 0 "C15" H 7508 3692 45  0000 L CNN
F 1 "1 nF" H 7508 3608 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7400 3850 20  0001 C CNN
F 3 "" H 7400 3600 50  0001 C CNN
F 4 "" H 7508 3566 60  0000 L CNN "Field4"
	1    7400 3600
	0    1    1    0   
$EndComp
Connection ~ 4650 3800
Wire Wire Line
	3550 3800 4650 3800
$Comp
L SparkFun-Capacitors:4.7UF0603 C1
U 1 1 5F7DF6C7
P 4850 2750
F 0 "C1" V 4616 2800 45  0000 C CNN
F 1 "100 nF" V 4700 2800 45  0000 C CNN
F 2 "0603" H 4850 3000 20  0001 C CNN
F 3 "" H 4850 2750 50  0001 C CNN
F 4 "" H 4958 2716 60  0000 L CNN "Field4"
	1    4850 2750
	0    -1   -1   0   
$EndComp
Connection ~ 4950 2750
Wire Wire Line
	4950 2750 4950 3200
$Comp
L power:GND #PWR0104
U 1 1 5F7E04C2
P 4650 2750
F 0 "#PWR0104" H 4650 2750 30  0001 C CNN
F 1 "GND" H 4650 2680 30  0001 C CNN
F 2 "" H 4650 2750 50  0001 C CNN
F 3 "" H 4650 2750 50  0001 C CNN
	1    4650 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3600 7050 3600
Connection ~ 7050 3600
$Comp
L SparkFun-Capacitors:4.7UF0603 C3
U 1 1 5F7E517E
P 5150 2750
F 0 "C3" V 4916 2800 45  0000 C CNN
F 1 "100 nF" V 5000 2800 45  0000 C CNN
F 2 "0603" H 5150 3000 20  0001 C CNN
F 3 "" H 5150 2750 50  0001 C CNN
F 4 "" H 5258 2716 60  0000 L CNN "Field4"
	1    5150 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5F7E5B50
P 5250 2750
F 0 "#PWR0105" H 5250 2750 30  0001 C CNN
F 1 "GND" H 5250 2680 30  0001 C CNN
F 2 "" H 5250 2750 50  0001 C CNN
F 3 "" H 5250 2750 50  0001 C CNN
	1    5250 2750
	0    -1   -1   0   
$EndComp
$EndSCHEMATC