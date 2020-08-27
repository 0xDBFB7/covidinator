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
L dk_PMIC-Voltage-Regulators-Linear:MC7805BDTRKG U3
U 1 1 5F738EF1
P 8250 2800
F 0 "U3" H 8250 3087 60  0000 C CNN
F 1 "BA78M20FP" H 8250 2981 60  0000 C CNN
F 2 "digikey-footprints:TO-252-3" H 8450 3000 60  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/MC7800-D.PDF" H 8450 3100 60  0001 L CNN
F 4 "MC7805BDTRKGOSCT-ND" H 8450 3200 60  0001 L CNN "Digi-Key_PN"
F 5 "MC7805BDTRKG" H 8450 3300 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 8450 3400 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 8450 3500 60  0001 L CNN "Family"
F 8 "http://www.onsemi.com/pub/Collateral/MC7800-D.PDF" H 8450 3600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/MC7805BDTRKG/MC7805BDTRKGOSCT-ND/1139742" H 8450 3700 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 5V 1A DPAK-3" H 8450 3800 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 8450 3900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8450 4000 60  0001 L CNN "Status"
	1    8250 2800
	1    0    0    -1  
$EndComp
Text GLabel 8550 2800 2    50   Input ~ 0
20V
$Comp
L SparkFun-IC-Amplifiers:LM358 U7
U 3 1 5F608589
P 4500 5250
F 0 "U7" H 4628 5292 45  0000 L CNN
F 1 "TLV2172IDR" H 4628 5208 45  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4500 5600 20  0001 C CNN
F 3 "" H 4500 5250 50  0001 C CNN
F 4 "" H 4628 5166 60  0000 L CNN "Field4"
	3    4500 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F6305B2
P 4500 5550
F 0 "#PWR017" H 4500 5550 30  0001 C CNN
F 1 "GND" H 4500 5480 30  0001 C CNN
F 2 "" H 4500 5550 50  0001 C CNN
F 3 "" H 4500 5550 50  0001 C CNN
	1    4500 5550
	1    0    0    -1  
$EndComp
$Comp
L w_connectors:HEADER_4 J2
U 1 1 5F73E64B
P 4650 3550
F 0 "J2" H 4778 3656 60  0000 L CNN
F 1 "PDSE1" H 4778 3550 60  0000 L CNN
F 2 "Connectors2:1X04_SMD_RA_FEMALE" H 4778 3444 60  0000 L CNN
F 3 "" H 4650 3550 60  0000 C CNN
	1    4650 3550
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F75028B
P 8250 3100
F 0 "#PWR05" H 8250 3100 30  0001 C CNN
F 1 "GND" H 8250 3030 30  0001 C CNN
F 2 "" H 8250 3100 50  0001 C CNN
F 3 "" H 8250 3100 50  0001 C CNN
	1    8250 3100
	1    0    0    -1  
$EndComp
Text GLabel 7950 2800 0    50   Input ~ 0
24V
$Comp
L SparkFun-Capacitors:1.0UF-1206-50V-10% C2
U 1 1 5F758FB8
P 8950 3000
F 0 "C2" H 9058 3092 45  0000 L CNN
F 1 "10uF" H 9058 3008 45  0000 L CNN
F 2 "1206" H 8950 3250 20  0001 C CNN
F 3 "" H 8950 3000 50  0001 C CNN
F 4 "" H 9058 2966 60  0000 L CNN "Field4"
	1    8950 3000
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C3
U 1 1 5F759D4A
P 9400 3000
F 0 "C3" H 9508 3092 45  0000 L CNN
F 1 "0.1 uF" H 9508 3008 45  0000 L CNN
F 2 "0603" H 9400 3250 20  0001 C CNN
F 3 "" H 9400 3000 50  0001 C CNN
F 4 "" H 9508 2966 60  0000 L CNN "Field4"
	1    9400 3000
	1    0    0    -1  
$EndComp
Text GLabel 9400 2800 2    50   Input ~ 0
20V
Wire Wire Line
	9400 2800 8950 2800
$Comp
L power:GND #PWR06
U 1 1 5F75C45A
P 8950 3100
F 0 "#PWR06" H 8950 3100 30  0001 C CNN
F 1 "GND" H 8950 3030 30  0001 C CNN
F 2 "" H 8950 3100 50  0001 C CNN
F 3 "" H 8950 3100 50  0001 C CNN
	1    8950 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F75C84F
P 9400 3100
F 0 "#PWR07" H 9400 3100 30  0001 C CNN
F 1 "GND" H 9400 3030 30  0001 C CNN
F 2 "" H 9400 3100 50  0001 C CNN
F 3 "" H 9400 3100 50  0001 C CNN
	1    9400 3100
	1    0    0    -1  
