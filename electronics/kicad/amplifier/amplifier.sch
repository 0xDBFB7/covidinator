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
Wire Wire Line
	4050 2700 4500 2700
Connection ~ 4050 2700
Wire Wire Line
	4050 3100 4150 3100
$Comp
L Connector:Test_Point TPOP1
U 1 1 5EE35A86
P 5200 2700
F 0 "TPOP1" V 5395 2772 50  0000 C CNN
F 1 "Voutput" V 5304 2772 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5400 2700 50  0001 C CNN
F 3 "~" H 5400 2700 50  0001 C CNN
F 4 "R" H 5200 2700 50  0001 C CNN "Spice_Primitive"
F 5 "100M" H 5200 2700 50  0001 C CNN "Spice_Model"
F 6 "N" H 5200 2700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    5200 2700
	0    1    1    0   
$EndComp
$Comp
L SparkFun-Capacitors:6PF-0402-50V-0.5% C4
U 1 1 5EE408DC
P 4700 2700
F 0 "C4" V 4466 2750 45  0000 C CNN
F 1 "10 pF" V 4550 2750 45  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4700 2950 20  0001 C CNN
F 3 "" H 4700 2700 50  0001 C CNN
F 4 "" H 4808 2666 60  0000 L CNN "Field4"
F 5 "X" H 4700 2700 50  0001 C CNN "Spice_Primitive"
F 6 "10pf0402" H 4700 2700 50  0001 C CNN "Spice_Model"
F 7 "Y" H 4700 2700 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "/home/arthurdent/Projects/covidinator/electronics/models/10pf0402.lib" H 4700 2700 50  0001 C CNN "Spice_Lib_File"
	1    4700 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 2700 4800 2700
Connection ~ 4050 1900
$Comp
L power:GND #PWR0106
U 1 1 5EE45343
P 3300 1900
F 0 "#PWR0106" H 3300 1900 30  0001 C CNN
F 1 "GND" H 3300 1830 30  0001 C CNN
F 2 "" H 3300 1900 50  0001 C CNN
F 3 "" H 3300 1900 50  0001 C CNN
	1    3300 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 1900 4050 1900
$Comp
L SparkFun-Capacitors:4.7UF0603 C3
U 1 1 5EE4533B
P 3500 1900
F 0 "C3" V 3266 1950 45  0000 C CNN
F 1 "100 nF" V 3350 1950 45  0000 C CNN
F 2 "0603" H 3500 2150 20  0001 C CNN
F 3 "" H 3500 1900 50  0001 C CNN
F 4 "" H 3608 1866 60  0000 L CNN "Field4"
	1    3500 1900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Test_Point TPSO1
U 1 1 5EE45334
P 4050 1900
F 0 "TPSO1" H 4108 2018 50  0000 L CNN
F 1 "Vsource" H 4108 1927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4250 1900 50  0001 C CNN
F 3 "~" H 4250 1900 50  0001 C CNN
F 4 "V" H 4050 1900 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20p 5p 1p 1 1)" H 4050 1900 50  0001 C CNN "Spice_Model"
F 6 "N" H 4050 1900 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4050 1900
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L2
U 1 1 5EE08A1B
P 4050 2100
F 0 "L2" H 4103 2142 45  0000 L CNN
F 1 "220 nH" H 4103 2058 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4050 2350 20  0001 C CNN
F 3 "" H 4050 2100 50  0001 C CNN
F 4 "" H 4102 2016 60  0000 L CNN "Field4"
	1    4050 2100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Coils:INDUCTOR-0402-3.9NH L3
U 1 1 5EE07869
P 4050 2500
F 0 "L3" H 4103 2542 45  0000 L CNN
F 1 "220 nH" H 4103 2458 45  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4050 2750 20  0001 C CNN
F 3 "" H 4050 2500 50  0001 C CNN
F 4 "" H 4102 2416 60  0000 L CNN "Field4"
	1    4050 2500
	1    0    0    -1  
$EndComp
Text GLabel 4050 1900 2    50   Input ~ 0
nsource
$Comp
L power:GND #PWR0101
U 1 1 5EF81D29
P 4050 3100
F 0 "#PWR0101" H 4050 3100 30  0001 C CNN
F 1 "GND" H 4050 3030 30  0001 C CNN
F 2 "" H 4050 3100 50  0001 C CNN
F 3 "" H 4050 3100 50  0001 C CNN
	1    4050 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2900 3400 2900
$Comp
L 0xDBFB7:BFP620 U1
U 1 1 5EF9F4AC
P 3900 2350
F 0 "U1" H 4194 1846 50  0000 L CNN
F 1 "BFP620" H 4194 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 3900 2350 50  0001 C CNN
F 3 "" H 3900 2350 50  0001 C CNN
F 4 "X" H 3900 2350 50  0001 C CNN "Spice_Primitive"
F 5 "BFP620" H 3900 2350 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3900 2350 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/arthurdent/Projects/covidinator/electronics/models/BFP620.lib" H 3900 2350 50  0001 C CNN "Spice_Lib_File"
F 8 "3 1 2 4" H 3900 2350 50  0001 C CNN "Spice_Node_Sequence"
	1    3900 2350
	1    0    0    -1  
