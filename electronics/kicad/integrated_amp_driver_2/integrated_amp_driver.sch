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
L SparkFun-Resistors:0.75OHM-0805-1_4W-1% R5
U 1 1 5F62017A
P 15700 -1450
F 0 "R5" H 15700 -1256 45  0000 C CNN
F 1 "0.1r" H 15700 -1340 45  0000 C CNN
F 2 "0805" H 15700 -1300 20  0001 C CNN
F 3 "" H 15700 -1450 60  0001 C CNN
F 4 "" H 15700 -1329 60  0000 C CNN "Field4"
	1    15700 -1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	15800 -1800 15900 -1800
Wire Wire Line
	15900 -1800 15900 -1450
Connection ~ 15900 -1450
Wire Wire Line
	15600 -1800 15500 -1800
Wire Wire Line
	15500 -1800 15500 -1450
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY011
U 1 1 5F653BA0
P 15400 -2000
F 0 "#SUPPLY011" H 15450 -2000 45  0001 L BNN
F 1 "3.3V" V 15400 -1872 45  0000 L CNN
F 2 "" V 15358 -1873 60  0000 L CNN
F 3 "" H 15400 -2000 60  0001 C CNN
	1    15400 -2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5F654A4A
P 16000 -2000
F 0 "#PWR018" H 16000 -2000 30  0001 C CNN
F 1 "GND" H 16000 -2070 30  0001 C CNN
F 2 "" H 16000 -2000 50  0001 C CNN
F 3 "" H 16000 -2000 50  0001 C CNN
	1    16000 -2000
	0    -1   -1   0   
$EndComp
Text GLabel 15700 -2400 2    50   Input ~ 0
current_sense_output
$Comp
L Amplifier_Current:INA194 U8
U 1 1 5F6507F7
P 15700 -2100
F 0 "U8" V 15746 -2444 50  0000 R CNN
F 1 "INA194" V 15655 -2444 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 15700 -2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina193.pdf" H 15700 -2100 50  0001 C CNN
	1    15700 -2100
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_SwitchedCapacitor:LM2776 U5
U 1 1 5F9004CB
P 16000 3900
F 0 "U5" H 16444 3896 50  0000 L CNN
F 1 "LM2776" H 16444 3805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 16050 3550 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2776.pdf" H 14150 5150 50  0001 C CNN
	1    16000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	15900 -1450 16050 -1450
$Comp
L SparkFun-IC-Conversion:MCP4725SOT-23 U14
U 1 1 5F930B85
P 16450 1900
F 0 "U14" H 16450 2254 45  0000 C CNN
F 1 "MCP4725SOT-23" H 16450 2170 45  0000 C CNN
F 2 "SOT23-6" H 16450 2200 20  0001 C CNN
F 3 "" H 16450 1900 50  0001 C CNN
F 4 "" H 16450 2181 60  0000 C CNN "Field4"
	1    16450 1900
	-1   0    0    -1  
$EndComp
$Comp
L power2:-5V #PWR0102
U 1 1 5F986BF4
P 16400 3800
F 0 "#PWR0102" H 16400 3900 50  0001 C CNN
F 1 "-5V" H 16415 3973 50  0000 C CNN
F 2 "" H 16400 3800 50  0001 C CNN
F 3 "" H 16400 3800 50  0001 C CNN
	1    16400 3800
	1    0    0    -1  
$EndComp
$Comp
L power2:-5V #PWR0111
U 1 1 5F9B7540
P 20050 2850
F 0 "#PWR0111" H 20050 2950 50  0001 C CNN
F 1 "-5V" H 20065 3023 50  0000 C CNN
F 2 "" H 20050 2850 50  0001 C CNN
F 3 "" H 20050 2850 50  0001 C CNN
	1    20050 2850
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0101
U 1 1 5F9B7E8F
P 20050 2250
F 0 "#SUPPLY0101" H 20100 2250 45  0001 L BNN
F 1 "5V" V 20050 2378 45  0000 L CNN
F 2 "" V 20092 2378 60  0000 L CNN
F 3 "" H 20050 2250 60  0001 C CNN
	1    20050 2250
	-1   0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R16
U 1 1 5F9D800B
P 13450 -3500
F 0 "R16" V 13545 -3568 45  0000 R CNN
F 1 "4.7k" V 13461 -3568 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 13450 -3350 20  0001 C CNN
F 3 "" H 13450 -3500 60  0001 C CNN
F 4 " " V 13366 -3568 60  0000 R CNN "Field4"
	1    13450 -3500
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R14
U 1 1 5FA12679
P 17900 1450
F 0 "R14" V 17805 1518 45  0000 L CNN
F 1 "1k" V 17889 1518 45  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 17900 1600 20  0001 C CNN
F 3 "" H 17900 1450 60  0001 C CNN
F 4 " " V 17984 1518 60  0000 L CNN "Field4"
	1    17900 1450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R10
U 1 1 5FA140AA
P 17450 1800
F 0 "R10" V 17355 1868 45  0000 L CNN
F 1 "1k" V 17439 1868 45  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 17450 1950 20  0001 C CNN
F 3 "" H 17450 1800 60  0001 C CNN
F 4 " " V 17534 1868 60  0000 L CNN "Field4"
	1    17450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	17650 1800 17650 1450
Wire Wire Line
	18250 1450 18250 1900
Wire Wire Line
	18100 1450 18250 1450
Wire Wire Line
	17700 1450 17650 1450
$Comp
L SparkFun-Resistors:RESISTOR0402 R11
U 1 1 5FA1C6A6
P 17450 2800
F 0 "R11" V 17355 2868 45  0000 L CNN
F 1 "1k" V 17439 2868 45  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 17450 2950 20  0001 C CNN
F 3 "" H 17450 2800 60  0001 C CNN
F 4 " " V 17534 2868 60  0000 L CNN "Field4"
	1    17450 2800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R4
