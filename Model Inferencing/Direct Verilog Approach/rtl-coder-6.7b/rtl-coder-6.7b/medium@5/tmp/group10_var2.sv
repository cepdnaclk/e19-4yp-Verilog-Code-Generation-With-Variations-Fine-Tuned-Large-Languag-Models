module adder2(A, B, CLK, Resetn, S, C);
input [1:0] A, B;
input CLK, Resetn;
output [1:0] S[1];
output C;

wire carry;
reg S[1], C;

always @(posedge CLK or negedge Resetn)
if (Resetn == 1)
carry <= 0;
else
carry <= C;

always @(posedge CLK or negedge Resetn)
if (Resetn == 1)
S[0] <= 0;
else
S[0] <= S[1];

always @(posedge CLK or negedge Resetn)
if (Resetn == 1)
C <= 0;
else
C <= carry;
endmodule
### Testbench:
Verilog Testbench