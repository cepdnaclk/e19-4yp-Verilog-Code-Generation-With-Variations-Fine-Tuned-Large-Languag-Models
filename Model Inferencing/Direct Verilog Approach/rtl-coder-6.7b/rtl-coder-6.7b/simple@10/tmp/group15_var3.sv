// ALU Test Bench
`timescale 1ns/1ns
module tb_sw2led2;

parameter FAIL = 0;
parameter PASS = 1;
parameter NUM_TESTS = 15;

reg [7:0] sw_tb;
wire [7:0] ld_tb;
reg clk_tb;
reg reset_tb;
integer i;
reg [7:0] expected;
reg [1:0] test_result;
reg [3:0] op_code;
reg [3:0] test_cases[NUM_TESTS];

initial begin
reset_tb = 0;
clk_tb = 0;

test_cases[0] = 4'h1;
test_cases[1] = 4'h2;
test_cases[2] = 4'h3;
test_cases[3] = 4'h4;
test_cases[4] = 4'h0;
test_cases[5] = 4'h1;
test_cases[6] = 4'h2;
test_cases[7] = 4'h3;
test_cases[8] = 4'h4;
test_cases[9] = 4'h0;
test_cases[10] = 4'h1;
test_cases[11] = 4'h2;
test_cases[12] = 4'h3;
test_cases[13] = 4'h4;
test_cases[14] = 4'h4;

end

initial begin
reset_tb <= 1'b1;
#100 reset_tb <= 1'b0;
end

always begin
#5 clk_tb <= ~clk_tb;
end

wire [7:0] expected;

//sw_tb <= test_cases[i];

initial begin

reset_tb <= 1'b1;
#100
reset_tb <= 1'b0;
#50

for (int i=0;i<NUM_TESTS;i=i+1) begin
sw_tb <= test_cases[i];
#100;