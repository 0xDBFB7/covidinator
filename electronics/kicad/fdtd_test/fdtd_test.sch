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
L SparkFun-Capacitors:6PF-0402-50V-0.5% C?
U 1 1 5ED41179
P 3850 3950
F 0 "C?" H 3958 4095 45  0000 L CNN
F 1 "c1" H 3958 4011 45  0000 L CNN
F 2 "0402" H 3850 4200 20  0001 C CNN
F 3 "" H 3850 3950 50  0001 C CNN
F 4 "C" H 3958 3916 60  0000 L CNN "Field4"
	1    3850 3950
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Resistors:RESISTOR0402 R?
U 1 1 5ED4190A
P 3650 3750
F 0 "R?" H 3650 4050 45  0000 C CNN
F 1 "R " H 3650 3966 45  0000 C CNN
F 2 "0402" H 3650 3900 20  0001 C CNN
F 3 "" H 3650 3750 60  0001 C CNN
F 4 " " H 3650 3871 60  0000 C CNN "Field4"
	1    3650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED44D0E
P 3850 4050
F 0 "#PWR?" H 3850 4050 30  0001 C CNN
F 1 "GND" H 3850 3980 30  0001 C CNN
F 2 "" H 3850 4050 50  0001 C CNN
F 3 "" H 3850 4050 50  0001 C CNN
	1    3850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3750 4150 3750
Connection ~ 3850 3750
$EndSCHEMATC
