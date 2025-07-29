module alu(a, b, f, out, cout);
  input [3:0] a, b; input [2:0] f; output [3:0] out; output cout;
  always @ (a,b,f) begin case(f) 6'b000000 : out = a + b; 6'b000001: out = a; 6'b000010: out = b; else: out = 4'b0; endcase
endmodule
### Base Verilog Code:
module tst_alu();
  reg [3:0]a,b; reg[1:0] f; wire [3:0]d; wire co;
  alu aa(d,co,a,b,f); // Instantiate ALU
  initial begin f=2'b00; a=4'