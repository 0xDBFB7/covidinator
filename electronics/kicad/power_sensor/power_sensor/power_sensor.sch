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
L power:GND #PWR?
U 1 1 5F014890
P 5300 1750
F 0 "#PWR?" H 5300 1750 30  0001 C CNN
F 1 "GND" H 5300 1680 30  0001 C CNN
F 2 "" H 5300 1750 50  0001 C CNN
F 3 "" H 5300 1750 50  0001 C CNN
	1    5300 1750
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C?
U 1 1 5F01536C
P 6100 1950
F 0 "C?" H 6208 2042 45  0000 L CNN
F 1 "1 nF" H 6208 1958 45  0000 L CNN
F 2 "0402" H 6100 2200 20  0001 C CNN
F 3 "" H 6100 1950 50  0001 C CNN
F 4 "" H 6208 1916 60  0000 L CNN "Field4"
	1    6100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F016B90
P 6100 2050
F 0 "#PWR?" H 6100 2050 30  0001 C CNN
F 1 "GND" H 6100 1980 30  0001 C CNN
F 2 "" H 6100 2050 50  0001 C CNN
F 3 "" H 6100 2050 50  0001 C CNN
	1    6100 2050
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P4
U 1 1 5EBA8EF1
P 5600 2950
F 0 "P4" H 5533 2853 40  0000 C CNN
F 1 "a" H 5550 2990 30  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5600 2950 50  0001 C CNN
F 3 "" H 5600 2950 50  0001 C CNN
	1    5600 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 1750 5900 1750
Connection ~ 6100 1750
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5F0217ED
P 6550 1950
F 0 "R?" V 6455 2018 45  0000 L CNN
F 1 "10k" V 6539 2018 45  0000 L CNN
F 2 "0402" H 6550 2100 20  0001 C CNN
F 3 "" H 6550 1950 60  0001 C CNN
F 4 " " V 6634 2018 60  0000 L CNN "Field4"
	1    6550 1950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F021FD0
P 6550 2150
F 0 "#PWR?" H 6550 2150 30  0001 C CNN
F 1 "GND" H 6550 2080 30  0001 C CNN
F 2 "" H 6550 2150 50  0001 C CNN
F 3 "" H 6550 2150 50  0001 C CNN
	1    6550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1750 6550 1750
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C?
U 1 1 5F022E92
P 5600 2700
F 0 "C?" V 5366 2750 45  0000 C CNN
F 1 "100 pF" V 5450 2750 45  0000 C CNN
F 2 "0402" H 5600 2950 20  0001 C CNN
F 3 "" H 5600 2700 50  0001 C CNN
F 4 "" H 5708 2666 60  0000 L CNN "Field4"
	1    5600 2700
	1    0    0    -1  
$EndComp
Text Notes 750  7450 0    50   ~ 0
"since the detector does not conserve phase information, all phasors that appear as factors can be replaced by their magnitudes." - *happiness noise*
Text Notes 750  7200 0    50   ~ 0
RF diode detector based on infineon appnote AN_1807.
$Comp
L SparkFun-Resistors:0.3OHM-0805-1_8W-1% R?
U 1 1 5F028E3F
P 5400 2500
F 0 "R?" H 5400 2694 45  0000 C CNN
F 1 "50" H 5400 2610 45  0000 C CNN
F 2 "0805" H 5400 2650 20  0001 C CNN
F 3 "" H 5400 2500 60  0001 C CNN
F 4 "" H 5400 2621 60  0000 C CNN "Field4"
	1    5400 2500
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAS40-04 D?
U 1 1 5F013846
P 5600 1850
F 0 "D?" H 5600 2175 50  0000 C CNN
F 1 "BAT15-04" H 5600 2084 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5350 2150 50  0001 L CNN
F 3 "http://www.vishay.com/docs/85701/bas40v.pdf" H 5480 1950 50  0001 C CNN
	1    5600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0342F0
P 5200 2500
F 0 "#PWR?" H 5200 2500 30  0001 C CNN
F 1 "GND" H 5200 2430 30  0001 C CNN
F 2 "" H 5200 2500 50  0001 C CNN
F 3 "" H 5200 2500 50  0001 C CNN
	1    5200 2500
	0    1    1    0   
$EndComp
$EndSCHEMATC
