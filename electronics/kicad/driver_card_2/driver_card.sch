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
L SparkFun-PowerSymbols:3.3V #SUPPLY0104
U 1 1 5F0DCA50
P 5600 1600
F 0 "#SUPPLY0104" H 5650 1600 45  0001 L BNN
F 1 "3.3V" V 5600 1728 45  0000 L CNN
F 2 "" V 5558 1727 60  0000 L CNN
F 3 "" H 5600 1600 60  0001 C CNN
	1    5600 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 3650 7950 3350
Wire Wire Line
	7550 5200 7550 4800
Wire Wire Line
	4400 5400 4400 5650
$Comp
L SparkFun-Capacitors:4.7UF0603 C1
U 1 1 5F0C3B35
P 6450 1900
F 0 "C1" V 6216 1950 45  0000 C CNN
F 1 "10 nF" V 6300 1950 45  0000 C CNN
F 2 "0603" H 6450 2150 20  0001 C CNN
F 3 "" H 6450 1900 50  0001 C CNN
F 4 "" H 6558 1866 60  0000 L CNN "Field4"
	1    6450 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6800 2200 7100 2200
$Comp
L SparkFun-Resistors:RESISTOR0402 R12
U 1 1 5F0BDCCE
P 5600 1800
F 0 "R12" V 5695 1732 45  0000 R CNN
F 1 "10K" V 5611 1732 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5600 1950 20  0001 C CNN
F 3 "" H 5600 1800 60  0001 C CNN
F 4 " " V 5516 1732 60  0000 R CNN "Field4"
	1    5600 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 4500 8450 4500
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0103
U 1 1 5F0B2EDF
P 4800 5400
F 0 "#SUPPLY0103" H 4850 5400 45  0001 L BNN
F 1 "3.3V" V 4800 5528 45  0000 L CNN
F 2 "" V 4758 5527 60  0000 L CNN
F 3 "" H 4800 5400 60  0001 C CNN
	1    4800 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 4600 4400 5000
$Comp
L SparkFun-Resistors:RESISTOR0402 R14
U 1 1 5F0A6B67
P 4400 5200
F 0 "R14" V 4495 5132 45  0000 R CNN
F 1 "1K" V 4411 5132 45  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4400 5350 20  0001 C CNN
F 3 "" H 4400 5200 60  0001 C CNN
F 4 " " V 4316 5132 60  0000 R CNN "Field4"
	1    4400 5200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5F0A6B60
P 4100 5000
F 0 "#PWR0117" H 4100 5000 30  0001 C CNN
F 1 "GND" H 4100 4930 30  0001 C CNN
F 2 "" H 4100 5000 50  0001 C CNN
F 3 "" H 4100 5000 50  0001 C CNN
	1    4100 5000
	1    0    0    -1  
$EndComp
Connection ~ 4400 5000
$Comp
L SparkFun-Capacitors:4.7UF0603 C9
U 1 1 5F0A6B5A
P 4200 5000
F 0 "C9" V 3966 5050 45  0000 C CNN
F 1 "10 uF" V 4050 5050 45  0000 C CNN
F 2 "0603" H 4200 5250 20  0001 C CNN
F 3 "" H 4200 5000 50  0001 C CNN
F 4 "" H 4308 4966 60  0000 L CNN "Field4"
	1    4200 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 4500 8150 4800
Connection ~ 8150 4500
Wire Wire Line
	8150 4250 8150 4500
$Comp
L SparkFun-Resistors:RESISTOR0402 R17
U 1 1 5F09ED98
P 7950 4800
F 0 "R17" V 7855 4868 45  0000 L CNN
F 1 "2.2r" V 7939 4868 45  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7950 4950 20  0001 C CNN
F 3 "" H 7950 4800 60  0001 C CNN
F 4 " " V 8034 4868 60  0000 L CNN "Field4"
	1    7950 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 4300 4200 4300
Connection ~ 4400 5400
$Comp
L SparkFun-Resistors:RESISTOR0402 R15
U 1 1 5F085785
P 4600 5400
F 0 "R15" V 4505 5468 45  0000 L CNN
F 1 "10K" V 4589 5468 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4600 5550 20  0001 C CNN
F 3 "" H 4600 5400 60  0001 C CNN
F 4 " " V 4684 5468 60  0000 L CNN "Field4"
	1    4600 5400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F0715F5
