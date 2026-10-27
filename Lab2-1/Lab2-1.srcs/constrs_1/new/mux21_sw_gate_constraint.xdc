## Inputs
## SW0 -> Input A
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { a }];

## SW1 -> Input B
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { b }];

## SW2 -> Select Signal S (Control)
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { s }];

## Output
## LD0 -> Output
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { out }];