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
L w_transistor:MOS_N Q?
U 1 1 5FFB8EA0
P 9750 4050
F 0 "Q?" H 9927 4156 70  0000 L CNN
F 1 "TSM2N100CHC5G" H 9927 4042 60  0000 L CNN
F 2 "Connectors2:1X03_SMD_RA_MALE" H 9927 3936 60  0000 L CNN
F 3 "" H 9750 4050 60  0000 C CNN
	1    9750 4050
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Gate-Drivers:MCP1416T-E_OT U?
U 1 1 5FFC17FB
P 7350 5550
F 0 "U?" H 7794 5653 60  0000 L CNN
F 1 "MCP1416T-E_OT" H 7794 5547 60  0000 L CNN
F 2 "digikey-footprints:SOT-753" H 7550 5750 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 7550 5850 60  0001 L CNN
F 4 "MCP1416T-E/OTCT-ND" H 7550 5950 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP1416T-E/OT" H 7550 6050 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7550 6150 60  0001 L CNN "Category"
F 7 "PMIC - Gate Drivers" H 7550 6250 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en536128" H 7550 6350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP1416T-E-OT/MCP1416T-E-OTCT-ND/1963940" H 7550 6450 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MOSFET DVR 1.5A HS SOT23-5" H 7550 6550 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 7550 6650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7550 6750 60  0001 L CNN "Status"
	1    7350 5550
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR1206 R4
U 1 1 5FF9AB2D
P 9850 3700
AR Path="/5FF8CB67/5FF9AB2D" Ref="R4"  Part="1" 
AR Path="/5FFACA99/5FF9AB2D" Ref="R6"  Part="1" 
AR Path="/5FFACD74/5FF9AB2D" Ref="R8"  Part="1" 
AR Path="/5FFAD745/5FF9AB2D" Ref="R10"  Part="1" 
AR Path="/5FFAD749/5FF9AB2D" Ref="R12"  Part="1" 
AR Path="/5FFAD74D/5FF9AB2D" Ref="R14"  Part="1" 
AR Path="/5FFADF9D/5FF9AB2D" Ref="R16"  Part="1" 
AR Path="/5FFADFA1/5FF9AB2D" Ref="R18"  Part="1" 
AR Path="/5FFADFA5/5FF9AB2D" Ref="R20"  Part="1" 
AR Path="/5FFAE3CB/5FF9AB2D" Ref="R22"  Part="1" 
AR Path="/5FFAE3CF/5FF9AB2D" Ref="R24"  Part="1" 
AR Path="/5FFAE3D3/5FF9AB2D" Ref="R26"  Part="1" 
AR Path="/5FFAE9BE/5FF9AB2D" Ref="R28"  Part="1" 
AR Path="/5FFAE9C2/5FF9AB2D" Ref="R30"  Part="1" 
AR Path="/5FFAE9C6/5FF9AB2D" Ref="R?"  Part="1" 
AR Path="/5FF9AB2D" Ref="R30"  Part="1" 
F 0 "R30" V 9755 3768 45  0000 L CNN
F 1 "100k" V 9839 3768 45  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric" H 9850 3850 20  0001 C CNN
F 3 "" H 9850 3700 60  0001 C CNN
F 4 " " V 9934 3768 60  0000 L CNN "Field4"
	1    9850 3700
	0    1    1    0   
$EndComp
Text GLabel 9850 3500 0    50   Input ~ 0
HV
$Comp
L SparkFun-Resistors:RESISTOR1206 R?
U 1 1 5FFC8654
P 10950 2850
AR Path="/5FF8CB67/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFACA99/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFACD74/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAD745/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAD749/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAD74D/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFADF9D/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFADFA1/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFADFA5/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE3CB/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE3CF/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE3D3/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE9BE/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE9C2/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFAE9C6/5FFC8654" Ref="R?"  Part="1" 
AR Path="/5FFC8654" Ref="R?"  Part="1" 
F 0 "R?" V 10855 2918 45  0000 L CNN
F 1 "100k" V 10939 2918 45  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric" H 10950 3000 20  0001 C CNN
F 3 "" H 10950 2850 60  0001 C CNN
F 4 " " V 11034 2918 60  0000 L CNN "Field4"
	1    10950 2850
	0    1    1    0   