P 8250 4050
F 0 "#PWR0115" H 8250 4050 30  0001 C CNN
F 1 "GND" H 8250 3980 30  0001 C CNN
F 2 "" H 8250 4050 50  0001 C CNN
F 3 "" H 8250 4050 50  0001 C CNN
	1    8250 4050
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0102
U 1 1 5F06F21D
P 7650 4050
F 0 "#SUPPLY0102" H 7700 4050 45  0001 L BNN
F 1 "3.3V" V 7650 4178 45  0000 L CNN
F 2 "" V 7608 4177 60  0000 L CNN
F 3 "" H 7650 4050 60  0001 C CNN
	1    7650 4050
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0101
U 1 1 5F06D0A6
P 4000 4300
F 0 "#SUPPLY0101" H 4050 4300 45  0001 L BNN
F 1 "3.3V" V 4000 4428 45  0000 L CNN
F 2 "" V 3958 4427 60  0000 L CNN
F 3 "" H 4000 4300 60  0001 C CNN
	1    4000 4300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F06BB87
P 7650 3750
F 0 "#PWR0112" H 7650 3750 30  0001 C CNN
F 1 "GND" H 7650 3680 30  0001 C CNN
F 2 "" H 7650 3750 50  0001 C CNN
F 3 "" H 7650 3750 50  0001 C CNN
	1    7650 3750
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C10
U 1 1 5F06AAD3
P 7650 3950
F 0 "C10" V 7416 4000 45  0000 C CNN
F 1 "0.1 uF" V 7500 4000 45  0000 C CNN
F 2 "0603" H 7650 4200 20  0001 C CNN
F 3 "" H 7650 3950 50  0001 C CNN
F 4 "" H 7758 3916 60  0000 L CNN "Field4"
	1    7650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4250 7850 4250
Wire Wire Line
	8150 4250 8050 4250
Connection ~ 7650 4050
$Comp
L Amplifier_Current:INA194 U2
U 1 1 5F064800
P 7950 3950
F 0 "U2" H 8294 3996 50  0000 L CNN
F 1 "INA194" H 8294 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7950 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina193.pdf" H 7950 3950 50  0001 C CNN
	1    7950 3950
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R13
U 1 1 5F05AE24
P 6800 2400
F 0 "R13" V 6895 2332 45  0000 R CNN
F 1 "1k" V 6811 2332 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6800 2550 20  0001 C CNN
F 3 "" H 6800 2400 60  0001 C CNN
F 4 " " V 6716 2332 60  0000 R CNN "Field4"
	1    6800 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 4800 7750 4500
Wire Wire Line
	7750 4500 7750 4250
Connection ~ 7750 4500
$Comp
L SparkFun-Resistors:RESISTOR0402 R16
U 1 1 5F048AA5
P 7950 4500
F 0 "R16" V 7855 4568 45  0000 L CNN
F 1 "2.2r" V 7939 4568 45  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7950 4650 20  0001 C CNN
F 3 "" H 7950 4500 60  0001 C CNN
F 4 " " V 8034 4568 60  0000 L CNN "Field4"
	1    7950 4500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EE3A599
P 6450 2100
F 0 "#PWR0104" H 6450 2100 30  0001 C CNN
F 1 "GND" H 6450 2030 30  0001 C CNN
F 2 "" H 6450 2100 50  0001 C CNN
F 3 "" H 6450 2100 50  0001 C CNN
	1    6450 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EF8058D
P 5900 2200
F 0 "#PWR0110" H 5900 2200 30  0001 C CNN
F 1 "GND" H 5900 2130 30  0001 C CNN
F 2 "" H 5900 2200 50  0001 C CNN
F 3 "" H 5900 2200 50  0001 C CNN
	1    5900 2200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5EF6BA12
P 5800 2000
F 0 "Q1" H 6006 2046 50  0000 L CNN
F 1 "2N7002" H 6006 1955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6000 1925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5800 2000 50  0001 L CNN
	1    5800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1800 6800 1800
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R9
U 1 1 5EF6F186
P 5900 1600
F 0 "R9" V 5995 1532 45  0000 R CNN
F 1 "30k" V 5911 1532 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5900 1750 20  0001 C CNN
F 3 "" H 5900 1600 60  0001 C CNN
F 4 " " V 5816 1532 60  0000 R CNN "Field4"
	1    5900 1600
	0    -1   -1   0   
$EndComp
Connection ~ 6450 1800
$Comp
L SparkFun-Resistors:RESISTOR0402 R10
U 1 1 5EF918DB
P 6250 1800
F 0 "R10" V 6345 1732 45  0000 R CNN
F 1 "1k" V 6261 1732 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6250 1950 20  0001 C CNN
F 3 "" H 6250 1800 60  0001 C CNN
F 4 " " V 6166 1732 60  0000 R CNN "Field4"
	1    6250 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5900 1800 6050 1800
