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
L 0xDBFB7:attenuator R1
U 1 1 5F1BA683
P 4450 4850
F 0 "R1" H 4475 4975 50  0000 C CNN
F 1 "PAT1220 -10 dB" H 4475 4884 50  0000 C CNN
F 2 "0xDBFB7:PAT1220" H 4450 4850 50  0001 C CNN
F 3 "" H 4450 4850 50  0001 C CNN
	1    4450 4850
	1    0    0    -1  
$EndComp
$Comp
L 0xDBFB7:attenuator R2
U 1 1 5F1BAD25
P 5250 4850
F 0 "R2" H 5275 4975 50  0000 C CNN
F 1 "PAT1220 -10 dB" H 5275 4884 50  0000 C CNN
F 2 "0xDBFB7:PAT1220" H 5250 4850 50  0001 C CNN
F 3 "" H 5250 4850 50  0001 C CNN
	1    5250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4950 5050 4950
$Comp
L Device:D D2
U 1 1 5F1BBE98
P 6350 4800
F 0 "D2" V 6304 4879 50  0000 L CNN
F 1 "PIN diode" V 6395 4879 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 6350 4800 50  0001 C CNN
F 3 "~" H 6350 4800 50  0001 C CNN
	1    6350 4800
	0    -1   -1   0   
$EndComp
$Comp
L dk_Coaxial-Connectors-RF:CONSMA001-SMD-G J2
U 1 1 5F1BE2B9
P 7550 4650
F 0 "J2" H 7463 4519 60  0000 R CNN
F 1 "CONSMA001-SMD-G" H 7463 4625 60  0000 R CNN
F 2 "digikey-footprints:RF_SMA_Receptical_Vertical_CONSMA001-SMD-G" H 7750 4850 60  0001 L CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/consma001-smd-g.pdf" H 7750 4950 60  0001 L CNN
F 4 "CONSMA001-SMD-G-ND" H 7750 5050 60  0001 L CNN "Digi-Key_PN"
F 5 "CONSMA001-SMD-G" H 7750 5150 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7750 5250 60  0001 L CNN "Category"
F 7 "Coaxial Connectors (RF)" H 7750 5350 60  0001 L CNN "Family"
F 8 "https://linxtechnologies.com/wp/wp-content/uploads/consma001-smd-g.pdf" H 7750 5450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/linx-technologies-inc/CONSMA001-SMD-G/CONSMA001-SMD-G-ND/4496569" H 7750 5550 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN SMA RCPT STR 50 OHM SMD" H 7750 5650 60  0001 L CNN "Description"
F 11 "Linx Technologies Inc." H 7750 5750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7750 5850 60  0001 L CNN "Status"
	1    7550 4650
	-1   0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C1
U 1 1 5F0C3B35
P 2950 1350
F 0 "C1" V 2716 1400 45  0000 C CNN
F 1 "10 nF" V 2800 1400 45  0000 C CNN
F 2 "0603" H 2950 1600 20  0001 C CNN
F 3 "" H 2950 1350 50  0001 C CNN
F 4 "" H 3058 1316 60  0000 L CNN "Field4"
	1    2950 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 1650 3550 1650
$Comp
L SparkFun-Resistors:RESISTOR0402 R13
U 1 1 5F05AE24
P 3300 1850
F 0 "R13" V 3395 1782 45  0000 R CNN
F 1 "1k" V 3311 1782 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 2000 20  0001 C CNN
F 3 "" H 3300 1850 60  0001 C CNN
F 4 " " V 3216 1782 60  0000 R CNN "Field4"
	1    3300 1850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EE3A599
P 2950 1550
F 0 "#PWR0104" H 2950 1550 30  0001 C CNN
F 1 "GND" H 2950 1480 30  0001 C CNN
F 2 "" H 2950 1550 50  0001 C CNN
F 3 "" H 2950 1550 50  0001 C CNN
	1    2950 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EF8058D
P 2400 1650
F 0 "#PWR0110" H 2400 1650 30  0001 C CNN
F 1 "GND" H 2400 1580 30  0001 C CNN
F 2 "" H 2400 1650 50  0001 C CNN
F 3 "" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5EF6BA12
P 2300 1450
F 0 "Q1" H 2506 1496 50  0000 L CNN
F 1 "2N7002" H 2506 1405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2500 1375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 2300 1450 50  0001 L CNN
	1    2300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1250 3300 1250
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R9
U 1 1 5EF6F186
P 2400 1050
F 0 "R9" V 2495 982 45  0000 R CNN
F 1 "30k" V 2411 982 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2400 1200 20  0001 C CNN
F 3 "" H 2400 1050 60  0001 C CNN
F 4 " " V 2316 982 60  0000 R CNN "Field4"
	1    2400 1050
	0    -1   -1   0   
