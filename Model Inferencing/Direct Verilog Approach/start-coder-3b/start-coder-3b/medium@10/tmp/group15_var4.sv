`module Test_multiplier (output reg [7:0] multiplier_test);
input [7:0] multiplier_data;

multiplier u_multiplier (multiplier_data, multiplier_out);
assign multiplier_test = multiplier_result;
endmodule`

`module Test_multiplier (output reg [7:0] multiplier_test);
input [7:0] multiplier_data;

reg [7:0] multiplier_result;
multiplier u_multiplier (multiplier_data, multiplier_result);
assign multiplier_test = multiplier_result;
endmodule`

### Results:
`module Test_multiplier (output reg [7:0] multiplier_test);
input [7:0] multiplier_data;

reg [7:0] multiplier_result;
multiplier u_multiplier (multiplier_data, multiplier_result);
assign multiplier_test = multiplier_result;
endmodule`

### Timed Simulation:
https://www.dropbox.com/s/z12t1u4u31545k1/test%20case%201.vcd?dl=0
### Gate Level Simulation:
![Alt text](/media/image5.png?raw=true "Gate Level Simulation")

## VHDL Code
https://github.com/h0011100/vhdl-testbenches/blob/master/test_bench_multiplier/test_bench_multiplier.vhd

## Result of Simulation:
![Alt text](/media/image8.png?raw=true "Result of Simulation")
/README.md
# VHDL-Testbenches
This repository includes a description of VHDL testbenches, their verification steps and simulation results.

## Test benches
1. Test bench of ALU
2. Test bench of multiplier
3. Test bench in a Verilog implementation of a multiplier circuit.

## Verilog
1. Verilog code for a Verilog implementation of a ALU circuit.
2. Verilog code for a Verilog implementation of a multiplier circuit.
3. Verilog code for a Verilog implementation of a multiplier circuit (in a procedural assignment inside an always_comb block).
4. Verilog code for a Verilog implementation of a multiplier circuit (in a procedural assignment inside an always_comb block with part-select array operand).

## VHDL
1. VHDL code