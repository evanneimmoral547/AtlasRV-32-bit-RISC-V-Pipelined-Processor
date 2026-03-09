## ============================================================
##  constraints.xdc  –  Xilinx Artix-7 (Basys3 / Nexys A7)
##  32-bit RISC-V Pipelined Processor
## ============================================================

## Clock signal – 100 MHz
set_property PACKAGE_PIN W5     [get_ports clk_100mhz]
set_property IOSTANDARD  LVCMOS33 [get_ports clk_100mhz]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100mhz]

## Reset – Centre button (btnC)
set_property PACKAGE_PIN U18    [get_ports btnC]
set_property IOSTANDARD  LVCMOS33 [get_ports btnC]

## LEDs [15:0]
set_property PACKAGE_PIN U16    [get_ports {led[0]}]
set_property PACKAGE_PIN E19    [get_ports {led[1]}]
set_property PACKAGE_PIN U19    [get_ports {led[2]}]
set_property PACKAGE_PIN V19    [get_ports {led[3]}]
set_property PACKAGE_PIN W18    [get_ports {led[4]}]
set_property PACKAGE_PIN U15    [get_ports {led[5]}]
set_property PACKAGE_PIN U14    [get_ports {led[6]}]
set_property PACKAGE_PIN V14    [get_ports {led[7]}]
set_property PACKAGE_PIN V13    [get_ports {led[8]}]
set_property PACKAGE_PIN V3     [get_ports {led[9]}]
set_property PACKAGE_PIN W3     [get_ports {led[10]}]
set_property PACKAGE_PIN U3     [get_ports {led[11]}]
set_property PACKAGE_PIN P3     [get_ports {led[12]}]
set_property PACKAGE_PIN N3     [get_ports {led[13]}]
set_property PACKAGE_PIN P1     [get_ports {led[14]}]
set_property PACKAGE_PIN L1     [get_ports {led[15]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {led[*]}]

## Timing constraints
## CPU clock is divided by 4 → 25 MHz
create_generated_clock -name cpu_clk \
    -source [get_ports clk_100mhz] \
    -divide_by 4 \
    [get_pins top/clk_div_reg[1]/Q]

## False paths on async reset
set_false_path -from [get_ports btnC]