$EndComp
Connection ~ 2950 1250
Connection ~ 2400 1250
Connection ~ 3300 1650
$Comp
L SparkFun-Resistors:RESISTOR0402 R11
U 1 1 5EFCAE51
P 3300 1450
F 0 "R11" V 3395 1382 45  0000 R CNN
F 1 "30k" H 3311 1382 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 1600 20  0001 C CNN
F 3 "" H 3300 1450 60  0001 C CNN
F 4 " " V 3216 1382 60  0000 R CNN "Field4"
	1    3300 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5EFCD01D
P 3300 2050
F 0 "#PWR0111" H 3300 2050 30  0001 C CNN
F 1 "GND" H 3300 1980 30  0001 C CNN
F 2 "" H 3300 2050 50  0001 C CNN
F 3 "" H 3300 2050 50  0001 C CNN
	1    3300 2050
	1    0    0    -1  
$EndComp
Text GLabel 3600 1650 2    50   Input ~ 0
VARACTOR_FEEDBACK
$Comp
L power2:+48V #PWR0105
U 1 1 5F211AFB
P 2400 850
F 0 "#PWR0105" H 2400 700 50  0001 C CNN
F 1 "+48V" H 2415 1023 50  0000 C CNN
F 2 "" H 2400 850 50  0001 C CNN
F 3 "" H 2400 850 50  0001 C CNN
	1    2400 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Test_Point TP3
U 1 1 5EEC794F
P 3900 1000
F 0 "TP3" H 3958 1118 50  0000 L CNN
F 1 "Test_Point" H 3958 1027 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4100 1000 50  0001 C CNN
F 3 "~" H 4100 1000 50  0001 C CNN
	1    3900 1000
	0    1    1    0   
$EndComp
Text GLabel 3300 1250 2    50   Input ~ 0
VARACTOR_OUT
Text GLabel 3900 1000 0    50   Input ~ 0
VARACTOR_OUT
$Comp
L SparkFun-Capacitors:4.7UF0603 C2
U 1 1 5EEF63C1
P 2900 850
F 0 "C2" V 2666 900 45  0000 C CNN
F 1 "0.1 uF" V 2750 900 45  0000 C CNN
F 2 "0603" H 2900 1100 20  0001 C CNN
F 3 "" H 2900 850 50  0001 C CNN
F 4 "" H 3008 816 60  0000 L CNN "Field4"
	1    2900 850 
	0    1    1    0   
$EndComp
$Comp
L power2:+48V #PWR0101
U 1 1 5EEF78EF
P 2800 850
F 0 "#PWR0101" H 2800 700 50  0001 C CNN
F 1 "+48V" H 2815 1023 50  0000 C CNN
F 2 "" H 2800 850 50  0001 C CNN
F 3 "" H 2800 850 50  0001 C CNN
	1    2800 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EEF7C9B
P 3100 850
F 0 "#PWR0102" H 3100 850 30  0001 C CNN
F 1 "GND" H 3100 780 30  0001 C CNN
F 2 "" H 3100 850 50  0001 C CNN
F 3 "" H 3100 850 50  0001 C CNN
	1    3100 850 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS84 Q3
U 1 1 5F1C22E6
P 2050 2600
F 0 "Q3" H 2256 2646 50  0000 L CNN
F 1 "BSS84" H 2256 2555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2250 2525 50  0001 L CIN
F 3 "http://assets.nexperia.com/documents/data-sheet/BSS84.pdf" H 2050 2600 50  0001 L CNN
	1    2050 2600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5F1C2CEC
P 1750 3100
F 0 "Q2" H 1956 3146 50  0000 L CNN
F 1 "2N7002" H 1956 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1950 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 1750 3100 50  0001 L CNN
	1    1750 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:D D4
U 1 1 5F1D22B6
P 6350 4500
F 0 "D4" V 6304 4579 50  0000 L CNN
F 1 "PIN diode" V 6395 4579 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 6350 4500 50  0001 C CNN
F 3 "~" H 6350 4500 50  0001 C CNN
	1    6350 4500
	0    -1   1    0   
$EndComp
Wire Wire Line
	6350 4650 6550 4650
