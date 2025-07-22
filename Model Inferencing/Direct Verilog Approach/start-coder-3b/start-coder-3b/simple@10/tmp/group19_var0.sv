module test_inst(clk, reset, c_data, c_out);

reg clk = 0;
reg reset = 0;

lpm_ff flipflop[1:0](.data(c_data[0]),.aclr(reset),.clock(clk),.q(c_out[0]));
defparam flipflop[1:0].lpm_width = 1;
lpm_ff flipflop[2:1](.data(c_data[1]),.aclr(reset),.clock(clk),.q(c_out[1]));
defparam flipflop[2:1].lpm_width = 1;

initial
begin
for(int i = 0; i < 8; i++)
#20 clk = ~clk;
end

initial
begin
reset = 0;

for(int i = 0; i < 32; i++)
#20 clk = ~clk;
end

initial
begin
$display("start test"); reset = 1; #10$display("input %d, expected: %d", c_data[0], c_out[0]);
$display("input %d, expected: %d", c_data[1], c_out[1]); reset = 0; for(int i = 0; i < 32; i++) #20 clk = ~clk; end end module ### Results: Start test input 1, expected: 0 input 0, expected: 1 ### 11.07 (c): Design a circuit to implement the half adder and full adder using a single lpm_ff. Hint: you can write the design as a function of 2 2-bit input operands. ### Base Verilog Code: module half_adder(in_a, in_b, c_out, sum_out); input in_a, in_b; output c_out, sum_out; lpm_ff sum(.data(in_a ^ in_b),.aclr(in_b),.q(sum_out)); defparam sum.lpm_width = 2; lpm_ff carry(.data(in_a & in_b),.aclr(in_b),.q(c_out)); defparam carry.lpm_width = 2; endmodule ### Variation Instruction: Expand the testbench to include test cases using a dynamic array as input operands. ### Modified Code: module test_inst(clk, reset, c_data, c_out, carry_out, sum_out); reg clk = 0; reg reset = 0; lpm_ff carry[1:0](.data(c_data[0] & c_data[1]),.aclr(reset),.clock(clk),.q(carry_out[0])); defparam carry[1:0].lpm_width = 2; lpm_ff sum[1:0](.data(c_data[0] ^ c_data[1]),.aclr(reset),.clock(clk),.q(sum_out[0])); defparam sum[1:0].lpm_width = 2; initial begin reset = 0; for(int i = 0; i < 32; i++) #20 clk = ~clk; end initial begin$display("start test");
reset = 1;

$display("input %d, %d, expected: %d", c_data[0], c_data[1], carry_out[0]);$display("input %d, %d, expected: %d", c_data[0], c_data[1], sum_out[0]);
reset = 0;

for(int i = 0; i < 32; i++)
#20 clk = ~clk;
end
endmodule
### Results:
Start test
input 1, 1, expected: 0
input 0, 1, expected: 1