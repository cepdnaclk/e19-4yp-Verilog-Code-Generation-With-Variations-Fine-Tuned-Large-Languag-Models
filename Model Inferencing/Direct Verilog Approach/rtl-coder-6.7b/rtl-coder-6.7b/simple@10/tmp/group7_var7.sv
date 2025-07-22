module AndOr (output X, Y, input A, B, C);
bit A, B, C;
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Test Vector:
A	B	C	X	Y
0	0	0	0	0
0	0	1	0	1
0	1	0	0	1
0	1	1	0	1
1	0	0	0	0
1	0	1	0	1
1	1	0	1	1
1	1	1	1	1
### Testbench Verilog Code:
module AndOr_testbench();
reg A, B, C;
wire X, Y;
AndOr dut (.A,.B,.C,.X,.Y);
initial begin
$dumpfile("AndOr.vcd");
$dumpvars;
#5 A=0; B=0; C=0;
#5 A=0; B=0; C=1;
#5 A=0; B=1; C=0;
#5 A=0; B=1; C=1;
#5 A=1; B=0; C=0;
#5 A=1; B=0; C=1;
#5 A=1; B=1; C=0;
#5 A=1; B=1; C=1;
$finish;
end
endmodule
## Running the simulator:
- compile the testbench module
- run the simulator