$Comp
L power:GND #PWR0103
U 1 1 5F1D5F3C
P 4250 5100
F 0 "#PWR0103" H 4250 5100 30  0001 C CNN
F 1 "GND" H 4250 5030 30  0001 C CNN
F 2 "" H 4250 5100 50  0001 C CNN
F 3 "" H 4250 5100 50  0001 C CNN
	1    4250 5100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F1D64BC
P 5050 5100
F 0 "#PWR0106" H 5050 5100 30  0001 C CNN
F 1 "GND" H 5050 5030 30  0001 C CNN
F 2 "" H 5050 5100 50  0001 C CNN
F 3 "" H 5050 5100 50  0001 C CNN
	1    5050 5100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F1D6970
P 7550 4850
F 0 "#PWR0107" H 7550 4850 30  0001 C CNN
F 1 "GND" H 7550 4780 30  0001 C CNN
F 2 "" H 7550 4850 50  0001 C CNN
F 3 "" H 7550 4850 50  0001 C CNN
	1    7550 4850
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C9
U 1 1 5F01536C
P 8450 2850
F 0 "C9" H 8558 2942 45  0000 L CNN
F 1 "100 pF" H 8558 2858 45  0000 L CNN
F 2 "0402" H 8450 3100 20  0001 C CNN
F 3 "" H 8450 2850 50  0001 C CNN
F 4 "" H 8558 2816 60  0000 L CNN "Field4"
	1    8450 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F016B90
P 8450 2950
F 0 "#PWR0108" H 8450 2950 30  0001 C CNN
F 1 "GND" H 8450 2880 30  0001 C CNN
F 2 "" H 8450 2950 50  0001 C CNN
F 3 "" H 8450 2950 50  0001 C CNN
	1    8450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2650 8250 2650
Connection ~ 8450 2650
$Comp
L SparkFun-Resistors:RESISTOR0402 R16
U 1 1 5F0217ED
P 8900 2850
F 0 "R16" V 8805 2918 45  0000 L CNN
F 1 "10k" V 8889 2918 45  0000 L CNN
F 2 "0402" H 8900 3000 20  0001 C CNN
F 3 "" H 8900 2850 60  0001 C CNN
F 4 " " V 8984 2918 60  0000 L CNN "Field4"
	1    8900 2850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F021FD0
P 8900 3050
F 0 "#PWR0109" H 8900 3050 30  0001 C CNN
F 1 "GND" H 8900 2980 30  0001 C CNN
F 2 "" H 8900 3050 50  0001 C CNN
F 3 "" H 8900 3050 50  0001 C CNN
	1    8900 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2650 8900 2650
Text Notes 750  7450 0    50   ~ 0
"since the detector does not conserve phase information, all phasors that appear as factors can be replaced by their magnitudes." - *happiness noise*
Text Notes 750  7200 0    50   ~ 0
RF diode detector based on infineon appnote AN_1807.
$Comp
L Diode:BAS40-04 D5
U 1 1 5F013846
P 7950 2750
F 0 "D5" H 7950 3075 50  0000 C CNN
F 1 "BAT15-04" H 7950 2984 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7700 3050 50  0001 L CNN
F 3 "http://www.vishay.com/docs/85701/bas40v.pdf" H 7830 2850 50  0001 C CNN
	1    7950 2750
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C7
U 1 1 5F1E264D
P 7450 3000
F 0 "C7" H 7558 3092 45  0000 L CNN
F 1 "100 pF" H 7558 3008 45  0000 L CNN
F 2 "0402" H 7450 3250 20  0001 C CNN
F 3 "" H 7450 3000 50  0001 C CNN
F 4 "" H 7558 2966 60  0000 L CNN "Field4"
	1    7450 3000
	0    1    1    0   
$EndComp
$Comp
L Diode:BAS40-04 D6
U 1 1 5F1E3938
P 7950 3400
F 0 "D6" H 7950 3725 50  0000 C CNN
F 1 "BAT15-04" H 7950 3634 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7700 3700 50  0001 L CNN
F 3 "http://www.vishay.com/docs/85701/bas40v.pdf" H 7830 3500 50  0001 C CNN
	1    7950 3400
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C8
U 1 1 5F1EBCB9
P 7950 3700
F 0 "C8" H 8058 3792 45  0000 L CNN
F 1 "100 pF" H 8058 3708 45  0000 L CNN
F 2 "0402" H 7950 3950 20  0001 C CNN
F 3 "" H 7950 3700 50  0001 C CNN
F 4 "" H 8058 3666 60  0000 L CNN "Field4"
	1    7950 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F1EBCBF