$EndComp
Text GLabel 4500 4950 2    50   Input ~ 0
20V
$Comp
L power:GND #PWR011
U 1 1 5F68136C
P 2700 4600
F 0 "#PWR011" H 2700 4600 30  0001 C CNN
F 1 "GND" H 2700 4530 30  0001 C CNN
F 2 "" H 2700 4600 50  0001 C CNN
F 3 "" H 2700 4600 50  0001 C CNN
	1    2700 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5100 3700 5100
Wire Wire Line
	3750 4600 3750 5100
Wire Wire Line
	3500 4600 3750 4600
Connection ~ 3100 4600
Wire Wire Line
	3100 5000 3100 4600
$Comp
L SparkFun-Resistors:RESISTOR0402 R3
U 1 1 5F672CF7
P 3300 4600
F 0 "R3" H 3300 4300 45  0000 C CNN
F 1 "10k" H 3300 4384 45  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 4750 20  0001 C CNN
F 3 "" H 3300 4600 60  0001 C CNN
F 4 " " H 3300 4479 60  0000 C CNN "Field4"
	1    3300 4600
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-IC-Amplifiers:LM358 U7
U 1 1 5F606F46
P 3400 5100
F 0 "U7" H 3400 5454 45  0000 C CNN
F 1 "TLV2172IDR" H 3400 5370 45  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3400 5450 20  0001 C CNN
F 3 "" H 3400 5100 50  0001 C CNN
F 4 "" H 3400 5381 60  0000 C CNN "Field4"
	1    3400 5100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R2
U 1 1 5F627031
P 2900 4600
F 0 "R2" V 2995 4532 45  0000 R CNN
F 1 "1k" V 2911 4532 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2900 4750 20  0001 C CNN
F 3 "" H 2900 4600 60  0001 C CNN
F 4 " " V 2816 4532 60  0000 R CNN "Field4"
	1    2900 4600
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-IC-Conversion:MCP4725SOT-23 U6
U 1 1 5F7A4024
P 2650 6150
F 0 "U6" H 2650 6504 45  0000 C CNN
F 1 "MCP4725SOT-23" H 2650 6420 45  0000 C CNN
F 2 "SOT23-6" H 2650 6450 20  0001 C CNN
F 3 "" H 2650 6150 50  0001 C CNN
F 4 "" H 2650 6431 60  0000 C CNN "Field4"
	1    2650 6150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3050 6050 3050 5200
Wire Wire Line
	3050 5200 3100 5200
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C1
U 1 1 5F7B2CEB
P 6100 3000
F 0 "C1" H 6208 3092 45  0000 L CNN
F 1 "0.1 uF" H 6208 3008 45  0000 L CNN
F 2 "0603" H 6100 3250 20  0001 C CNN
F 3 "" H 6100 3000 50  0001 C CNN
F 4 "" H 6208 2966 60  0000 L CNN "Field4"
	1    6100 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F8B2112
P 6100 3100
F 0 "#PWR04" H 6100 3100 30  0001 C CNN
F 1 "GND" H 6100 3030 30  0001 C CNN
F 2 "" H 6100 3100 50  0001 C CNN
F 3 "" H 6100 3100 50  0001 C CNN
	1    6100 3100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY05
U 1 1 5F8B2113
P 6100 2800
F 0 "#SUPPLY05" H 6150 2800 45  0001 L BNN
F 1 "5V" V 6100 2928 45  0000 L CNN
F 2 "" V 6142 2928 60  0000 L CNN
F 3 "" H 6100 2800 60  0001 C CNN
	1    6100 2800
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F7BAE6F
P 3050 6150
F 0 "#PWR013" H 3050 6150 30  0001 C CNN
F 1 "GND" H 3050 6080 30  0001 C CNN
F 2 "" H 3050 6150 50  0001 C CNN
F 3 "" H 3050 6150 50  0001 C CNN
	1    3050 6150
	0    -1   -1   0   
$EndComp
Text GLabel 3750 5100 2    50   Input ~ 0
Vtune
Text GLabel 4550 3700 0    50   Input ~ 0
24V
$Comp
L power:GND #PWR02
U 1 1 5F753F0A
P 4550 3600
F 0 "#PWR02" H 4550 3600 30  0001 C CNN
F 1 "GND" H 4550 3530 30  0001 C CNN
F 2 "" H 4550 3600 50  0001 C CNN
F 3 "" H 4550 3600 50  0001 C CNN
	1    4550 3600
	0    1    1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY02