$EndComp
Text GLabel 10950 2650 0    50   Input ~ 0
HV
$Comp
L power:GND #PWR?
U 1 1 5FFC91C8
P 10950 3450
F 0 "#PWR?" H 10950 3450 30  0001 C CNN
F 1 "GND" H 10950 3380 30  0001 C CNN
F 2 "" H 10950 3450 50  0001 C CNN
F 3 "" H 10950 3450 50  0001 C CNN
	1    10950 3450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR1206 R?
U 1 1 5FFCA9E2
P 10950 3250
AR Path="/5FF8CB67/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFACA99/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFACD74/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAD745/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAD749/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAD74D/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFADF9D/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFADFA1/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFADFA5/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE3CB/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE3CF/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE3D3/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE9BE/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE9C2/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFAE9C6/5FFCA9E2" Ref="R?"  Part="1" 
AR Path="/5FFCA9E2" Ref="R?"  Part="1" 
F 0 "R?" V 10855 3318 45  0000 L CNN
F 1 "100k" V 10939 3318 45  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric" H 10950 3400 20  0001 C CNN
F 3 "" H 10950 3250 60  0001 C CNN
F 4 " " V 11034 3318 60  0000 L CNN "Field4"
	1    10950 3250
	0    1    1    0   
$EndComp
$Comp
L 0xDBFB7:DS1100Z-500 U?
U 1 1 5FFB8144
P 2750 3050
F 0 "U?" H 2750 3720 50  0000 C CNN
F 1 "DS1100Z-500" H 2750 3629 50  0000 C CNN
F 2 "SOIC127P600X175-8N" H 2750 3050 50  0001 L BNN
F 3 "" H 2750 3050 50  0001 L BNN
	1    2750 3050
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-KIT-EZ-50V-20% C?
U 1 1 5FFBBE06
P 4350 4400
F 0 "C?" H 4458 4492 45  0000 L CNN
F 1 "0.1 uF" H 4458 4408 45  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4350 4650 20  0001 C CNN
F 3 "" H 4350 4400 50  0001 C CNN
F 4 "" H 4458 4366 60  0000 L CNN "Field4"
	1    4350 4400
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 5FFBD5A9
P 4350 4200
F 0 "#SUPPLY?" H 4400 4200 45  0001 L BNN
F 1 "5V" H 4350 4370 45  0000 C CNN
F 2 "" H 4350 4381 60  0000 C CNN
F 3 "" H 4350 4200 60  0001 C CNN
	1    4350 4200
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 5FFBDD0B
P 4050 4700
F 0 "#SUPPLY?" H 4100 4700 45  0001 L BNN
F 1 "5V" V 4050 4800 45  0000 L CNN
F 2 "" H 4050 4881 60  0000 C CNN
F 3 "" H 4050 4700 60  0001 C CNN
	1    4050 4700
	0    1    1    0   
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 5FFBE6E2
P 3450 2650
F 0 "#SUPPLY?" H 3500 2650 45  0001 L BNN
F 1 "5V" V 3450 2778 45  0000 L CNN
F 2 "" H 3450 2831 60  0000 C CNN
F 3 "" H 3450 2650 60  0001 C CNN
	1    3450 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFBF085
P 9850 4200
F 0 "#PWR?" H 9850 4200 30  0001 C CNN
F 1 "GND" H 9850 4130 30  0001 C CNN
F 2 "" H 9850 4200 50  0001 C CNN
F 3 "" H 9850 4200 50  0001 C CNN
	1    9850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFBF4D6
P 7350 5850
F 0 "#PWR?" H 7350 5850 30  0001 C CNN
F 1 "GND" H 7350 5780 30  0001 C CNN
F 2 "" H 7350 5850 50  0001 C CNN
F 3 "" H 7350 5850 50  0001 C CNN
	1    7350 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFBF944
P 1250 5400
F 0 "#PWR?" H 1250 5400 30  0001 C CNN
F 1 "GND" H 1250 5330 30  0001 C CNN
F 2 "" H 1250 5400 50  0001 C CNN
F 3 "" H 1250 5400 50  0001 C CNN
	1    1250 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFC1837
