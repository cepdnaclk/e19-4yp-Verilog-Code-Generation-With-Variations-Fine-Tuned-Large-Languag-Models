module full_adder(i1, i2, cin, sum, cout);
input [3:0] i1, i2, cin;
output [3:0] sum, cout;
wire [3:0] sum;
wire [3:0] cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Summary:
The Verilog code in this tutorial shows the behavior of a full adder, including the logic
for carrying the bit to be added and the sum.
# Full Adder
### Objectives:
1. Learn to implement the basic logic of the full adder using Verilog.
2. Learn to use the carry bit to produce the sum.
3. Learn to use the carry bit to produce the carry out.

### Variation Instruction: