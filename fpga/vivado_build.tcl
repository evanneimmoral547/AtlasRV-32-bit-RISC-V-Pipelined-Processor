# ============================================================
#  vivado_build.tcl  –  Non-project Vivado synthesis + impl
#  Run: vivado -mode batch -source fpga/vivado_build.tcl
# ============================================================

set project_name "riscv_pipelined"
set part         "xc7a35tcpg236-1"   ;# Basys3 Artix-7
set output_dir   "./fpga/output"

file mkdir $output_dir

# -------------------------------------------------------
#  Read sources
# -------------------------------------------------------
read_verilog -sv [glob ./rtl/*.sv]
read_verilog -sv [glob ./rtl/pipeline/*.sv]
read_verilog -sv [glob ./rtl/hazard/*.sv]
read_xdc            ./fpga/constraints.xdc

# -------------------------------------------------------
#  Synthesis
# -------------------------------------------------------
synth_design \
    -top        top \
    -part       $part \
    -flatten_hierarchy rebuilt

write_checkpoint  $output_dir/post_synth.dcp  -force
report_timing_summary -file $output_dir/post_synth_timing.rpt
report_utilization    -file $output_dir/post_synth_util.rpt

# -------------------------------------------------------
#  Implementation
# -------------------------------------------------------
opt_design
place_design
route_design

write_checkpoint  $output_dir/post_route.dcp  -force
report_timing_summary -file $output_dir/post_route_timing.rpt
report_utilization    -file $output_dir/post_route_util.rpt
report_power          -file $output_dir/power.rpt

# -------------------------------------------------------
#  Bitstream
# -------------------------------------------------------
write_bitstream   $output_dir/${project_name}.bit -force

puts "Build complete: $output_dir/${project_name}.bit"