U 1 1 5F74EE83
P 4550 3500
F 0 "#SUPPLY02" H 4600 3500 45  0001 L BNN
F 1 "5V" V 4550 3627 45  0000 L CNN
F 2 "" V 4592 3628 60  0000 L CNN
F 3 "" H 4550 3500 60  0001 C CNN
	1    4550 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F73FADE
P 4550 3400
F 0 "#PWR01" H 4550 3400 30  0001 C CNN
F 1 "GND" H 4550 3330 30  0001 C CNN
F 2 "" H 4550 3400 50  0001 C CNN
F 3 "" H 4550 3400 50  0001 C CNN
	1    4550 3400
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R1
U 1 1 5F9BBBCC
P 3300 4450
F 0 "R1" H 3300 4150 45  0000 C CNN
F 1 "10k" H 3300 4234 45  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 4600 20  0001 C CNN
F 3 "" H 3300 4450 60  0001 C CNN
F 4 " " H 3300 4329 60  0000 C CNN "Field4"
	1    3300 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 4450 3500 4600
Connection ~ 3500 4600
Wire Wire Line
	3100 4600 3100 4450
Text GLabel 2250 6150 0    50   Input ~ 0
SCL
Text GLabel 2250 6050 0    50   Input ~ 0
TUNING_DAC_I2C_SELECT
Text GLabel 2250 6250 0    50   Input ~ 0
SDA
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0107
U 1 1 5FB20D9F
P 3050 6250
F 0 "#SUPPLY0107" H 3100 6250 45  0001 L BNN
F 1 "5V" V 3050 6378 45  0000 L CNN
F 2 "" V 3092 6378 60  0000 L CNN
F 3 "" H 3050 6250 60  0001 C CNN
	1    3050 6250
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:1.0UF-1206-50V-10% C4
U 1 1 604F97FB
P 7200 3450
F 0 "C4" H 7308 3542 45  0000 L CNN
F 1 "10uF" H 7308 3458 45  0000 L CNN
F 2 "1206" H 7200 3700 20  0001 C CNN
F 3 "" H 7200 3450 50  0001 C CNN
F 4 "" H 7308 3416 60  0000 L CNN "Field4"
	1    7200 3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C5
U 1 1 604F9802
P 7650 3450
F 0 "C5" H 7758 3542 45  0000 L CNN
F 1 "0.1 uF" H 7758 3458 45  0000 L CNN
F 2 "0603" H 7650 3700 20  0001 C CNN
F 3 "" H 7650 3450 50  0001 C CNN
F 4 "" H 7758 3416 60  0000 L CNN "Field4"
	1    7650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3250 7200 3250
$Comp
L power:GND #PWR0104
U 1 1 604F980A
P 7200 3550
F 0 "#PWR0104" H 7200 3550 30  0001 C CNN
F 1 "GND" H 7200 3480 30  0001 C CNN
F 2 "" H 7200 3550 50  0001 C CNN
F 3 "" H 7200 3550 50  0001 C CNN
	1    7200 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 604F9810
P 7650 3550
F 0 "#PWR0105" H 7650 3550 30  0001 C CNN
F 1 "GND" H 7650 3480 30  0001 C CNN
F 2 "" H 7650 3550 50  0001 C CNN
F 3 "" H 7650 3550 50  0001 C CNN
	1    7650 3550
	1    0    0    -1  
$EndComp
Text GLabel 7200 3250 0    50   Input ~ 0
24V
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C6
U 1 1 6059D0FB
P 3650 6250
F 0 "C6" H 3758 6342 45  0000 L CNN
F 1 "0.1 uF" H 3758 6258 45  0000 L CNN
F 2 "0603" H 3650 6500 20  0001 C CNN
F 3 "" H 3650 6250 50  0001 C CNN
F 4 "" H 3758 6216 60  0000 L CNN "Field4"
	1    3650 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 6059D101
P 3650 6350
F 0 "#PWR0117" H 3650 6350 30  0001 C CNN
F 1 "GND" H 3650 6280 30  0001 C CNN
F 2 "" H 3650 6350 50  0001 C CNN
F 3 "" H 3650 6350 50  0001 C CNN
	1    3650 6350
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0114
U 1 1 6059D6E8
P 3650 6050
F 0 "#SUPPLY0114" H 3700 6050 45  0001 L BNN
F 1 "5V" V 3650 6178 45  0000 L CNN
F 2 "" V 3692 6178 60  0000 L CNN
F 3 "" H 3650 6050 60  0001 C CNN
	1    3650 6050
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C8
U 1 1 60658223
P 6550 3000
F 0 "C8" H 6658 3092 45  0000 L CNN
F 1 "0.1 uF" H 6658 3008 45  0000 L CNN
F 2 "0603" H 6550 3250 20  0001 C CNN
F 3 "" H 6550 3000 50  0001 C CNN
F 4 "" H 6658 2966 60  0000 L CNN "Field4"
	1    6550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60658229
