module Prob_8_D_Flip_Flop_modified (out, D_out, D_in, clk, rst);
// Combinational circuit
wire D_out;
reg out, D_out_temp;
// D flip-flop
assign out = D_out;
always_comb begin
if (~D_out) D_out_temp = 1;
else D_out_temp = D_in;
end
always @ (posedge clk, negedge rst) begin
if (rst) D_out_temp = 1;
D_out <= D_out_temp;
end
endmodule
### Verilog Synthesis:
![Image description](https://github.com/Sagar-Mukherjee/Verilog-Code/blob/main/Image_0/Prob_8_D_Flip_Flop.png)
### Testbench for Verilog Code:
    module Testbench;
    // Inputs
    reg D_in;
    // Outputs
    wire D_out;
    // Inputs and Outputs
    reg [31: 0] in_data;
    // Inputs and Outputs
    integer in_data_int;
    // Clock
    reg clk;
    // Reset
    reg rst;
    // Testbench
    initial begin
    $dumpfile("Prob_8_D_Flip_Flop.vcd");
    $dumpvars(0, Testbench);
    // Inputs
    D_in = 0;
    // Outputs
    D_out = 0;
    // Inputs and Outputs
    in_data = 0;
    // Clock
    clk = 0;
    // Reset
    rst = 1'b1;
    for (integer i = 0; i < 32; i = i + 1) begin
    in_data = i;
    in_data_int = i;
    D_in <= in_data_int;
    D_out = in_data_int;
    #1
    clk =!clk;
    #1
    end
    end
    #1
    rst = 0;
    #50
    $finish;
    endmodule
### Testbench Simulation:
![Image description](https://github.com/Sagar-Mukherjee/Verilog-Code/blob/main/Image_0/Prob_8_D_Flip_Flop_modified.png)
### Result:
![Image description](https://github.com/Sagar-Mukherjee/Verilog-Code/blob/main/Image_0/Prob_8_D_Flip_Flop_modified.png)
## Problem 9.
Design a D flip-flop with a delay of 2 clocks.
### Base Verilog Code:
module Prob_9_D_Flip_Flop_with_2_Delay (out, D_out, D_in, clk, rst);
// D flip-flop with 2 delay
wire D_out;
reg out, D_out_temp;
// D flip-flop
assign out = D_out;
always @ (posedge clk, negedge rst) begin
if (rst) D_out_temp = 1;
else if (~D_out) D_out_temp = 1;
else D_out_temp = D_in;
end
always @ (D_out_temp) D_out <= D_out_temp;
endmodule
### Variation Instruction:
Remove `if ~D_out` condition from the `always_comb