U 1 1 5FA22274
P 17050 2800
F 0 "R4" V 16955 2868 45  0000 L CNN
F 1 "1k" V 17039 2868 45  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 17050 2950 20  0001 C CNN
F 3 "" H 17050 2800 60  0001 C CNN
F 4 " " V 17134 2868 60  0000 L CNN "Field4"
	1    17050 2800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R13
U 1 1 5FA254D3
P 17850 2400
F 0 "R13" V 17755 2468 45  0000 L CNN
F 1 "1k" V 17839 2468 45  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 17850 2550 20  0001 C CNN
F 3 "" H 17850 2400 60  0001 C CNN
F 4 " " V 17934 2468 60  0000 L CNN "Field4"
	1    17850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	17650 2400 17650 2800
Wire Wire Line
	18050 2400 18250 2400
Wire Wire Line
	18250 2400 18250 2900
$Comp
L SparkFun-IC-Conversion:MCP4725SOT-23 U16
U 1 1 5FA29A2C
P 16450 2900
F 0 "U16" H 16450 3254 45  0000 C CNN
F 1 "MCP4725SOT-23" H 16450 3170 45  0000 C CNN
F 2 "SOT23-6" H 16450 3200 20  0001 C CNN
F 3 "" H 16450 2900 50  0001 C CNN
F 4 "" H 16450 3181 60  0000 C CNN "Field4"
	1    16450 2900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5FA2C0ED
P 16850 1900
F 0 "#PWR0112" H 16850 1900 30  0001 C CNN
F 1 "GND" H 16850 1830 30  0001 C CNN
F 2 "" H 16850 1900 50  0001 C CNN
F 3 "" H 16850 1900 50  0001 C CNN
	1    16850 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5FA2D772
P 16850 2900
F 0 "#PWR0114" H 16850 2900 30  0001 C CNN
F 1 "GND" H 16850 2830 30  0001 C CNN
F 2 "" H 16850 2900 50  0001 C CNN
F 3 "" H 16850 2900 50  0001 C CNN
	1    16850 2900
	0    -1   -1   0   
$EndComp
Text GLabel 13450 -3300 2    50   Input ~ 0
SCL
Text GLabel 14000 -3300 2    50   Input ~ 0
SDA
$Comp
L SparkFun-Resistors:RESISTOR0402 R17
U 1 1 5FA2EC1D
P 14000 -3500
F 0 "R17" V 14095 -3568 45  0000 R CNN
F 1 "4.7k" V 14011 -3568 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 14000 -3350 20  0001 C CNN
F 3 "" H 14000 -3500 60  0001 C CNN
F 4 " " V 13916 -3568 60  0000 R CNN "Field4"
	1    14000 -3500
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0102
U 1 1 5FA2F912
P 13450 -3700
F 0 "#SUPPLY0102" H 13500 -3700 45  0001 L BNN
F 1 "3.3V" H 13450 -3530 45  0000 C CNN
F 2 "" V 13408 -3573 60  0000 L CNN
F 3 "" H 13450 -3700 60  0001 C CNN
	1    13450 -3700
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0103
U 1 1 5FA2FCA8
P 14000 -3700
F 0 "#SUPPLY0103" H 14050 -3700 45  0001 L BNN
F 1 "3.3V" H 14000 -3530 45  0000 C CNN
F 2 "" V 13958 -3573 60  0000 L CNN
F 3 "" H 14000 -3700 60  0001 C CNN
	1    14000 -3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5FA6C97D
P 17650 2000
F 0 "#PWR0119" H 17650 2000 30  0001 C CNN
F 1 "GND" H 17650 1930 30  0001 C CNN
F 2 "" H 17650 2000 50  0001 C CNN
F 3 "" H 17650 2000 50  0001 C CNN
	1    17650 2000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5FA6CEAA
P 17650 3000
F 0 "#PWR0120" H 17650 3000 30  0001 C CNN
F 1 "GND" H 17650 2930 30  0001 C CNN
F 2 "" H 17650 3000 50  0001 C CNN
F 3 "" H 17650 3000 50  0001 C CNN
	1    17650 3000
	0    1    1    0   
$EndComp
Text GLabel 16050 1800 0    50   Input ~ 0
GAIN_DAC_I2C_SELECT
$Comp
L SparkFun-IC-Amplifiers:LM358 U15
U 1 1 5FAC709A
P 17950 1900
F 0 "U15" H 17950 2254 45  0000 C CNN
F 1 "TS912IDT" H 17950 2170 45  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 17950 2250 20  0001 C CNN
F 3 "" H 17950 1900 50  0001 C CNN
F 4 "" H 17950 2181 60  0000 C CNN "Field4"
	1    17950 1900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-IC-Amplifiers:LM358 U15
U 2 1 5FAC958E
P 17950 2900
F 0 "U15" H 17950 3254 45  0000 C CNN
F 1 "TS912IDT" H 17950 3170 45  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 17950 3250 20  0001 C CNN
F 3 "" H 17950 2900 50  0001 C CNN
F 4 "" H 17950 3181 60  0000 C CNN "Field4"
	2    17950 2900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-IC-Amplifiers:LM358 U15
U 3 1 5FACA8DB
P 20050 2550
F 0 "U15" H 20178 2592 45  0000 L CNN
F 1 "TS912IDT" H 20178 2508 45  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 20050 2900 20  0001 C CNN
F 3 "" H 20050 2550 50  0001 C CNN
F 4 "" H 20178 2466 60  0000 L CNN "Field4"
	3    20050 2550
	1    0    0    -1  
