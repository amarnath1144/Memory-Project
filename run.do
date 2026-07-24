vlib work
vlog list.svh
vsim -novopt -suppress 12110 tb +test_name=5WR_5RD
add wave -r sim:/tb/pif/*
run -all