P 7950 3800
F 0 "#PWR0112" H 7950 3800 30  0001 C CNN
F 1 "GND" H 7950 3730 30  0001 C CNN
F 2 "" H 7950 3800 50  0001 C CNN
F 3 "" H 7950 3800 50  0001 C CNN
	1    7950 3800
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R15
U 1 1 5F1EBCC6
P 8450 3700
F 0 "R15" V 8355 3768 45  0000 L CNN
F 1 "10k" V 8439 3768 45  0000 L CNN
F 2 "0402" H 8450 3850 20  0001 C CNN
F 3 "" H 8450 3700 60  0001 C CNN
F 4 " " V 8534 3768 60  0000 L CNN "Field4"
	1    8450 3700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5F1EBCCC
P 8450 3900
F 0 "#PWR0113" H 8450 3900 30  0001 C CNN
F 1 "GND" H 8450 3830 30  0001 C CNN
F 2 "" H 8450 3900 50  0001 C CNN
F 3 "" H 8450 3900 50  0001 C CNN
	1    8450 3900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R8
U 1 1 5F1F2F1D
P 5800 5150
F 0 "R8" V 5705 5218 45  0000 L CNN
F 1 "10k" V 5789 5218 45  0000 L CNN
F 2 "0402" H 5800 5300 20  0001 C CNN
F 3 "" H 5800 5150 60  0001 C CNN
F 4 " " V 5884 5218 60  0000 L CNN "Field4"
	1    5800 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 4950 6350 4950
$Comp
L Transistor_FET:BSS138 Q5
U 1 1 5F1F3DC1
P 5700 5550
F 0 "Q5" H 5906 5596 50  0000 L CNN
F 1 "2N7002" H 5906 5505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5900 5475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5700 5550 50  0001 L CNN
	1    5700 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5F1F4DF5
P 5800 5750
F 0 "#PWR0114" H 5800 5750 30  0001 C CNN
F 1 "GND" H 5800 5680 30  0001 C CNN
F 2 "" H 5800 5750 50  0001 C CNN
F 3 "" H 5800 5750 50  0001 C CNN
	1    5800 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3000 7150 3000
Wire Wire Line
	7150 3000 7150 4650
Wire Wire Line
	7150 4650 7350 4650
Wire Wire Line
	7650 2650 7650 3000
Connection ~ 7650 3000
Wire Wire Line
	7650 3000 7650 3300
Wire Wire Line
	7950 3500 8450 3500
Connection ~ 7950 3500
Text GLabel 1350 1450 0    50   Input ~ 0
~VARACTOR_PWM
$Comp
L SparkFun-Resistors:RESISTOR0402 R3
U 1 1 5F21E957
P 1850 2700
F 0 "R3" V 1945 2632 45  0000 R CNN
F 1 "1k" V 1861 2632 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1850 2850 20  0001 C CNN
F 3 "" H 1850 2700 60  0001 C CNN
F 4 " " V 1766 2632 60  0000 R CNN "Field4"
	1    1850 2700
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C5
U 1 1 5F22281B
P 5600 4950
F 0 "C5" H 5708 5042 45  0000 L CNN
F 1 "100 pF" H 5708 4958 45  0000 L CNN
F 2 "0402" H 5600 5200 20  0001 C CNN
F 3 "" H 5600 4950 50  0001 C CNN
F 4 "" H 5708 4916 60  0000 L CNN "Field4"
	1    5600 4950
	0    1    -1   0   
$EndComp
Connection ~ 5800 4950
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C6
U 1 1 5F22BCEA
P 6800 4650
F 0 "C6" H 6908 4742 45  0000 L CNN
F 1 "100 pF" H 6908 4658 45  0000 L CNN
F 2 "0402" H 6800 4900 20  0001 C CNN
F 3 "" H 6800 4650 50  0001 C CNN
F 4 "" H 6908 4616 60  0000 L CNN "Field4"
	1    6800 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 4650 7150 4650
Connection ~ 7150 4650
$Comp
L SparkFun-Resistors:RESISTOR0402 R14
U 1 1 5F22CCCB
P 6550 4450
F 0 "R14" V 6455 4518 45  0000 L CNN
F 1 "10k" V 6539 4518 45  0000 L CNN
F 2 "0402" H 6550 4600 20  0001 C CNN
F 3 "" H 6550 4450 60  0001 C CNN
F 4 " " V 6634 4518 60  0000 L CNN "Field4"
	1    6550 4450
	0    1    1    0   
$EndComp
Connection ~ 6550 4650
Wire Wire Line
	6550 4650 6700 4650
Connection ~ 6350 4650
$Comp
L power2:+48V #PWR0115
U 1 1 5F22ECDC
P 6550 4250
F 0 "#PWR0115" H 6550 4100 50  0001 C CNN
F 1 "+48V" H 6565 4423 50  0000 C CNN
F 2 "" H 6550 4250 50  0001 C CNN
F 3 "" H 6550 4250 50  0001 C CNN
	1    6550 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4350 6350 4350
$Comp
L SparkFun-Resistors:RESISTOR0402 R7
U 1 1 5F258AED
P 5800 4150
F 0 "R7" V 5705 4218 45  0000 L CNN
F 1 "10k" V 5789 4218 45  0000 L CNN
F 2 "0402" H 5800 4300 20  0001 C CNN
F 3 "" H 5800 4150 60  0001 C CNN
F 4 " " V 5884 4218 60  0000 L CNN "Field4"
	1    5800 4150
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q6
U 1 1 5F258AF3
P 5900 3750
F 0 "Q6" H 6106 3796 50  0000 L CNN
F 1 "2N7002" H 6106 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6100 3675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5900 3750 50  0001 L CNN
	1    5900 3750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5F258AF9
P 5800 3550
F 0 "#PWR0117" H 5800 3550 30  0001 C CNN
F 1 "GND" H 5800 3480 30  0001 C CNN
F 2 "" H 5800 3550 50  0001 C CNN
F 3 "" H 5800 3550 50  0001 C CNN
	1    5800 3550
	-1   0    0    1   
$EndComp
Text Notes 5300 6450 0    50   ~ 0
Attenuator channels could be NOT'd; however, we might want a zero-input control sample, in which case we want independent control of both paths.
Text GLabel 6100 3750 2    50   Input ~ 0
~ATTENUATE
$Comp
L Connector:Test_Point TP1
U 1 1 5F26DDBD
P 1250 2500
F 0 "TP1" H 1308 2618 50  0000 L CNN
F 1 "Test_Point" H 1308 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 1450 2500 50  0001 C CNN
F 3 "~" H 1450 2500 50  0001 C CNN
	1    1250 2500
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 5F271377
P 1250 2500
F 0 "#PWR0118" H 1250 2590 20  0001 C CNN
F 1 "+5V" V 1246 2598 30  0000 L CNN
F 2 "" H 1250 2500 50  0001 C CNN
F 3 "" H 1250 2500 50  0001 C CNN
	1    1250 2500
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C3
U 1 1 5F275886
P 3950 4950
F 0 "C3" H 4058 5042 45  0000 L CNN
F 1 "100 pF" H 4058 4958 45  0000 L CNN
F 2 "0402" H 3950 5200 20  0001 C CNN
F 3 "" H 3950 4950 50  0001 C CNN
F 4 "" H 4058 4916 60  0000 L CNN "Field4"
	1    3950 4950
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R4
U 1 1 5F278523
P 3850 5150
F 0 "R4" V 3755 5218 45  0000 L CNN
F 1 "10k" V 3839 5218 45  0000 L CNN
F 2 "0402" H 3850 5300 20  0001 C CNN
F 3 "" H 3850 5150 60  0001 C CNN
F 4 " " V 3934 5218 60  0000 L CNN "Field4"
	1    3850 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 5350 3850 5350
Connection ~ 5800 5350
Wire Wire Line
	4150 4950 4250 4950
$Comp
L Device:D D1
U 1 1 5F27E79D
P 3500 4800
F 0 "D1" V 3454 4879 50  0000 L CNN
F 1 "PIN diode" V 3545 4879 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 3500 4800 50  0001 C CNN
F 3 "~" H 3500 4800 50  0001 C CNN
	1    3500 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 4950 3500 4950
Connection ~ 3850 4950
Wire Wire Line
	3500 4350 3500 4650
Wire Wire Line
	3500 4350 5500 4350
Wire Wire Line
	2550 1250 2950 1250
Wire Wire Line
	2400 1250 2550 1250