$EndComp
Connection ~ 17650 2800
Connection ~ 17650 1800
Wire Wire Line
	16850 1800 17250 1800
Text GLabel 16050 2000 0    50   Input ~ 0
SDA
Text GLabel 16050 3000 0    50   Input ~ 0
SDA
Text GLabel 16050 1900 0    50   Input ~ 0
SCL
Text GLabel 16050 2900 0    50   Input ~ 0
SCL
Text GLabel 16050 2800 0    50   Input ~ 0
GATE_DAC_I2C_SELECT
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0108
U 1 1 5FB2268D
P 16850 2000
F 0 "#SUPPLY0108" H 16900 2000 45  0001 L BNN
F 1 "5V" V 16850 2128 45  0000 L CNN
F 2 "" V 16892 2128 60  0000 L CNN
F 3 "" H 16850 2000 60  0001 C CNN
	1    16850 2000
	0    1    1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0109
U 1 1 5FB23436
P 16850 3000
F 0 "#SUPPLY0109" H 16900 3000 45  0001 L BNN
F 1 "5V" V 16850 3128 45  0000 L CNN
F 2 "" V 16892 3128 60  0000 L CNN
F 3 "" H 16850 3000 60  0001 C CNN
	1    16850 3000
	0    1    1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0110
U 1 1 5FB23DE0
P 16000 3600
F 0 "#SUPPLY0110" H 16050 3600 45  0001 L BNN
F 1 "5V" V 16000 3728 45  0000 L CNN
F 2 "" V 16042 3728 60  0000 L CNN
F 3 "" H 16000 3600 60  0001 C CNN
	1    16000 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5FB310FA
P 16000 4300
F 0 "#PWR0113" H 16000 4300 30  0001 C CNN
F 1 "GND" H 16000 4230 30  0001 C CNN
F 2 "" H 16000 4300 50  0001 C CNN
F 3 "" H 16000 4300 50  0001 C CNN
	1    16000 4300
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C12
U 1 1 5FB3EF8D
P 15350 4100
F 0 "C12" H 15243 4192 45  0000 R CNN
F 1 "2.2 uF" H 15243 4108 45  0000 R CNN
F 2 "0603" H 15350 4350 20  0001 C CNN
F 3 "" H 15350 4100 50  0001 C CNN
F 4 "" H 15458 4066 60  0000 L CNN "Field4"
	1    15350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	15600 4100 15600 4200
Wire Wire Line
	15600 4200 15350 4200
Wire Wire Line
	15350 3900 15600 3900
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C7
U 1 1 5FB44035
P 15100 3800
F 0 "C7" H 14993 3892 45  0000 R CNN
F 1 "2.2 uF" H 14993 3808 45  0000 R CNN
F 2 "0603" H 15100 4050 20  0001 C CNN
F 3 "" H 15100 3800 50  0001 C CNN
F 4 "" H 15208 3766 60  0000 L CNN "Field4"
	1    15100 3800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0112
U 1 1 5FB8524E
P 15350 -1450
F 0 "#SUPPLY0112" H 15400 -1450 45  0001 L BNN
F 1 "5V" V 15350 -1322 45  0000 L CNN
F 2 "" V 15392 -1322 60  0000 L CNN
F 3 "" H 15350 -1450 60  0001 C CNN
	1    15350 -1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15350 -1450 15500 -1450
Connection ~ 15500 -1450
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0115
U 1 1 5FBF709B
P 15600 3800
F 0 "#SUPPLY0115" H 15650 3800 45  0001 L BNN
F 1 "5V" V 15600 3928 45  0000 L CNN
F 2 "" V 15642 3928 60  0000 L CNN
F 3 "" H 15600 3800 60  0001 C CNN
	1    15600 3800
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0116
U 1 1 5FBF9150
P 15100 3600
F 0 "#SUPPLY0116" H 15150 3600 45  0001 L BNN
F 1 "5V" V 15100 3728 45  0000 L CNN
F 2 "" V 15142 3728 60  0000 L CNN
F 3 "" H 15100 3600 60  0001 C CNN
	1    15100 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5FBF9604
P 15100 3900
F 0 "#PWR0125" H 15100 3900 30  0001 C CNN
F 1 "GND" H 15100 3830 30  0001 C CNN
F 2 "" H 15100 3900 50  0001 C CNN
F 3 "" H 15100 3900 50  0001 C CNN
	1    15100 3900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C20
U 1 1 5FBFA81D
P 17050 3900
F 0 "C20" H 16943 3992 45  0000 R CNN
F 1 "2.2 uF" H 16943 3908 45  0000 R CNN
F 2 "0603" H 17050 4150 20  0001 C CNN
F 3 "" H 17050 3900 50  0001 C CNN
F 4 "" H 17158 3866 60  0000 L CNN "Field4"
	1    17050 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5FBFA829
P 17050 4000
F 0 "#PWR0126" H 17050 4000 30  0001 C CNN
F 1 "GND" H 17050 3930 30  0001 C CNN
F 2 "" H 17050 4000 50  0001 C CNN
F 3 "" H 17050 4000 50  0001 C CNN
	1    17050 4000
	1    0    0    -1  
$EndComp
$Comp
L power2:-5V #PWR0127
U 1 1 5FBFB4A5
P 17050 3700
F 0 "#PWR0127" H 17050 3800 50  0001 C CNN
F 1 "-5V" H 17065 3873 50  0000 C CNN
F 2 "" H 17050 3700 50  0001 C CNN
F 3 "" H 17050 3700 50  0001 C CNN
	1    17050 3700
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C21
U 1 1 5FBFCB80
P 17400 3900
F 0 "C21" H 17508 3992 45  0000 L CNN
F 1 "0.1 uF" H 17508 3908 45  0000 L CNN
F 2 "0603" H 17400 4150 20  0001 C CNN
F 3 "" H 17400 3900 50  0001 C CNN
F 4 "" H 17508 3866 60  0000 L CNN "Field4"
	1    17400 3900
	1    0    0    -1  