P 3450 3450
F 0 "#PWR?" H 3450 3450 30  0001 C CNN
F 1 "GND" H 3450 3380 30  0001 C CNN
F 2 "" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0001 C CNN
	1    3450 3450
	0    -1   -1   0   
$EndComp
$Comp
L 0xDBFB7:DS1023S-50 U?
U 1 1 5FFB6E3D
P 1250 4700
F 0 "U?" H 2650 5065 50  0000 C CNN
F 1 "DS1023S-50" H 2650 4974 50  0000 C CNN
F 2 "21-0042B_16" H 1250 4700 50  0001 L BNN
F 3 "" H 1250 4700 50  0001 L BNN
F 4 "MAXIM" H 1250 4700 50  0001 L BNN "VENDOR"
F 5 "DS1023S50+" H 1250 4700 50  0001 L BNN "MANUFACTURER_PART_NUMBER"
F 6 "Maxim" H 1250 4700 50  0001 L BNN "MANUFACTURER_NAME"
	1    1250 4700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS84 Q3
U 1 1 5EFA7A24
P 9000 4150
F 0 "Q3" H 9206 4196 50  0000 L CNN
F 1 "BSS84" H 9206 4105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9200 4075 50  0001 L CIN
F 3 "http://assets.nexperia.com/documents/data-sheet/BSS84.pdf" H 9000 4150 50  0001 L CNN
	1    9000 4150
	0    1    -1   0   
$EndComp
$Comp
L SparkFun-PowerSymbols:12V #SUPPLY?
U 1 1 5FFEFCE5
P 7350 5150
F 0 "#SUPPLY?" H 7400 5150 45  0001 L BNN
F 1 "12V" H 7350 5320 45  0000 C CNN
F 2 "" H 7350 5331 60  0000 C CNN
F 3 "" H 7350 5150 60  0001 C CNN
	1    7350 5150
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-KIT-EZ-50V-20% C?
U 1 1 5FFF0741
P 6000 5750
F 0 "C?" H 6108 5842 45  0000 L CNN
F 1 "0.1 uF" H 6108 5758 45  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6000 6000 20  0001 C CNN
F 3 "" H 6000 5750 50  0001 C CNN
F 4 "" H 6108 5716 60  0000 L CNN "Field4"
	1    6000 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFF0773
P 6000 5850
F 0 "#PWR?" H 6000 5850 30  0001 C CNN
F 1 "GND" H 6000 5780 30  0001 C CNN
F 2 "" H 6000 5850 50  0001 C CNN
F 3 "" H 6000 5850 50  0001 C CNN
	1    6000 5850
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:12V #SUPPLY?
U 1 1 5FFF0AF7
P 6000 5550
F 0 "#SUPPLY?" H 6050 5550 45  0001 L BNN
F 1 "12V" H 6000 5720 45  0000 C CNN
F 2 "" H 6000 5731 60  0000 C CNN
F 3 "" H 6000 5550 60  0001 C CNN
	1    6000 5550
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-KIT-EZ-50V-20% C?
U 1 1 5FFF11E3
P 8250 4250
F 0 "C?" H 8358 4342 45  0000 L CNN
F 1 "0.1 uF" H 8358 4258 45  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8250 4500 20  0001 C CNN
F 3 "" H 8250 4250 50  0001 C CNN
F 4 "" H 8358 4216 60  0000 L CNN "Field4"
	1    8250 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFF7975
P 8250 4350
F 0 "#PWR?" H 8250 4350 30  0001 C CNN
F 1 "GND" H 8250 4280 30  0001 C CNN
F 2 "" H 8250 4350 50  0001 C CNN
F 3 "" H 8250 4350 50  0001 C CNN
	1    8250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5450 8100 5450
Wire Wire Line
	8250 4050 8450 4050
Text GLabel 8250 3800 0    50   Input ~ 0
VSWEEP_SLOPE
Wire Wire Line
	8250 4050 8250 3800
