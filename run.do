if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs="+acc" top +UVM_TESTNAME=switch_test +UVM_VERBOSITY=UVM_MEDIUM
add wave /top/sw_if/clk
add wave /top/sw_if/rstn
add wave /top/sw_if/vld
add wave /top/sw_if/addr
add wave /top/sw_if/data
add wave /top/sw_if/addr_a
add wave /top/sw_if/data_a
add wave /top/sw_if/addr_b
add wave /top/sw_if/data_b
run -all