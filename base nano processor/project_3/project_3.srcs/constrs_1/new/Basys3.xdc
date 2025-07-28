
##Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDs[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDs[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDs[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDs[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[3]}]


set_property PACKAGE_PIN P1 [get_ports {zero_led}]
	set_property IOSTANDARD LVCMOS33 [get_ports {zero_led}]
set_property PACKAGE_PIN L1 [get_ports {overflow_led}]
	set_property IOSTANDARD LVCMOS33 [get_ports {overflow_led}]


##7 segment display
set_property PACKAGE_PIN W7 [get_ports {seven_seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seven_seg[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seven_seg[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seven_seg[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven_seg[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seven_seg[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seven_seg[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[6]}]


set_property PACKAGE_PIN U2 [get_ports {an[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]
	set_property IOSTANDARD LVCMOS33 [get_ports reset]