P 6550 3100
F 0 "#PWR0108" H 6550 3100 30  0001 C CNN
F 1 "GND" H 6550 3030 30  0001 C CNN
F 2 "" H 6550 3100 50  0001 C CNN
F 3 "" H 6550 3100 50  0001 C CNN
	1    6550 3100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0118
U 1 1 6065822F
P 6550 2800
F 0 "#SUPPLY0118" H 6600 2800 45  0001 L BNN
F 1 "5V" V 6550 2928 45  0000 L CNN
F 2 "" V 6592 2928 60  0000 L CNN
F 3 "" H 6550 2800 60  0001 C CNN
	1    6550 2800
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C9
U 1 1 6065936A
P 6950 3000
F 0 "C9" H 7058 3092 45  0000 L CNN
F 1 "0.1 uF" H 7058 3008 45  0000 L CNN
F 2 "0603" H 6950 3250 20  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
F 4 "" H 7058 2966 60  0000 L CNN "Field4"
	1    6950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 60659370
P 6950 3100
F 0 "#PWR0118" H 6950 3100 30  0001 C CNN
F 1 "GND" H 6950 3030 30  0001 C CNN
F 2 "" H 6950 3100 50  0001 C CNN
F 3 "" H 6950 3100 50  0001 C CNN
	1    6950 3100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0119
U 1 1 60659376
P 6950 2800
F 0 "#SUPPLY0119" H 7000 2800 45  0001 L BNN
F 1 "5V" V 6950 2928 45  0000 L CNN
F 2 "" V 6992 2928 60  0000 L CNN
F 3 "" H 6950 2800 60  0001 C CNN
	1    6950 2800
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C10
U 1 1 606C5FBD
P 5100 4350
F 0 "C10" H 5208 4442 45  0000 L CNN
F 1 "0.1 uF" H 5208 4358 45  0000 L CNN
F 2 "0603" H 5100 4600 20  0001 C CNN
F 3 "" H 5100 4350 50  0001 C CNN
F 4 "" H 5208 4316 60  0000 L CNN "Field4"
	1    5100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 606C5FC3
P 5100 4450
F 0 "#PWR0121" H 5100 4450 30  0001 C CNN
F 1 "GND" H 5100 4380 30  0001 C CNN
F 2 "" H 5100 4450 50  0001 C CNN
F 3 "" H 5100 4450 50  0001 C CNN
	1    5100 4450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0120
U 1 1 606C5FC9
P 5100 4150
F 0 "#SUPPLY0120" H 5150 4150 45  0001 L BNN
F 1 "5V" V 5100 4278 45  0000 L CNN
F 2 "" V 5142 4278 60  0000 L CNN
F 3 "" H 5100 4150 60  0001 C CNN
	1    5100 4150
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60A19394
P 3950 2450
F 0 "#PWR0106" H 3950 2450 30  0001 C CNN
F 1 "GND" H 3950 2380 30  0001 C CNN
F 2 "" H 3950 2450 50  0001 C CNN
F 3 "" H 3950 2450 50  0001 C CNN
	1    3950 2450
	0    1    1    0   
$EndComp
$Comp
L conn:CONN_6 J1
U 1 1 60A1ACE6
P 4300 2700
F 0 "J1" H 4428 2732 45  0000 L CNN
F 1 "CONN_04" H 4428 2648 45  0000 L CNN
F 2 "Connectors2:1X06-SMD-FEMALE" H 4300 3200 20  0001 C CNN
F 3 "" H 4300 2700 50  0001 C CNN
F 4 "" H 4428 2606 60  0000 L CNN "Field4"
	1    4300 2700
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0117
U 1 1 60A230FC
P 3950 2550
F 0 "#SUPPLY0117" H 4000 2550 45  0001 L BNN
F 1 "5V" V 3950 2677 45  0000 L CNN
F 2 "" V 3992 2678 60  0000 L CNN
F 3 "" H 3950 2550 60  0001 C CNN
	1    3950 2550
	0    -1   -1   0   
$EndComp
Text GLabel 3950 2750 0    50   Input ~ 0
SCL
Text GLabel 3950 2650 0    50   Input ~ 0
TUNING_DAC_I2C_SELECT
Text GLabel 3950 2850 0    50   Input ~ 0
SDA
Text GLabel 3950 2950 0    50   Input ~ 0
Vtune
$EndSCHEMATC