Connection ~ 8250 4050
Text Notes 6900 3050 0    50   ~ 0
ramp generator based on Baker and Johnson
$Comp
L power:GND #PWR?
U 1 1 5FFFAEA0
P 4350 4500
F 0 "#PWR?" H 4350 4500 30  0001 C CNN
F 1 "GND" H 4350 4430 30  0001 C CNN
F 2 "" H 4350 4500 50  0001 C CNN
F 3 "" H 4350 4500 50  0001 C CNN
	1    4350 4500
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-KIT-EZ-50V-20% C?
U 1 1 5FFFCD0C
P 4350 3150
F 0 "C?" H 4458 3242 45  0000 L CNN
F 1 "0.1 uF" H 4458 3158 45  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4350 3400 20  0001 C CNN
F 3 "" H 4350 3150 50  0001 C CNN
F 4 "" H 4458 3116 60  0000 L CNN "Field4"
	1    4350 3150
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 5FFFCD12
P 4350 2950
F 0 "#SUPPLY?" H 4400 2950 45  0001 L BNN
F 1 "5V" H 4350 3120 45  0000 C CNN
F 2 "" H 4350 3131 60  0000 C CNN
F 3 "" H 4350 2950 60  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFFCD18
P 4350 3250
F 0 "#PWR?" H 4350 3250 30  0001 C CNN
F 1 "GND" H 4350 3180 30  0001 C CNN
F 2 "" H 4350 3250 50  0001 C CNN
F 3 "" H 4350 3250 50  0001 C CNN
	1    4350 3250
	1    0    0    -1  
$EndComp
Text GLabel 2050 3150 0    50   Input ~ 0
PULSE_TRIGGER
Text GLabel 2050 2850 0    50   Input ~ 0
TRIG
Text GLabel 1250 4700 0    50   Input ~ 0
TRIG
Text GLabel 4050 4800 2    50   Input ~ 0
SWEEP_TRIGGER
$Comp
L w_connectors:HEADER_3 J?
U 1 1 5FFFE35A
P 1150 3850
F 0 "J?" H 1142 3407 60  0000 C CNN
F 1 "TEENSY" H 1142 3513 60  0000 C CNN
F 2 "Connectors2:1X03_SMD_RA_MALE" H 1142 3619 60  0000 C CNN
F 3 "" H 1150 3850 60  0000 C CNN
	1    1150 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 600011FD
P 8100 5850
F 0 "D?" V 8054 5929 50  0000 L CNN
F 1 "D_TVS" V 8145 5929 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 8100 5850 50  0001 C CNN
F 3 "~" H 8100 5850 50  0001 C CNN
	1    8100 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 5700 8100 5450
Connection ~ 8100 5450
$Comp
L power:GND #PWR?
U 1 1 60002A5E
P 8100 6000
F 0 "#PWR?" H 8100 6000 30  0001 C CNN
F 1 "GND" H 8100 5930 30  0001 C CNN
F 2 "" H 8100 6000 50  0001 C CNN
F 3 "" H 8100 6000 50  0001 C CNN
	1    8100 6000
	1    0    0    -1  
$EndComp
Text GLabel 6950 5450 0    50   Input ~ 0
SWEEP_TRIGGER
$Comp
L w_connectors:HEADER_2 J?
U 1 1 60006461
P 10300 5050
F 0 "J?" H 10428 5103 60  0000 L CNN
F 1 "TESTPOINT" H 10428 4997 60  0000 L CNN
F 2 "" H 10300 5050 60  0000 C CNN
F 3 "" H 10300 5050 60  0000 C CNN
	1    10300 5050
	1    0    0    -1  
$EndComp
$Comp
L w_connectors:HEADER_3 J?
U 1 1 6000BAFF
P 9200 2600
F 0 "J?" H 9192 2157 60  0000 C CNN
F 1 "DEFLECTION" H 9192 2263 60  0000 C CNN
F 2 "Connectors2:1X03_SMD_RA_MALE" H 9192 2369 60  0000 C CNN
F 3 "" H 9200 2600 60  0000 C CNN
	1    9200 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 4050 9650 4050
Text GLabel 9850 3900 2    50   Input ~ 0
SWEEP
Text GLabel 10200 5000 0    50   Input ~ 0
SWEEP
Text GLabel 10200 5100 0    50   Input ~ 0
SWEEP
Text GLabel 10950 3050 0    50   Input ~ 0
HV_CENTER
Text GLabel 9300 2600 2    50   Input ~ 0
HV_CENTER
Text GLabel 9300 2700 2    50   Input ~ 0
HV_CENTER
Text GLabel 9300 2500 2    50   Input ~ 0
SWEEP
$Comp
L Device:D_TVS D?
U 1 1 600141F5
P 8450 3900
F 0 "D?" V 8404 3979 50  0000 L CNN
F 1 "D_TVS" V 8495 3979 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 8450 3900 50  0001 C CNN
F 3 "~" H 8450 3900 50  0001 C CNN
	1    8450 3900
	0    1    1    0   