Connection ~ 2550 1250
$Comp
L SparkFun-Resistors:RESISTOR0402 R10
U 1 1 5EF918DB
P 2750 1250
F 0 "R10" V 2845 1182 45  0000 R CNN
F 1 "1k" V 2761 1182 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2750 1400 20  0001 C CNN
F 3 "" H 2750 1250 60  0001 C CNN
F 4 " " V 2666 1182 60  0000 R CNN "Field4"
	1    2750 1250
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R5
U 1 1 5F288777
P 1550 1450
F 0 "R5" V 1645 1382 45  0000 R CNN
F 1 "1k" V 1561 1382 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1550 1600 20  0001 C CNN
F 3 "" H 1550 1450 60  0001 C CNN
F 4 " " V 1466 1382 60  0000 R CNN "Field4"
	1    1550 1450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C10
U 1 1 5F289635
P 2100 1550
F 0 "C10" V 1866 1600 45  0000 C CNN
F 1 "10uF" V 1950 1600 45  0000 C CNN
F 2 "0603" H 2100 1800 20  0001 C CNN
F 3 "" H 2100 1550 50  0001 C CNN
F 4 "" H 2208 1516 60  0000 L CNN "Field4"
	1    2100 1550
	-1   0    0    1   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R12
U 1 1 5F28C463
P 1750 1650
F 0 "R12" V 1845 1582 45  0000 R CNN
F 1 "1k" V 1761 1582 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1750 1800 20  0001 C CNN
F 3 "" H 1750 1650 60  0001 C CNN
F 4 " " V 1666 1582 60  0000 R CNN "Field4"
	1    1750 1650
	0    1    1    0   
$EndComp
Connection ~ 1750 1450
Wire Wire Line
	2100 1450 1750 1450
Connection ~ 2100 1450
$Comp
L power:GND #PWR0116
U 1 1 5F28E9FF
P 2100 1750
F 0 "#PWR0116" H 2100 1750 30  0001 C CNN
F 1 "GND" H 2100 1680 30  0001 C CNN
F 2 "" H 2100 1750 50  0001 C CNN
F 3 "" H 2100 1750 50  0001 C CNN
	1    2100 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F28F10D
P 1750 1850
F 0 "#PWR0119" H 1750 1850 30  0001 C CNN
F 1 "GND" H 1750 1780 30  0001 C CNN
F 2 "" H 1750 1850 50  0001 C CNN
F 3 "" H 1750 1850 50  0001 C CNN
	1    1750 1850
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R19
U 1 1 5F291438
P 5500 5750
F 0 "R19" V 5595 5682 45  0000 R CNN
F 1 "1k" V 5511 5682 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5500 5900 20  0001 C CNN
F 3 "" H 5500 5750 60  0001 C CNN
F 4 " " V 5416 5682 60  0000 R CNN "Field4"
	1    5500 5750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F29552F
P 5500 5950
F 0 "#PWR0120" H 5500 5950 30  0001 C CNN
F 1 "GND" H 5500 5880 30  0001 C CNN
F 2 "" H 5500 5950 50  0001 C CNN
F 3 "" H 5500 5950 50  0001 C CNN
	1    5500 5950
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C11
U 1 1 5F2961FE
P 2950 4650
F 0 "C11" H 3058 4742 45  0000 L CNN
F 1 "100 pF" H 3058 4658 45  0000 L CNN
F 2 "0402" H 2950 4900 20  0001 C CNN
F 3 "" H 2950 4650 50  0001 C CNN
F 4 "" H 3058 4616 60  0000 L CNN "Field4"
	1    2950 4650
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R18
U 1 1 5F29A7D7
P 3250 4450
F 0 "R18" V 3155 4518 45  0000 L CNN
F 1 "10k" V 3239 4518 45  0000 L CNN
F 2 "0402" H 3250 4600 20  0001 C CNN
F 3 "" H 3250 4450 60  0001 C CNN
F 4 " " V 3334 4518 60  0000 L CNN "Field4"
	1    3250 4450
	0    1    1    0   
$EndComp
$Comp
L power2:+48V #PWR0123
U 1 1 5F29A7DD
P 3250 4250
F 0 "#PWR0123" H 3250 4100 50  0001 C CNN
F 1 "+48V" H 3265 4423 50  0000 C CNN
F 2 "" H 3250 4250 50  0001 C CNN
F 3 "" H 3250 4250 50  0001 C CNN
	1    3250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4650 3250 4650
Wire Wire Line
	3250 4650 3500 4650
Connection ~ 3250 4650
Connection ~ 3500 4650
$Comp
L power:+5V #PWR0124
U 1 1 5F2A113E
P 1850 2500
F 0 "#PWR0124" H 1850 2590 20  0001 C CNN
F 1 "+5V" V 1847 2598 30  0000 L CNN
F 2 "" H 1850 2500 50  0001 C CNN
F 3 "" H 1850 2500 50  0001 C CNN
	1    1850 2500
	0    -1   -1   0   
