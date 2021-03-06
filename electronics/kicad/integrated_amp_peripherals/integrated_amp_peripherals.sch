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
L SparkFun-PowerSymbols:12V #SUPPLY01
U 1 1 5F7C3D57
P 5850 2150
F 0 "#SUPPLY01" H 5900 2150 45  0001 L BNN
F 1 "12V" V 5850 2278 45  0000 L CNN
F 2 "" V 5808 2277 60  0000 L CNN
F 3 "" H 5850 2150 60  0001 C CNN
	1    5850 2150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5FD21670
P 4000 2100
F 0 "J3" H 4080 2092 50  0000 L CNN
F 1 "Conn_01x04" H 4080 2001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical_SMD_Pin1Left" H 4000 2100 50  0001 C CNN
F 3 "~" H 4000 2100 50  0001 C CNN
	1    4000 2100
	1    0    0    -1  
$EndComp
Text GLabel 3800 2200 0    50   Input ~ 0
SDA
Text GLabel 3800 2300 0    50   Input ~ 0
SCL
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0117
U 1 1 5FD2629A
P 3800 2000
F 0 "#SUPPLY0117" H 3850 2000 45  0001 L BNN
F 1 "3.3V" H 3800 2170 45  0000 C CNN
F 2 "" V 3758 2127 60  0000 L CNN
F 3 "" H 3800 2000 60  0001 C CNN
	1    3800 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5FD26AE4
P 3800 2100
F 0 "#PWR0130" H 3800 2100 30  0001 C CNN
F 1 "GND" H 3800 2030 30  0001 C CNN
F 2 "" H 3800 2100 50  0001 C CNN
F 3 "" H 3800 2100 50  0001 C CNN
	1    3800 2100
	0    1    1    0   
$EndComp
$Comp
L conn:CONN_6 P2
U 1 1 604CC1DF
P 1600 2700
F 0 "P2" H 1467 3187 60  0000 C CNN
F 1 "CONN_6" H 1467 3081 60  0000 C CNN
F 2 "Connectors2:1X06-SMD_RA_MALE" H 1600 2700 50  0001 C CNN
F 3 "" H 1600 2700 50  0001 C CNN
	1    1600 2700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 604CD9BF
P 5850 2250
F 0 "#PWR0103" H 5850 2250 30  0001 C CNN
F 1 "GND" H 5850 2180 30  0001 C CNN
F 2 "" H 5850 2250 50  0001 C CNN
F 3 "" H 5850 2250 50  0001 C CNN
	1    5850 2250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 605078C6
P 1950 2950
F 0 "#PWR0106" H 1950 2950 30  0001 C CNN
F 1 "GND" H 1950 2880 30  0001 C CNN
F 2 "" H 1950 2950 50  0001 C CNN
F 3 "" H 1950 2950 50  0001 C CNN
	1    1950 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 60509D7B
P 1950 2650
F 0 "#PWR0107" H 1950 2650 30  0001 C CNN
F 1 "GND" H 1950 2580 30  0001 C CNN
F 2 "" H 1950 2650 50  0001 C CNN
F 3 "" H 1950 2650 50  0001 C CNN
	1    1950 2650
	0    -1   -1   0   
$EndComp
Text GLabel 4250 3700 2    50   Input ~ 0
SDA
Text GLabel 4250 3600 2    50   Input ~ 0
SCL
$Comp
L Connector:Conn_01x14_Female J4
U 1 1 6050EDA8
P 4050 3600
F 0 "J4" H 3942 2675 50  0000 C CNN
F 1 "Conn_01x14_Female" H 3942 2766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical_SMD_Pin1Right" H 4050 3600 50  0001 C CNN
F 3 "~" H 4050 3600 50  0001 C CNN
	1    4050 3600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x14_Female J1
U 1 1 60513188
P 3200 3600
F 0 "J1" H 3092 2675 50  0000 C CNN
F 1 "Conn_01x14_Female" H 3092 2766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical_SMD_Pin1Right" H 3200 3600 50  0001 C CNN
F 3 "~" H 3200 3600 50  0001 C CNN
	1    3200 3600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60517CDB
P 3400 2900
F 0 "#PWR0109" H 3400 2900 30  0001 C CNN
F 1 "GND" H 3400 2830 30  0001 C CNN
F 2 "" H 3400 2900 50  0001 C CNN
F 3 "" H 3400 2900 50  0001 C CNN
	1    3400 2900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 60518919
P 4250 3000
F 0 "#PWR0110" H 4250 3000 30  0001 C CNN
F 1 "GND" H 4250 2930 30  0001 C CNN
F 2 "" H 4250 3000 50  0001 C CNN
F 3 "" H 4250 3000 50  0001 C CNN
	1    4250 3000
	0    -1   -1   0   
