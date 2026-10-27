set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

## Switches (Inputs: sw1 - sw9)
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports { sw1 }];
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports { sw2 }];
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports { sw3 }];
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports { sw4 }];
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports { sw5 }];
set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports { sw6 }];
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports { sw7 }];
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports { sw8 }];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports { sw9 }];

## LEDs (Outputs: a - d mapped to LD0 - LD3)
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports { a }];
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports { b }];
set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports { c }];
set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS33 } [get_ports { d }];