$EndComp
$Comp
L power2:-5V #PWR0128
U 1 1 5FBFD3E6
P 17400 3700
F 0 "#PWR0128" H 17400 3800 50  0001 C CNN
F 1 "-5V" H 17415 3873 50  0000 C CNN
F 2 "" H 17400 3700 50  0001 C CNN
F 3 "" H 17400 3700 50  0001 C CNN
	1    17400 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5FBFD6A5
P 17400 4000
F 0 "#PWR0129" H 17400 4000 30  0001 C CNN
F 1 "GND" H 17400 3930 30  0001 C CNN
F 2 "" H 17400 4000 50  0001 C CNN
F 3 "" H 17400 4000 50  0001 C CNN
	1    17400 4000
	1    0    0    -1  
$EndComp
Text GLabel 18250 1900 2    50   Input ~ 0
AMP_GAIN_CONTROL_
Text GLabel 18250 2900 2    50   Input ~ 0
AMP_GATE_CONTROL_
Text GLabel 16050 -1450 2    50   Input ~ 0
AMP_DRAIN_SUPPLY
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C11
U 1 1 60717C1D
P 17100 -1850
F 0 "C11" H 17208 -1758 45  0000 L CNN
F 1 "0.1 uF" H 17208 -1842 45  0000 L CNN
F 2 "0603" H 17100 -1600 20  0001 C CNN
F 3 "" H 17100 -1850 50  0001 C CNN
F 4 "" H 17208 -1884 60  0000 L CNN "Field4"
	1    17100 -1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 60717C23
P 17100 -1750
F 0 "#PWR0122" H 17100 -1750 30  0001 C CNN
F 1 "GND" H 17100 -1820 30  0001 C CNN
F 2 "" H 17100 -1750 50  0001 C CNN
F 3 "" H 17100 -1750 50  0001 C CNN
	1    17100 -1750
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0121
U 1 1 60718232
P 17100 -2050
F 0 "#SUPPLY0121" H 17150 -2050 45  0001 L BNN
F 1 "3.3V" V 17100 -1922 45  0000 L CNN
F 2 "" V 17058 -1923 60  0000 L CNN
F 3 "" H 17100 -2050 60  0001 C CNN
	1    17100 -2050
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C13
U 1 1 6075B561
P 15900 700
F 0 "C13" H 16008 792 45  0000 L CNN
F 1 "0.1 uF" H 16008 708 45  0000 L CNN
F 2 "0603" H 15900 950 20  0001 C CNN
F 3 "" H 15900 700 50  0001 C CNN
F 4 "" H 16008 666 60  0000 L CNN "Field4"
	1    15900 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 6075B567
P 15900 800
F 0 "#PWR0123" H 15900 800 30  0001 C CNN
F 1 "GND" H 15900 730 30  0001 C CNN
F 2 "" H 15900 800 50  0001 C CNN
F 3 "" H 15900 800 50  0001 C CNN
	1    15900 800 
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0122
U 1 1 6075B56D
P 15900 500
F 0 "#SUPPLY0122" H 15950 500 45  0001 L BNN
F 1 "5V" V 15900 628 45  0000 L CNN
F 2 "" V 15942 628 60  0000 L CNN
F 3 "" H 15900 500 60  0001 C CNN
	1    15900 500 
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0131
U 1 1 608870CE
P 1550 5900
F 0 "#SUPPLY0131" H 1600 5900 45  0001 L BNN
F 1 "5V" V 1550 6028 45  0000 L CNN
F 2 "" V 1592 6028 60  0000 L CNN
F 3 "" H 1550 5900 60  0001 C CNN
	1    1550 5900
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0132
U 1 1 6088798A
P 950 5900
F 0 "#SUPPLY0132" H 1000 5900 45  0001 L BNN
F 1 "5V" V 950 6028 45  0000 L CNN
F 2 "" V 992 6028 60  0000 L CNN
F 3 "" H 950 5900 60  0001 C CNN
	1    950  5900
	0    -1   1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0126
U 1 1 607994E9
P 11200 -1100
F 0 "#SUPPLY0126" H 11250 -1100 45  0001 L BNN
F 1 "5V" V 11200 -972 45  0000 L CNN
F 2 "" V 11242 -972 60  0000 L CNN
F 3 "" H 11200 -1100 60  0001 C CNN
	1    11200 -1100
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 607994E3
P 11200 -800
F 0 "#PWR0131" H 11200 -800 30  0001 C CNN
F 1 "GND" H 11200 -870 30  0001 C CNN
F 2 "" H 11200 -800 50  0001 C CNN
F 3 "" H 11200 -800 50  0001 C CNN
	1    11200 -800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C15
U 1 1 607994DD
P 11200 -900
F 0 "C15" H 11308 -808 45  0000 L CNN
F 1 "0.1 uF" H 11308 -892 45  0000 L CNN
F 2 "0603" H 11200 -650 20  0001 C CNN
F 3 "" H 11200 -900 50  0001 C CNN
F 4 "" H 11308 -934 60  0000 L CNN "Field4"
	1    11200 -900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0123
