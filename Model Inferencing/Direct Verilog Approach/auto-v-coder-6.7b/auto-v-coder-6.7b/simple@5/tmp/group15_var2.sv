```verilog
`include "alu_testbench_include.v"

module alu_testbench;
reg [3:0] A,B;
reg [2:0] sel;
wire [3:0] result;
wire zero;

alu dut(.A(A),.B(B),.sel(sel),.result(result),.zero(zero));

initial begin
$display("Starting ALU Testbench\n");
sel <= 3'b000; A <= 4'b1100; B <= 4'b1001;
#10;
assert(result == 4'b0101) $display("Result is correct");
else $error("Result is incorrect");
assert(zero == 1'b0) $display("Zero flag is correctly set");
else $error("Zero flag is incorrect");

// Addition
sel <= 3'b000; A <= 4'b1111; B <= 4'b1111;
#10;
assert(result == 9'b11110) $display("Result is correct");
else $error("Result is incorrect");
assert(zero == 1'b0) $display("Zero flag is correctly set");
else $error("Zero flag is incorrect");

// Signed integer handling test case
sel <= 3'b000; A <= 4'b1010; B <= 4'b0101;
#10;
assert(result == 4'b1111) $display("Result is correct");
else $error("Result is incorrect");
assert(zero == 1'b0) $display("Zero flag is correctly set");
else $error("Zero flag is incorrect");

// Subtraction
sel <= 3'b001; A <= 4'b1111; B <= 4'b1111;
#10;
assert(result == 4'b0000) $display("Result is correct");
else $error("Result is incorrect");
assert(zero == 1'b1) $display("Zero flag is correctly set");
else $error("Zero flag is incorrect");

// AND
sel <= 3'b010;