$EndComp
Connection ~ 4050 3100
$Comp
L SparkFun-Resistors:RESISTOR0402 R1
U 1 1 5F960EE5
P 3400 3100
F 0 "R1" V 3305 3168 45  0000 L CNN
F 1 "10k" V 3389 3168 45  0000 L CNN
F 2 "0402" H 3400 3250 20  0001 C CNN
F 3 "" H 3400 3100 60  0001 C CNN
F 4 " " V 3484 3168 60  0000 L CNN "Field4"
	1    3400 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2900 3400 2900
Connection ~ 3400 2900
$Comp
L Connector:Test_Point TPSO2
U 1 1 5F964277
P 3400 3500
F 0 "TPSO2" H 3458 3618 50  0000 L CNN
F 1 "Vsource" H 3458 3527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3600 3500 50  0001 C CNN
F 3 "~" H 3600 3500 50  0001 C CNN
F 4 "V" H 3400 3500 50  0001 C CNN "Spice_Primitive"
F 5 "pulse(0 2 20p 5p 1p 1 1)" H 3400 3500 50  0001 C CNN "Spice_Model"
F 6 "N" H 3400 3500 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3400 3500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F96B8DD
P 2750 3100
F 0 "#PWR0102" H 2750 3100 30  0001 C CNN
F 1 "GND" H 2750 3030 30  0001 C CNN
F 2 "" H 2750 3100 50  0001 C CNN
F 3 "" H 2750 3100 50  0001 C CNN
	1    2750 3100
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Capacitors:4.7UF0603 C1
U 1 1 5F96C23F
P 3650 3400
F 0 "C1" V 3416 3450 45  0000 C CNN
F 1 "100 nF" V 3500 3450 45  0000 C CNN
F 2 "0603" H 3650 3650 20  0001 C CNN
F 3 "" H 3650 3400 50  0001 C CNN
F 4 "" H 3758 3366 60  0000 L CNN "Field4"
	1    3650 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5F96EBEA
P 3750 3400
F 0 "#PWR0103" H 3750 3400 30  0001 C CNN
F 1 "GND" H 3750 3330 30  0001 C CNN
F 2 "" H 3750 3400 50  0001 C CNN
F 3 "" H 3750 3400 50  0001 C CNN
	1    3750 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 3300 3400 3400
Wire Wire Line
	3400 3400 3450 3400
Connection ~ 3400 3400
Wire Wire Line
	3400 3400 3400 3500
$Comp
L dk_Coaxial-Connectors-RF:CONSMA001-SMD-G J1
U 1 1 5F97581C
P 2750 2900
F 0 "J1" H 2828 3147 60  0000 C CNN
F 1 "CONSMA001-SMD-G" H 2828 3041 60  0000 C CNN
F 2 "digikey-footprints:RF_SMA_Receptical_Vertical_CONSMA001-SMD-G" H 2950 3100 60  0001 L CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/consma001-smd-g.pdf" H 2950 3200 60  0001 L CNN
F 4 "CONSMA001-SMD-G-ND" H 2950 3300 60  0001 L CNN "Digi-Key_PN"
F 5 "CONSMA001-SMD-G" H 2950 3400 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2950 3500 60  0001 L CNN "Category"
F 7 "Coaxial Connectors (RF)" H 2950 3600 60  0001 L CNN "Family"
F 8 "https://linxtechnologies.com/wp/wp-content/uploads/consma001-smd-g.pdf" H 2950 3700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/linx-technologies-inc/CONSMA001-SMD-G/CONSMA001-SMD-G-ND/4496569" H 2950 3800 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN SMA RCPT STR 50 OHM SMD" H 2950 3900 60  0001 L CNN "Description"
F 11 "Linx Technologies Inc." H 2950 4000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2950 4100 60  0001 L CNN "Status"
	1    2750 2900
	1    0    0    -1  
$EndComp
Text Notes 1100 4350 0    50   ~ 0
The small gap between the board and this SMD connector is\na bit concerning; some sort of resonance could probably be set up\nin there.
$Comp
L 0xDBFB7:CE3520K3 U2
U 1 1 5F97ADF9
P 6100 3400
F 0 "U2" H 6244 3446 50  0000 L CNN
F 1 "CE3520K3" H 6244 3355 50  0000 L CNN
F 2 "0xDBFB7:4-Micro-X" H 6100 3400 50  0001 C CNN
F 3 "" H 6100 3400 50  0001 C CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
