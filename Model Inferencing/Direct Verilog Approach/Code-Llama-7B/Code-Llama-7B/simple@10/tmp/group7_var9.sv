module AndOr (output X, Y, input [1:0] A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Original ModelSim command line:
vlib vlib_work
vmap work vlib_work
vlog "D:/Documents/GitHub/FPGA-Practice-2021/Digital-Logic-Lab/src/Verilog/AndOr.v"
vsim -novopt work.AndOr
add wave -radix hex /AndOr/*
run -all
### Original ModelSim Console Output:
Error: [Common 17-155] file does not exist: "D:\Documents\GitHub\FPGA-Practice-2021\Digital-Logic-Lab\src\Verilog\AndOr.v"