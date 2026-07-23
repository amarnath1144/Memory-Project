vlog list.svh
vopt tb +cover=fcbest -o 1WR
vsim -coverage 1WR +test_name=1WR
coverage save -onexit 1WR.ucdb
add wave -r sim:/tb/pif/*
run -all