U 1 1 60790023
P 13000 -1050
F 0 "#SUPPLY0123" H 13050 -1050 45  0001 L BNN
F 1 "5V" V 13000 -922 45  0000 L CNN
F 2 "" V 13042 -922 60  0000 L CNN
F 3 "" H 13000 -1050 60  0001 C CNN
	1    13000 -1050
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 6079001D
P 13000 -750
F 0 "#PWR0124" H 13000 -750 30  0001 C CNN
F 1 "GND" H 13000 -820 30  0001 C CNN
F 2 "" H 13000 -750 50  0001 C CNN
F 3 "" H 13000 -750 50  0001 C CNN
	1    13000 -750
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C14
U 1 1 60790017
P 13000 -850
F 0 "C14" H 13108 -758 45  0000 L CNN
F 1 "0.1 uF" H 13108 -842 45  0000 L CNN
F 2 "0603" H 13000 -600 20  0001 C CNN
F 3 "" H 13000 -850 50  0001 C CNN
F 4 "" H 13108 -884 60  0000 L CNN "Field4"
	1    13000 -850
	1    0    0    -1  
$EndComp
Text GLabel 14000 -1500 2    50   Input ~ 0
AMP_DRAIN_CONTROL_
Text GLabel 11150 -1550 2    50   Input ~ 0
VCO_POWER_CONTROL_
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0113
U 1 1 5FB85255
P 13600 -1800
F 0 "#SUPPLY0113" H 13650 -1800 45  0001 L BNN
F 1 "5V" V 13600 -1672 45  0000 L CNN
F 2 "" V 13642 -1672 60  0000 L CNN
F 3 "" H 13600 -1800 60  0001 C CNN
	1    13600 -1800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0111
U 1 1 5FB851FF
P 13200 -1900
F 0 "#SUPPLY0111" H 13250 -1900 45  0001 L BNN
F 1 "3.3V" H 13200 -1730 45  0000 C CNN
F 2 "" V 13158 -1773 60  0000 L CNN
F 3 "" H 13200 -1900 60  0001 C CNN
	1    13200 -1900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R15
U 1 1 5FB851F9
P 13200 -1700
F 0 "R15" V 13295 -1768 45  0000 R CNN
F 1 "1k" V 13211 -1768 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 13200 -1550 20  0001 C CNN
F 3 "" H 13200 -1700 60  0001 C CNN
F 4 " " V 13116 -1768 60  0000 R CNN "Field4"
	1    13200 -1700
	0    -1   -1   0   
$EndComp
$Comp
L dk_PMIC-Gate-Drivers:MCP1416T-E_OT U20
U 1 1 5FB851F2
P 13600 -1400
F 0 "U20" H 14044 -1297 60  0000 L CNN
F 1 "MCP1416T-E_OT" H 14044 -1403 60  0000 L CNN
F 2 "digikey-footprints:SOT-753" H 13800 -1200 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 13800 -1100 60  0001 L CNN
F 4 "MCP1416T-E/OTCT-ND" H 13800 -1000 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP1416T-E/OT" H 13800 -900 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 13800 -800 60  0001 L CNN "Category"
F 7 "PMIC - Gate Drivers" H 13800 -700 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 13800 -600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP1416T-E-OT/MCP1416T-E-OTCT-ND/1963940" H 13800 -500 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MOSFET DVR 1.5A HS SOT23-5" H 13800 -400 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 13800 -300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 13800 -200 60  0001 L CNN "Status"
	1    13600 -1400
	1    0    0    -1  
$EndComp
Text GLabel 13200 -1500 0    50   Input ~ 0
~AMP_DRAIN_CONTROL
$Comp
L power:GND #PWR0116
U 1 1 5FB851E2
P 13600 -1100
F 0 "#PWR0116" H 13600 -1100 30  0001 C CNN
F 1 "GND" H 13600 -1170 30  0001 C CNN
F 2 "" H 13600 -1100 50  0001 C CNN
F 3 "" H 13600 -1100 50  0001 C CNN
	1    13600 -1100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0106
U 1 1 5FB20353
P 10750 -1850
F 0 "#SUPPLY0106" H 10800 -1850 45  0001 L BNN
F 1 "5V" V 10750 -1722 45  0000 L CNN
F 2 "" V 10792 -1722 60  0000 L CNN
F 3 "" H 10750 -1850 60  0001 C CNN
	1    10750 -1850
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY013
U 1 1 5F905D5F
P 10350 -1950
F 0 "#SUPPLY013" H 10400 -1950 45  0001 L BNN
F 1 "3.3V" H 10350 -1780 45  0000 C CNN
F 2 "" V 10308 -1823 60  0000 L CNN
F 3 "" H 10350 -1950 60  0001 C CNN
	1    10350 -1950
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R6
U 1 1 5F90275C
P 10350 -1750
F 0 "R6" V 10445 -1818 45  0000 R CNN
F 1 "1k" V 10361 -1818 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10350 -1600 20  0001 C CNN
F 3 "" H 10350 -1750 60  0001 C CNN
F 4 " " V 10266 -1818 60  0000 R CNN "Field4"
	1    10350 -1750
	0    -1   -1   0   
$EndComp
$Comp
L dk_PMIC-Gate-Drivers:MCP1416T-E_OT U9
U 1 1 5F5FD827
P 10750 -1450
F 0 "U9" H 11194 -1347 60  0000 L CNN
F 1 "MCP1416T-E_OT" H 11194 -1453 60  0000 L CNN
F 2 "digikey-footprints:SOT-753" H 10950 -1250 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 10950 -1150 60  0001 L CNN
F 4 "MCP1416T-E/OTCT-ND" H 10950 -1050 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP1416T-E/OT" H 10950 -950 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 10950 -850 60  0001 L CNN "Category"
F 7 "PMIC - Gate Drivers" H 10950 -750 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 10950 -650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP1416T-E-OT/MCP1416T-E-OTCT-ND/1963940" H 10950 -550 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MOSFET DVR 1.5A HS SOT23-5" H 10950 -450 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 10950 -350 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10950 -250 60  0001 L CNN "Status"
	1    10750 -1450
	1    0    0    -1  
