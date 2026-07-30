vlog list.svh
vopt tb +cover=fcbest -o NWR_NRD
vsim -coverage NWR_NRD +test_name=NWR_NRD
coverage save -onexit NWR_NRD.ucdb
add wave -r sim:/tb/pif/*
run -all
