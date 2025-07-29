module alu_tb;
reg [7:0] operand_in1;
reg [7:0] operand_in2;
reg [7:0] expected_result;
reg [1:0] instruction;
reg [7:0] result;
reg clk;
reg [7:0] sw;
wire [7:0] ld;

sw2led2 sw2led (sw, ld);

alu dut(operand_in1, operand_in2, instruction, result, clk);

initial
begin
clk = 0;

// ADDITION
operand_in1 = 32'h1;
operand_in2 = 32'h2;
instruction = 2'b00;
expected_result = 8'h3;
assert (expected_result == dut.result) else $error("#1: FAILED");

operand_in1 = 32'h10;
operand_in2 = 32'h11;
instruction = 2'b00;
expected_result = 8'h11;
assert (expected_result == dut.result) else $error("#2: FAILED");

operand_in1 = 32'h100;
operand_in2 = 32'h101;
instruction = 2'b00;
expected_result = 8'h1;
assert (expected_result == dut.result) else $error("#3: FAILED");

operand_in1 = 32'h1000;
operand_in2 = 32'h1001;
instruction = 2'b00;
expected_result = 8'h1;
assert (expected_result == dut.result) else $error("#4: FAILED");

operand_in1 = 32'h10000;
operand_in2 = 32'h10001;
instruction = 2'b00;
expected_result = 8'h1;
assert (expected_result == dut.result) else $