$EndComp
Connection ~ 1850 2500
$Comp
L Connector:Test_Point TP4
U 1 1 5F2A18A9
P 2250 2500
F 0 "TP4" H 2308 2618 50  0000 L CNN
F 1 "Test_Point" H 2308 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 2450 2500 50  0001 C CNN
F 3 "~" H 2450 2500 50  0001 C CNN
	1    2250 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2800 2050 2900
Wire Wire Line
	2050 2900 1850 2900
Connection ~ 1850 2900
$Comp
L Device:LED D3
U 1 1 5F2A6877
P 6100 2950
F 0 "D3" V 6047 3028 50  0000 L CNN
F 1 "LED" V 6138 3028 50  0000 L CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6100 2950 50  0001 C CNN
F 3 "~" H 6100 2950 50  0001 C CNN
	1    6100 2950
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R20
U 1 1 5F2A687E
P 6100 3300
F 0 "R20" V 6195 3232 45  0000 R CNN
F 1 "1k" V 6111 3232 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6100 3450 20  0001 C CNN
F 3 "" H 6100 3300 60  0001 C CNN
F 4 " " V 6016 3232 60  0000 R CNN "Field4"
	1    6100 3300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5F2AEFC8
P 6100 2800
F 0 "#PWR0125" H 6100 2800 30  0001 C CNN
F 1 "GND" H 6100 2730 30  0001 C CNN
F 2 "" H 6100 2800 50  0001 C CNN
F 3 "" H 6100 2800 50  0001 C CNN
	1    6100 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 3750 6100 3550
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R21
U 1 1 5F2BA76B
P 6100 3950
F 0 "R21" V 6195 3882 45  0000 R CNN
F 1 "1k" V 6111 3882 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6100 4100 20  0001 C CNN
F 3 "" H 6100 3950 60  0001 C CNN
F 4 " " V 6016 3882 60  0000 R CNN "Field4"
	1    6100 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5F2BA771
P 6100 4150
F 0 "#PWR0126" H 6100 4150 30  0001 C CNN
F 1 "GND" H 6100 4080 30  0001 C CNN
F 2 "" H 6100 4150 50  0001 C CNN
F 3 "" H 6100 4150 50  0001 C CNN
	1    6100 4150
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:0.05OHM-0603-1_5W-1% R17
U 1 1 5F2BF6BD
P 1550 3300
F 0 "R17" V 1645 3232 45  0000 R CNN
F 1 "1k" V 1561 3232 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1550 3450 20  0001 C CNN
F 3 "" H 1550 3300 60  0001 C CNN
F 4 " " V 1466 3232 60  0000 R CNN "Field4"
	1    1550 3300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5F2BF6C3
P 1550 3500
F 0 "#PWR0127" H 1550 3500 30  0001 C CNN
F 1 "GND" H 1550 3430 30  0001 C CNN
F 2 "" H 1550 3500 50  0001 C CNN
F 3 "" H 1550 3500 50  0001 C CNN
	1    1550 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Test_Point TP2
U 1 1 5F2BFFB8
P 2600 4650
F 0 "TP2" H 2658 4768 50  0000 L CNN
F 1 "Test_Point" H 2658 4677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 2800 4650 50  0001 C CNN
F 3 "~" H 2800 4650 50  0001 C CNN
	1    2600 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 4650 2600 4650
Text Notes 4450 2000 0    50   ~ 0
We need both PiN diodes to remove the stub from the circuit.
$Comp
L SparkFun-Resistors:RESISTOR0402 R6
U 1 1 5F28CF49
P 1750 1250
F 0 "R6" V 1845 1182 45  0000 R CNN
F 1 "5k" V 1761 1182 45  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1750 1400 20  0001 C CNN
F 3 "" H 1750 1250 60  0001 C CNN
F 4 " " V 1666 1182 60  0000 R CNN "Field4"
	1    1750 1250
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:1.0UF-1206-50V-10% C12
U 1 1 5F2D5553
P 1250 2700
F 0 "C12" H 1358 2792 45  0000 L CNN
F 1 "10uF" H 1358 2708 45  0000 L CNN
F 2 "1206" H 1250 2950 20  0001 C CNN
F 3 "" H 1250 2700 50  0001 C CNN
F 4 "" H 1358 2666 60  0000 L CNN "Field4"
	1    1250 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5F2D90E9