$EndComp
Text GLabel 6650 4300 0    50   Input ~ 0
current_sense_output
Text GLabel 3050 3950 0    50   Input ~ 0
GAIN_DAC_I2C_SELECT
Text GLabel 3050 4100 0    50   Input ~ 0
GATE_DAC_I2C_SELECT
Text GLabel 3050 4250 0    50   Input ~ 0
TUNING_DAC_I2C_SELECT
Text GLabel 3000 3600 0    50   Input ~ 0
~VCO_POWER_CONTROL
Text GLabel 3000 3450 0    50   Input ~ 0
~AMP_DRAIN_CONTROL
Text GLabel 3400 3000 2    50   Input ~ 0
RX0
Text GLabel 3400 3100 2    50   Input ~ 0
TX0
Text GLabel 3400 3700 2    50   Input ~ 0
RX3
Text GLabel 3400 3800 2    50   Input ~ 0
TX3
Text GLabel 1950 2450 2    50   Input ~ 0
RX0
Text GLabel 1950 2550 2    50   Input ~ 0
TX0
Text GLabel 1950 2750 2    50   Input ~ 0
RX3
Text GLabel 1950 2850 2    50   Input ~ 0
TX3
Wire Wire Line
	3050 3950 3050 4000
Wire Wire Line
	3050 4000 3400 4000
Wire Wire Line
	3400 4100 3050 4100
Wire Wire Line
	3050 4250 3050 4200
Wire Wire Line
	3050 4200 3400 4200
Wire Wire Line
	3000 3450 3000 3500
Wire Wire Line
	3000 3500 3400 3500
Wire Wire Line
	3400 3600 3000 3600
$Comp
L SparkFun-Connectors:CONN_03 J5
U 1 1 605E2923
P 5750 2250
F 0 "J5" H 5708 2760 45  0000 C CNN
F 1 "CONN_03" H 5708 2676 45  0000 C CNN
F 2 "Connectors2:1X03_SMD_RA_MALE" H 5750 2650 20  0001 C CNN
F 3 "" H 5750 2250 50  0001 C CNN
F 4 "XXX-00000" H 5708 2581 60  0000 C CNN "Field4"
	1    5750 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 607F381D
P 5850 2050
F 0 "#PWR0134" H 5850 2050 30  0001 C CNN
F 1 "GND" H 5850 1980 30  0001 C CNN
F 2 "" H 5850 2050 50  0001 C CNN
F 3 "" H 5850 2050 50  0001 C CNN
	1    5850 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 6085A149
P 6900 3700
F 0 "#PWR0135" H 6900 3700 30  0001 C CNN
F 1 "GND" H 6900 3630 30  0001 C CNN
F 2 "" H 6900 3700 50  0001 C CNN
F 3 "" H 6900 3700 50  0001 C CNN
	1    6900 3700
	0    1    1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:3.3V #SUPPLY0129
U 1 1 6085E7DC
P 6900 3900
F 0 "#SUPPLY0129" H 6950 3900 45  0001 L BNN
F 1 "3.3V" H 6900 4070 45  0000 C CNN
F 2 "" V 6858 4027 60  0000 L CNN
F 3 "" H 6900 3900 60  0001 C CNN
	1    6900 3900
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY0130
U 1 1 6085EB17
P 6900 3800
F 0 "#SUPPLY0130" H 6950 3800 45  0001 L BNN
F 1 "5V" V 6900 3928 45  0000 L CNN
F 2 "" V 6942 3928 60  0000 L CNN
F 3 "" H 6900 3800 60  0001 C CNN
	1    6900 3800
	0    -1   -1   0   
$EndComp
Text GLabel 6650 4750 0    50   Input ~ 0
GAIN_DAC_I2C_SELECT
Text GLabel 6650 4900 0    50   Input ~ 0
GATE_DAC_I2C_SELECT
Text GLabel 6650 5050 0    50   Input ~ 0
TUNING_DAC_I2C_SELECT
Text GLabel 6650 4600 0    50   Input ~ 0
~VCO_POWER_CONTROL
Text GLabel 6650 4450 0    50   Input ~ 0
~AMP_DRAIN_CONTROL
$Comp
L conn:CONN_6 P3
U 1 1 608C54BB
P 7250 4650
F 0 "P3" H 7117 5137 60  0000 C CNN
F 1 "CONN_6" H 7117 5031 60  0000 C CNN
F 2 "Connectors2:1X06-SMD_RA_MALE" H 7250 4650 50  0001 C CNN
F 3 "" H 7250 4650 50  0001 C CNN
	1    7250 4650
	1    0    0    1   
$EndComp
Wire Wire Line
	6900 4400 6650 4400
Wire Wire Line
	6650 4400 6650 4300
Wire Wire Line
	6650 4450 6900 4450
Wire Wire Line
	6900 4450 6900 4500
Wire Wire Line
	6650 4600 6900 4600
Text GLabel 6900 4000 0    50   Input ~ 0
SDA
Text GLabel 6900 4100 0    50   Input ~ 0
SCL
$Comp
L conn:CONN_6 P1
U 1 1 608DA211
P 7250 3950
F 0 "P1" H 7117 4437 60  0000 C CNN
F 1 "CONN_6" H 7117 4331 60  0000 C CNN
F 2 "Connectors2:1X06-SMD_RA_MALE" H 7250 3950 50  0001 C CNN
F 3 "" H 7250 3950 50  0001 C CNN
	1    7250 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	6650 4750 6900 4750
Wire Wire Line
	6900 4750 6900 4700
Wire Wire Line
	6650 4900 6750 4900
Wire Wire Line
	6750 4900 6750 4800
Wire Wire Line
	6750 4800 6900 4800
Wire Wire Line
	6650 5100 6900 5100
Wire Wire Line
	6900 5100 6900 4900
Wire Wire Line
	6650 5050 6650 5100
$EndSCHEMATC