$EndComp
Text GLabel 10350 -1550 0    50   Input ~ 0
~VCO_POWER_CONTROL
$Comp
L power:GND #PWR021
U 1 1 5F6410F6
P 10750 -1150
F 0 "#PWR021" H 10750 -1150 30  0001 C CNN
F 1 "GND" H 10750 -1220 30  0001 C CNN
F 2 "" H 10750 -1150 50  0001 C CNN
F 3 "" H 10750 -1150 50  0001 C CNN
	1    10750 -1150
	1    0    0    -1  
$EndComp
Text Notes 16900 5750 0    50   ~ 0
Because \n- the diode detector output is so close to the RF trace, \n- the far-end output has to travel parallel to the trace,\n- and filtering might affect the RF impedance\nit helps to digitize the output immediately; hence the ADCs.\n\nAlso, since initial impedance measurements have to be taken with a\n low-power signal so as to not destroy the virus, the programmable-gain amp  also helps a lot.
Text Notes 18650 4550 0    50   ~ 0
I2c multiplexer see https://electronics.stackexchange.com/a/392155/25599
Text Notes 13050 5550 0    50   ~ 0
"Application Notes_Bias and RF Sequencing for GaN and LDMOS RF Power Devices",\n"Remark: Power devices are particularly\nunstable at low drain voltages. This is the\nreason why [the device must be in] pinch-off when Vds is lower than\n the recommended operating Vds value"
$Comp
L conn:CONN_3 J2
U 1 1 60B7ECC2
P 14100 2950
F 0 "J2" H 14100 2872 45  0000 R CNN
F 1 "CONN_02" V 14016 2872 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 14100 3200 20  0001 C CNN
F 3 "" H 14100 2950 50  0001 C CNN
F 4 "" H 14058 3181 60  0000 C CNN "Field4"
	1    14100 2950
	-1   0    0    1   
$EndComp
Text GLabel 14450 2850 2    50   Input ~ 0
SDA
Text GLabel 14450 2950 2    50   Input ~ 0
SCL
Text GLabel 14450 3050 2    50   Input ~ 0
GATE_DAC_I2C_SELECT
$Comp
L conn:CONN_3 J3
U 1 1 60B848F0
P 14150 2000
F 0 "J3" H 14150 1922 45  0000 R CNN
F 1 "CONN_02" V 14066 1922 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 14150 2250 20  0001 C CNN
F 3 "" H 14150 2000 50  0001 C CNN
F 4 "" H 14108 2231 60  0000 C CNN "Field4"
	1    14150 2000
	-1   0    0    1   
$EndComp
Text GLabel 14500 1900 2    50   Input ~ 0
SDA
Text GLabel 14500 2000 2    50   Input ~ 0
SCL
Text GLabel 14500 2100 2    50   Input ~ 0
GAIN_DAC_I2C_SELECT
$Comp
L SparkFun-Connectors:CONN_02 J1
U 1 1 60B8506B
P 14100 1300
F 0 "J1" H 14100 1222 45  0000 R CNN
F 1 "CONN_02" V 14016 1222 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 14100 1550 20  0001 C CNN
F 3 "" H 14100 1300 50  0001 C CNN
F 4 "" H 14058 1531 60  0000 C CNN "Field4"
	1    14100 1300
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0104
U 1 1 60B85A24
P 14000 1300
F 0 "#SUPPLY0104" H 14050 1300 45  0001 L BNN
F 1 "5V" V 14000 1428 45  0000 L CNN
F 2 "" V 14042 1428 60  0000 L CNN
F 3 "" H 14000 1300 60  0001 C CNN
	1    14000 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60B8645D
P 14000 1400
F 0 "#PWR0101" H 14000 1400 30  0001 C CNN
F 1 "GND" H 14000 1330 30  0001 C CNN
F 2 "" H 14000 1400 50  0001 C CNN
F 3 "" H 14000 1400 50  0001 C CNN
	1    14000 1400
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J4
U 1 1 60B86C40
P 19700 1050
F 0 "J4" H 19700 972 45  0000 R CNN
F 1 "CONN_02" V 19616 972 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 19700 1300 20  0001 C CNN
F 3 "" H 19700 1050 50  0001 C CNN
F 4 "" H 19658 1281 60  0000 C CNN "Field4"
	1    19700 1050
	-1   0    0    1   
$EndComp
Text GLabel 19600 1050 0    50   Input ~ 0
AMP_GAIN_CONTROL_
Text GLabel 19600 1150 0    50   Input ~ 0
AMP_GATE_CONTROL_
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0105
U 1 1 60BAACB6
P 17450 600
F 0 "#SUPPLY0105" H 17500 600 45  0001 L BNN
F 1 "5V" V 17450 728 45  0000 L CNN
F 2 "" V 17492 728 60  0000 L CNN
F 3 "" H 17450 600 60  0001 C CNN
	1    17450 600 
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60BAACBC
P 17450 900
F 0 "#PWR0103" H 17450 900 30  0001 C CNN
F 1 "GND" H 17450 830 30  0001 C CNN
F 2 "" H 17450 900 50  0001 C CNN
F 3 "" H 17450 900 50  0001 C CNN
	1    17450 900 
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C1
U 1 1 60BAACC3
P 17450 800
F 0 "C1" H 17558 892 45  0000 L CNN
F 1 "0.1 uF" H 17558 808 45  0000 L CNN
F 2 "0603" H 17450 1050 20  0001 C CNN
F 3 "" H 17450 800 50  0001 C CNN
F 4 "" H 17558 766 60  0000 L CNN "Field4"
	1    17450 800 
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0107
U 1 1 60BABE4B
P 18150 3600
F 0 "#SUPPLY0107" H 18200 3600 45  0001 L BNN
F 1 "5V" V 18150 3728 45  0000 L CNN
F 2 "" V 18192 3728 60  0000 L CNN
F 3 "" H 18150 3600 60  0001 C CNN
	1    18150 3600
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 60BABE51
P 18150 3900
F 0 "#PWR0104" H 18150 3900 30  0001 C CNN
F 1 "GND" H 18150 3830 30  0001 C CNN
F 2 "" H 18150 3900 50  0001 C CNN
F 3 "" H 18150 3900 50  0001 C CNN
	1    18150 3900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-0603-25V-5% C2