$EndComp
Connection ~ 8450 4050
$Comp
L power:GND #PWR?
U 1 1 6001604D
P 8450 3750
F 0 "#PWR?" H 8450 3750 30  0001 C CNN
F 1 "GND" H 8450 3680 30  0001 C CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "" H 8450 3750 50  0001 C CNN
	1    8450 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 5450 9000 4350
Wire Wire Line
	8100 5450 9000 5450
Text Notes 8900 5300 0    50   ~ 0
coax
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 60037439
P 1250 3750
F 0 "#SUPPLY?" H 1300 3750 45  0001 L BNN
F 1 "5V" H 1250 3920 45  0000 C CNN
F 2 "" H 1250 3931 60  0000 C CNN
F 3 "" H 1250 3750 60  0001 C CNN
	1    1250 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 600384B8
P 1250 3950
F 0 "#PWR?" H 1250 3950 30  0001 C CNN
F 1 "GND" H 1250 3880 30  0001 C CNN
F 2 "" H 1250 3950 50  0001 C CNN
F 3 "" H 1250 3950 50  0001 C CNN
	1    1250 3950
	0    -1   -1   0   
$EndComp
Text GLabel 1250 3850 2    50   Input ~ 0
TRIG
$Comp
L power:GND #PWR?
U 1 1 6003C62B
P 4050 4900
F 0 "#PWR?" H 4050 4900 30  0001 C CNN
F 1 "GND" H 4050 4830 30  0001 C CNN
F 2 "" H 4050 4900 50  0001 C CNN
F 3 "" H 4050 4900 50  0001 C CNN
	1    4050 4900
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-Capacitors:0.1UF-KIT-EZ-50V-20% C?
U 1 1 6003E7B8
P 10050 3500
F 0 "C?" H 10158 3592 45  0000 L CNN
F 1 "50 pF" H 10158 3508 45  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10050 3750 20  0001 C CNN
F 3 "" H 10050 3500 50  0001 C CNN
F 4 "" H 10158 3466 60  0000 L CNN "Field4"
	1    10050 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6003F9D1
P 10150 3500
F 0 "#PWR?" H 10150 3500 30  0001 C CNN
F 1 "GND" H 10150 3430 30  0001 C CNN
F 2 "" H 10150 3500 50  0001 C CNN
F 3 "" H 10150 3500 50  0001 C CNN
	1    10150 3500
	0    -1   -1   0   
$EndComp
Text GLabel 1500 6750 2    50   Input ~ 0
P0
Text GLabel 1500 6650 2    50   Input ~ 0
P1
Text GLabel 1500 6550 2    50   Input ~ 0
P2
Text GLabel 1500 6450 2    50   Input ~ 0
P3
Text GLabel 1500 6350 2    50   Input ~ 0
P4
Text GLabel 1500 6250 2    50   Input ~ 0
P5
Text GLabel 1500 6150 2    50   Input ~ 0
P6
$Comp
L SparkFun-Connectors:CONN_08SMD-MALE J?
U 1 1 6003D3B0
P 1400 6750
F 0 "J?" H 1358 7760 45  0000 C CNN
F 1 "CONN_08SMD-MALE" H 1358 7676 45  0000 C CNN
F 2 "1X08_SMD_MALE" H 1400 7650 20  0001 C CNN
F 3 "" H 1400 6750 50  0001 C CNN
F 4 "" H 1358 7581 60  0000 C CNN "Field4"
	1    1400 6750
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-PowerSymbols:5V #SUPPLY?
U 1 1 60042E1E
P 1250 4800
F 0 "#SUPPLY?" H 1300 4800 45  0001 L BNN
F 1 "5V" V 1250 4900 45  0000 L CNN
F 2 "" H 1250 4981 60  0000 C CNN
F 3 "" H 1250 4800 60  0001 C CNN
	1    1250 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 4050 8800 4050
$EndSCHEMATC