Connection ~ 5900 1800
Connection ~ 6800 2200
$Comp
L SparkFun-Resistors:RESISTOR0402 R11
U 1 1 5EFCAE51
P 6800 2000
F 0 "R11" V 6895 1932 45  0000 R CNN
F 1 "30k" H 6811 1932 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6800 2150 20  0001 C CNN
F 3 "" H 6800 2000 60  0001 C CNN
F 4 " " V 6716 1932 60  0000 R CNN "Field4"
	1    6800 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5EFCD01D
P 6800 2600
F 0 "#PWR0111" H 6800 2600 30  0001 C CNN
F 1 "GND" H 6800 2530 30  0001 C CNN
F 2 "" H 6800 2600 50  0001 C CNN
F 3 "" H 6800 2600 50  0001 C CNN
	1    6800 2600
	1    0    0    -1  
$EndComp
Text GLabel 8500 4500 2    50   Input ~ 0
nsource
$Comp
L Transistor_FET:BSS84 Q3
U 1 1 5EFA7A24
P 7550 4600
F 0 "Q3" H 7756 4646 50  0000 L CNN
F 1 "BSS84" H 7756 4555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7750 4525 50  0001 L CIN
F 3 "http://assets.nexperia.com/documents/data-sheet/BSS84.pdf" H 7550 4600 50  0001 L CNN
	1    7550 4600
	0    1    -1   0   
$EndComp
Text GLabel 3350 2950 2    50   Input ~ 0
~VARACTOR_PWM
Text GLabel 3350 3150 2    50   Input ~ 0
VARACTOR_FEEDBACK
Text GLabel 3350 2800 2    50   Input ~ 0
BIAS_PWM
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0105
U 1 1 5F1E0DE3
P 3350 3550
F 0 "#SUPPLY0105" H 3400 3550 45  0001 L BNN
F 1 "3.3V" V 3350 3678 45  0000 L CNN
F 2 "" V 3308 3677 60  0000 L CNN
F 3 "" H 3350 3550 60  0001 C CNN
	1    3350 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F1E1833
P 3350 3750
F 0 "#PWR0101" H 3350 3750 30  0001 C CNN
F 1 "GND" H 3350 3680 30  0001 C CNN
F 2 "" H 3350 3750 50  0001 C CNN
F 3 "" H 3350 3750 50  0001 C CNN
	1    3350 3750
	0    -1   -1   0   
$EndComp
Text GLabel 5600 2000 0    50   Input ~ 0
~VARACTOR_PWM
Text GLabel 7100 2200 2    50   Input ~ 0
VARACTOR_FEEDBACK
Text GLabel 7950 3350 1    50   Input ~ 0
CURRENT_SENSE
Text GLabel 3350 3050 2    50   Input ~ 0
CURRENT_SENSE
Text GLabel 4400 5650 3    50   Input ~ 0
VSOURCE_PWM
Text GLabel 3350 3650 2    50   Input ~ 0
VSOURCE_PWM
$Comp
L SparkFun-Connectors:CONN_10SMD_MALE J1
U 1 1 5F1EC410
P 3250 3750
F 0 "J1" H 3208 4854 45  0000 C CNN
F 1 "CONN_10SMD_MALE" H 3208 4770 45  0000 C CNN
F 2 "1X10_SMD_MALE" H 3250 4850 20  0001 C CNN
F 3 "" H 3250 3750 50  0001 C CNN
F 4 "" H 3208 4781 60  0000 C CNN "Field4"
	1    3250 3750
	1    0    0    -1  
$EndComp
Text GLabel 3350 3450 2    50   Input ~ 0
source_supply_feedback
Text GLabel 3350 3350 2    50   Input ~ 0
pulse_feedback
Wire Wire Line
	3350 2850 3350 2800
$Comp
L power2:+48V #PWR0103
U 1 1 5F20FDFE
P 3450 1850
F 0 "#PWR0103" H 3450 1700 50  0001 C CNN
F 1 "+48V" V 3465 1978 50  0000 L CNN
F 2 "" H 3450 1850 50  0001 C CNN
F 3 "" H 3450 1850 50  0001 C CNN
	1    3450 1850
	0    1    1    0   