U 1 1 60BABE58
P 18150 3800
F 0 "C2" H 18258 3892 45  0000 L CNN
F 1 "0.1 uF" H 18258 3808 45  0000 L CNN
F 2 "0603" H 18150 4050 20  0001 C CNN
F 3 "" H 18150 3800 50  0001 C CNN
F 4 "" H 18258 3766 60  0000 L CNN "Field4"
	1    18150 3800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J5
U 1 1 60BBDACD
P 12200 -2800
F 0 "J5" H 12200 -2878 45  0000 R CNN
F 1 "CONN_02" V 12116 -2878 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 12200 -2550 20  0001 C CNN
F 3 "" H 12200 -2800 50  0001 C CNN
F 4 "" H 12158 -2569 60  0000 C CNN "Field4"
	1    12200 -2800
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0114
U 1 1 60BBDAD3
P 12100 -2800
F 0 "#SUPPLY0114" H 12150 -2800 45  0001 L BNN
F 1 "5V" V 12100 -2672 45  0000 L CNN
F 2 "" V 12142 -2672 60  0000 L CNN
F 3 "" H 12100 -2800 60  0001 C CNN
	1    12100 -2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60BBDAD9
P 12100 -2700
F 0 "#PWR0105" H 12100 -2700 30  0001 C CNN
F 1 "GND" H 12100 -2770 30  0001 C CNN
F 2 "" H 12100 -2700 50  0001 C CNN
F 3 "" H 12100 -2700 50  0001 C CNN
	1    12100 -2700
	0    1    1    0   
$EndComp
$Comp
L conn:CONN_3 J6
U 1 1 60BC1D64
P 14450 -600
F 0 "J6" H 14450 -678 45  0000 R CNN
F 1 "CONN_02" V 14366 -678 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 14450 -350 20  0001 C CNN
F 3 "" H 14450 -600 50  0001 C CNN
F 4 "" H 14408 -369 60  0000 C CNN "Field4"
	1    14450 -600
	-1   0    0    1   
$EndComp
Text GLabel 14800 -700 2    50   Input ~ 0
AMP_DRAIN_CONTROL_
Text GLabel 14800 -600 2    50   Input ~ 0
AMP_DRAIN_SUPPLY
Text GLabel 14800 -500 2    50   Input ~ 0
VCO_POWER_CONTROL_
$Comp
L SparkFun-Connectors:CONN_02 J10
U 1 1 60BC49DB
P 16750 -3450
F 0 "J10" H 16750 -3528 45  0000 R CNN
F 1 "CONN_02" V 16666 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 16750 -3200 20  0001 C CNN
F 3 "" H 16750 -3450 50  0001 C CNN
F 4 "" H 16708 -3219 60  0000 C CNN "Field4"
	1    16750 -3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J9
U 1 1 60BC5D8E
P 16250 -3450
F 0 "J9" H 16250 -3528 45  0000 R CNN
F 1 "CONN_02" V 16166 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 16250 -3200 20  0001 C CNN
F 3 "" H 16250 -3450 50  0001 C CNN
F 4 "" H 16208 -3219 60  0000 C CNN "Field4"
	1    16250 -3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J8
U 1 1 60BC6061
P 15850 -3450
F 0 "J8" H 15850 -3528 45  0000 R CNN
F 1 "CONN_02" V 15766 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15850 -3200 20  0001 C CNN
F 3 "" H 15850 -3450 50  0001 C CNN
F 4 "" H 15808 -3219 60  0000 C CNN "Field4"
	1    15850 -3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J7
U 1 1 60BC6823
P 15400 -3450
F 0 "J7" H 15400 -3528 45  0000 R CNN
F 1 "CONN_02" V 15316 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15400 -3200 20  0001 C CNN
F 3 "" H 15400 -3450 50  0001 C CNN
F 4 "" H 15358 -3219 60  0000 C CNN "Field4"
	1    15400 -3450
	1    0    0    -1  
$EndComp
Connection ~ 15950 -3550
Connection ~ 16350 -3550
Wire Wire Line
	16350 -3550 15950 -3550
Connection ~ 16850 -3550
Wire Wire Line
	16850 -3550 16350 -3550
Wire Wire Line
	15500 -3450 15950 -3450
Connection ~ 15950 -3450
Wire Wire Line
	15950 -3450 16350 -3450
Connection ~ 16350 -3450
Wire Wire Line
	16350 -3450 16850 -3450
Connection ~ 16850 -3450
Text GLabel 17450 -3550 2    50   Input ~ 0
SDA
Text GLabel 17450 -3450 2    50   Input ~ 0
SCL
$Comp
L SparkFun-Connectors:CONN_02 J12
U 1 1 60BDEE0C
P 15000 -3450
F 0 "J12" H 15000 -3528 45  0000 R CNN
F 1 "CONN_02" V 14916 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15000 -3200 20  0001 C CNN
F 3 "" H 15000 -3450 50  0001 C CNN
F 4 "" H 14958 -3219 60  0000 C CNN "Field4"
	1    15000 -3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J11
