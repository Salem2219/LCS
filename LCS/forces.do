add wave -position end  sim:/test/clk
add wave -position end  sim:/test/rst
add wave -position end  sim:/test/start
add wave -position end  sim:/test/m
add wave -position end  sim:/test/n
force -freeze sim:/test/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/test/rst 1 0
force -freeze sim:/test/rst 0 100
force -freeze sim:/test/start 0 0
force -freeze sim:/test/m 111 0
force -freeze sim:/test/n 111 0
add wave -position end  sim:/test/u1/control/current_state
add wave -position end  sim:/test/u1/datapath/i
add wave -position end  sim:/test/u1/datapath/j
add wave -position end  sim:/test/u1/datapath/temp1
add wave -position end  sim:/test/u1/datapath/temp2
add wave -position end  sim:/test/u1/datapath/temp3
add wave -position end  sim:/test/u4/program