$EndComp
$Comp
L power2:+48V #PWR0105
U 1 1 5F211AFB
P 5900 1400
F 0 "#PWR0105" H 5900 1250 50  0001 C CNN
F 1 "+48V" H 5915 1573 50  0000 C CNN
F 2 "" H 5900 1400 50  0001 C CNN
F 3 "" H 5900 1400 50  0001 C CNN
	1    5900 1400
	1    0    0    -1  
$EndComp
Text Notes 8300 6200 0    50   ~ 0
Originally used a P-channel in the linear region,\nbut at 3.3v, the Safe Operating Area at DC of the BSS84-F \nonly goes up to 50 mA - remarkable!
$Comp
L dk_Transistors-Bipolar-BJT-Single:MMBT4401 Q2
U 1 1 5EE95D01
P 4400 4400
F 0 "Q2" V 4747 4400 60  0000 C CNN
F 1 "MMBT4401" V 4641 4400 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 4600 4600 60  0001 L CNN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N4401.pdf" H 4600 4700 60  0001 L CNN
F 4 "MMBT4401FSCT-ND" H 4600 4800 60  0001 L CNN "Digi-Key_PN"
F 5 "MMBT4401" H 4600 4900 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4600 5000 60  0001 L CNN "Category"
F 7 "Transistors - Bipolar (BJT) - Single" H 4600 5100 60  0001 L CNN "Family"
F 8 "https://www.fairchildsemi.com/datasheets/2N/2N4401.pdf" H 4600 5200 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/MMBT4401/MMBT4401FSCT-ND/458974" H 4600 5300 60  0001 L CNN "DK_Detail_Page"
F 10 "TRANS NPN 40V 0.6A SOT-23" H 4600 5400 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 4600 5500 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4600 5600 60  0001 L CNN "Status"
	1    4400 4400
	0    -1   -1   0   
$EndComp
Text GLabel 8450 4700 2    50   Input ~ 0
pulse_feedback
Wire Wire Line
	8450 4500 8450 4700
Connection ~ 8450 4500
Wire Wire Line
	8450 4500 8500 4500
$Comp
L SparkFun-Capacitors:4.7UF0603 C2
U 1 1 5EEA123E
P 4000 4400
F 0 "C2" V 3766 4450 45  0000 C CNN
F 1 "0.1 uF" V 3850 4450 45  0000 C CNN
F 2 "0603" H 4000 4650 20  0001 C CNN
F 3 "" H 4000 4400 50  0001 C CNN
F 4 "" H 4108 4366 60  0000 L CNN "Field4"
	1    4000 4400
	-1   0    0    1   
$EndComp
Connection ~ 4000 4300
$Comp
L power:GND #PWR0102
U 1 1 5EEA228C
P 4000 4600
F 0 "#PWR0102" H 4000 4600 30  0001 C CNN
F 1 "GND" H 4000 4530 30  0001 C CNN
F 2 "" H 4000 4600 50  0001 C CNN
F 3 "" H 4000 4600 50  0001 C CNN
	1    4000 4600
	1    0    0    -1  
$EndComp
Text GLabel 4650 3250 0    50   Input ~ 0
BIAS_PWM
$Comp
L Connector:Test_Point TP1
U 1 1 5EEB43DF
P 3450 1850
F 0 "TP1" H 3508 1968 50  0000 L CNN
F 1 "Test_Point" H 3508 1877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3650 1850 50  0001 C CNN
F 3 "~" H 3650 1850 50  0001 C CNN
	1    3450 1850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Test_Point TP2
U 1 1 5EEBBE60
P 4650 3250
F 0 "TP2" H 4708 3368 50  0000 L CNN
F 1 "Test_Point" H 4708 3277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4850 3250 50  0001 C CNN
F 3 "~" H 4850 3250 50  0001 C CNN
	1    4650 3250
	0    1    1    0   
$EndComp
Text GLabel 3350 3250 2    50   Input ~ 0
~PULSE_INPUT
$Comp
L Connector:Test_Point TP3
U 1 1 5EEC794F
P 7400 1550
F 0 "TP3" H 7458 1668 50  0000 L CNN
F 1 "Test_Point" H 7458 1577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 7600 1550 50  0001 C CNN
F 3 "~" H 7600 1550 50  0001 C CNN
	1    7400 1550
	0    1    1    0   