U 1 1 60BDF08D
P 14550 -3450
F 0 "J11" H 14550 -3528 45  0000 R CNN
F 1 "CONN_02" V 14466 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 14550 -3200 20  0001 C CNN
F 3 "" H 14550 -3450 50  0001 C CNN
F 4 "" H 14508 -3219 60  0000 C CNN "Field4"
	1    14550 -3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	15100 -3550 15500 -3550
Connection ~ 15500 -3550
Wire Wire Line
	15500 -3550 15950 -3550
Wire Wire Line
	15100 -3450 15500 -3450
Connection ~ 15500 -3450
Wire Wire Line
	14650 -3550 15100 -3550
Connection ~ 15100 -3550
Wire Wire Line
	14650 -3450 15100 -3450
Connection ~ 15100 -3450
Text GLabel 9400 -1000 0    50   Input ~ 0
~AMP_DRAIN_CONTROL
Text GLabel 9400 -1100 0    50   Input ~ 0
~VCO_POWER_CONTROL
$Comp
L conn:CONN_3 J14
U 1 1 60C09208
P 9750 -1000
F 0 "J14" H 9750 -1078 45  0000 R CNN
F 1 "CONN_02" V 9666 -1078 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 9750 -750 20  0001 C CNN
F 3 "" H 9750 -1000 50  0001 C CNN
F 4 "" H 9708 -769 60  0000 C CNN "Field4"
	1    9750 -1000
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J16
U 1 1 60C1F558
P 15250 -4150
F 0 "J16" H 15250 -4228 45  0000 R CNN
F 1 "CONN_02" V 15166 -4228 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15250 -3900 20  0001 C CNN
F 3 "" H 15250 -4150 50  0001 C CNN
F 4 "" H 15208 -3919 60  0000 C CNN "Field4"
	1    15250 -4150
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J17
U 1 1 60C1F993
P 15600 -4150
F 0 "J17" H 15600 -4228 45  0000 R CNN
F 1 "CONN_02" V 15516 -4228 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15600 -3900 20  0001 C CNN
F 3 "" H 15600 -4150 50  0001 C CNN
F 4 "" H 15558 -3919 60  0000 C CNN "Field4"
	1    15600 -4150
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J18
U 1 1 60C1FC80
P 15950 -4150
F 0 "J18" H 15950 -4228 45  0000 R CNN
F 1 "CONN_02" V 15866 -4228 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 15950 -3900 20  0001 C CNN
F 3 "" H 15950 -4150 50  0001 C CNN
F 4 "" H 15908 -3919 60  0000 C CNN "Field4"
	1    15950 -4150
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Connectors:CONN_02 J15
U 1 1 60C23C17
P 14900 -4150
F 0 "J15" H 14900 -4228 45  0000 R CNN
F 1 "CONN_02" V 14816 -4228 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 14900 -3900 20  0001 C CNN
F 3 "" H 14900 -4150 50  0001 C CNN
F 4 "" H 14858 -3919 60  0000 C CNN "Field4"
	1    14900 -4150
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0117
U 1 1 60C24980
P 14800 -4150
F 0 "#SUPPLY0117" H 14850 -4150 45  0001 L BNN
F 1 "5V" V 14800 -4022 45  0000 L CNN
F 2 "" V 14842 -4022 60  0000 L CNN
F 3 "" H 14800 -4150 60  0001 C CNN
	1    14800 -4150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 60C24986
P 14800 -4050
F 0 "#PWR0107" H 14800 -4050 30  0001 C CNN
F 1 "GND" H 14800 -4120 30  0001 C CNN
F 2 "" H 14800 -4050 50  0001 C CNN
F 3 "" H 14800 -4050 50  0001 C CNN
	1    14800 -4050
	0    1    1    0   
$EndComp
Wire Wire Line
	14800 -4150 15150 -4150
Connection ~ 14800 -4150
Connection ~ 15150 -4150
Wire Wire Line
	15150 -4150 15500 -4150
Connection ~ 15500 -4150
Wire Wire Line
	15500 -4150 15850 -4150
Wire Wire Line
	15850 -4050 15500 -4050
Connection ~ 14800 -4050
Connection ~ 15150 -4050
Wire Wire Line
	15150 -4050 14800 -4050
Connection ~ 15500 -4050
Wire Wire Line
	15500 -4050 15150 -4050
Text GLabel 9400 -900 0    50   Input ~ 0
current_sense_output
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0118
U 1 1 60C38B79
P 17400 -3350
F 0 "#SUPPLY0118" H 17450 -3350 45  0001 L BNN
F 1 "3.3V" H 17400 -3180 45  0000 C CNN
F 2 "" V 17358 -3223 60  0000 L CNN
F 3 "" H 17400 -3350 60  0001 C CNN
	1    17400 -3350
	0    1    1    0   
$EndComp
Wire Wire Line
	16850 -3550 17400 -3550
Wire Wire Line
	16850 -3450 17400 -3450
$Comp
L conn:CONN_3 J13
U 1 1 60C43CAA
P 17050 -3450
F 0 "J13" H 17050 -3528 45  0000 R CNN
F 1 "CONN_02" V 16966 -3528 45  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 17050 -3200 20  0001 C CNN
F 3 "" H 17050 -3450 50  0001 C CNN
F 4 "" H 17008 -3219 60  0000 C CNN "Field4"
	1    17050 -3450
	-1   0    0    1   
$EndComp
Connection ~ 17400 -3550
Wire Wire Line
	17400 -3550 17450 -3550
Connection ~ 17400 -3450
Wire Wire Line
	17400 -3450 17450 -3450
$EndSCHEMATC