P 1250 2800
F 0 "#PWR0121" H 1250 2800 30  0001 C CNN
F 1 "GND" H 1250 2730 30  0001 C CNN
F 2 "" H 1250 2800 50  0001 C CNN
F 3 "" H 1250 2800 50  0001 C CNN
	1    1250 2800
	1    0    0    -1  
$EndComp
Connection ~ 1250 2500
$Comp
L power:GND #PWR0122
U 1 1 5F2DDBFE
P 1850 3300
F 0 "#PWR0122" H 1850 3300 30  0001 C CNN
F 1 "GND" H 1850 3230 30  0001 C CNN
F 2 "" H 1850 3300 50  0001 C CNN
F 3 "" H 1850 3300 50  0001 C CNN
	1    1850 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Test_Point TP6
U 1 1 5F3054BA
P 9250 2650
F 0 "TP6" H 9308 2768 50  0000 L CNN
F 1 "Test_Point" H 9308 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9450 2650 50  0001 C CNN
F 3 "~" H 9450 2650 50  0001 C CNN
	1    9250 2650
	0    1    1    0   
$EndComp
$Comp
L Connector:Test_Point TP5
U 1 1 5F305FAA
P 8750 3500
F 0 "TP5" H 8808 3618 50  0000 L CNN
F 1 "Test_Point" H 8808 3527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8950 3500 50  0001 C CNN
F 3 "~" H 8950 3500 50  0001 C CNN
	1    8750 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 3500 8750 3500
Connection ~ 8450 3500
Wire Wire Line
	8900 2650 9250 2650
Connection ~ 8900 2650
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C4
U 1 1 5F2321F4
P 5600 4350
F 0 "C4" H 5708 4442 45  0000 L CNN
F 1 "100 pF" H 5708 4358 45  0000 L CNN
F 2 "0402" H 5600 4600 20  0001 C CNN
F 3 "" H 5600 4350 50  0001 C CNN
F 4 "" H 5708 4316 60  0000 L CNN "Field4"
	1    5600 4350
	0    1    1    0   
$EndComp
$Comp
L Connector:Test_Point TP7
U 1 1 5F34BFB7
P 5500 5550
F 0 "TP7" H 5558 5668 50  0000 L CNN
F 1 "Test_Point" H 5558 5577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5700 5550 50  0001 C CNN
F 3 "~" H 5700 5550 50  0001 C CNN
	1    5500 5550
	0    -1   -1   0   
$EndComp
Connection ~ 5500 5550
$Comp
L Connector:Test_Point TP8
U 1 1 5F355D62
P 6100 3550
F 0 "TP8" H 6158 3668 50  0000 L CNN
F 1 "Test_Point" H 6158 3577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6300 3550 50  0001 C CNN
F 3 "~" H 6300 3550 50  0001 C CNN
	1    6100 3550
	0    1    1    0   
$EndComp
Connection ~ 6100 3550
Wire Wire Line
	6100 3550 6100 3500
$Comp
L Connector:Test_Point TP9
U 1 1 5F38322F
P 1350 1450
F 0 "TP9" H 1408 1568 50  0000 L CNN
F 1 "Test_Point" H 1408 1477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 1550 1450 50  0001 C CNN
F 3 "~" H 1550 1450 50  0001 C CNN
	1    1350 1450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Test_Point TP10
U 1 1 5F39FBCE
P 3550 1650
F 0 "TP10" H 3608 1768 50  0000 L CNN
F 1 "Test_Point" H 3608 1677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3750 1650 50  0001 C CNN
F 3 "~" H 3750 1650 50  0001 C CNN
	1    3550 1650
	-1   0    0    1   
$EndComp
Connection ~ 3550 1650
Wire Wire Line
	3550 1650 3600 1650
$Comp
L power2:+48V #PWR0128
U 1 1 5F3B389B
P 2700 3450
F 0 "#PWR0128" H 2700 3300 50  0001 C CNN
F 1 "+48V" H 2715 3623 50  0000 C CNN
F 2 "" H 2700 3450 50  0001 C CNN
F 3 "" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Test_Point TP11
U 1 1 5F3B3B4F
P 2700 3450
F 0 "TP11" H 2758 3568 50  0000 L CNN
F 1 "Test_Point" H 2758 3477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 2900 3450 50  0001 C CNN
F 3 "~" H 2900 3450 50  0001 C CNN
	1    2700 3450
	-1   0    0    1   
$EndComp
$EndSCHEMATC