$EndComp
Text GLabel 6800 1800 2    50   Input ~ 0
VARACTOR_OUT
Text GLabel 7400 1550 0    50   Input ~ 0
VARACTOR_OUT
$Comp
L Connector:Test_Point TP4
U 1 1 5EECA2A9
P 9600 4550
F 0 "TP4" H 9658 4668 50  0000 L CNN
F 1 "Test_Point" H 9658 4577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9800 4550 50  0001 C CNN
F 3 "~" H 9800 4550 50  0001 C CNN
	1    9600 4550
	0    1    1    0   
$EndComp
Text GLabel 9600 4550 0    50   Input ~ 0
nsource
Text Notes 7900 1150 0    50   ~ 0
We could use an op-amp to provide the feedback \nfor both of these circuits, lessening the load on the Teensy,\nbut whatever
Wire Wire Line
	6050 1800 6450 1800
Connection ~ 6050 1800
$Comp
L SparkFun-Capacitors:4.7UF0603 C?
U 1 1 5EEF63C1
P 6400 1400
F 0 "C?" V 6166 1450 45  0000 C CNN
F 1 "0.1 uF" V 6250 1450 45  0000 C CNN
F 2 "0603" H 6400 1650 20  0001 C CNN
F 3 "" H 6400 1400 50  0001 C CNN
F 4 "" H 6508 1366 60  0000 L CNN "Field4"
	1    6400 1400
	0    1    1    0   
$EndComp
$Comp
L power2:+48V #PWR?
U 1 1 5EEF78EF
P 6300 1400
F 0 "#PWR?" H 6300 1250 50  0001 C CNN
F 1 "+48V" H 6315 1573 50  0000 C CNN
F 2 "" H 6300 1400 50  0001 C CNN
F 3 "" H 6300 1400 50  0001 C CNN
	1    6300 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEF7C9B
P 6600 1400
F 0 "#PWR?" H 6600 1400 30  0001 C CNN
F 1 "GND" H 6600 1330 30  0001 C CNN
F 2 "" H 6600 1400 50  0001 C CNN
F 3 "" H 6600 1400 50  0001 C CNN
	1    6600 1400
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5EFC0015
P 5450 4500
F 0 "R?" V 5545 4432 45  0000 R CNN
F 1 "1K" V 5461 4432 45  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5450 4650 20  0001 C CNN
F 3 "" H 5450 4500 60  0001 C CNN
F 4 " " V 5366 4432 60  0000 R CNN "Field4"
	1    5450 4500
	0    -1   -1   0   
$EndComp
Connection ~ 5450 4300
Wire Wire Line
	5450 4300 5700 4300
Wire Wire Line
	4600 4300 5450 4300
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5EFC6FC4
P 5450 4900
F 0 "R?" V 5545 4832 45  0000 R CNN
F 1 "1K" V 5461 4832 45  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5450 5050 20  0001 C CNN
F 3 "" H 5450 4900 60  0001 C CNN
F 4 " " V 5366 4832 60  0000 R CNN "Field4"
	1    5450 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFC8033
P 5450 5100
F 0 "#PWR?" H 5450 5100 30  0001 C CNN
F 1 "GND" H 5450 5030 30  0001 C CNN
F 2 "" H 5450 5100 50  0001 C CNN
F 3 "" H 5450 5100 50  0001 C CNN
	1    5450 5100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-IC-Conversion:MCP4725SOT-23 U?
U 1 1 5EFD9BA3
P 6050 6350
F 0 "U?" H 6050 6704 45  0000 C CNN
F 1 "MCP4725SOT-23" H 6050 6620 45  0000 C CNN
F 2 "SOT23-6" H 6050 6650 20  0001 C CNN
F 3 "" H 6050 6350 50  0001 C CNN
F 4 "" H 6050 6631 60  0000 C CNN "Field4"
	1    6050 6350
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Gate-Drivers:MCP1416T-E_OT U?
U 1 1 5EFC2AA9
P 7150 5300
F 0 "U?" H 7594 5403 60  0000 L CNN
F 1 "MCP1416T-E_OT" H 7594 5297 60  0000 L CNN
F 2 "digikey-footprints:SOT-753" H 7350 5500 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 7350 5600 60  0001 L CNN
F 4 "MCP1416T-E/OTCT-ND" H 7350 5700 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP1416T-E/OT" H 7350 5800 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7350 5900 60  0001 L CNN "Category"
F 7 "PMIC - Gate Drivers" H 7350 6000 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 7350 6100 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP1416T-E-OT/MCP1416T-E-OTCT-ND/1963940" H 7350 6200 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MOSFET DVR 1.5A HS SOT23-5" H 7350 6300 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 7350 6400 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7350 6500 60  0001 L CNN "Status"
	1    7150 5300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
