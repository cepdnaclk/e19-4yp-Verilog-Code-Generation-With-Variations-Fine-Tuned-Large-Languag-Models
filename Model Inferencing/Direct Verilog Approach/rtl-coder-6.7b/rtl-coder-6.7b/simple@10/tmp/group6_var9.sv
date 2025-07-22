module ALU ( input [7:0] a, b, input pass, add,
logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Testbench Code:
module ALU_tb();
// Testbench for ALU
logic [7:0] a, b;
logic pass, add;
logic [7:0] alu_out;
// Instantiating the ALU
ALU UUT (.a(a),.b(b),.pass(pass),.add(add),.alu_out(alu_out));
initial begin
#0 // Wait for circuit to initialize
// Test some logic values (0 and 1)
a = 8'h0; b = 8'h5; pass = 1'b0; add = 1'b0; #10;
a = 8'h0; b = 8'h5; pass = 1'b0; add = 1'b1; #10;
a = 8'h0; b = 8'h5; pass = 1'b1; add = 1'b0; #10;
a = 8'h0; b = 8'h5; pass = 1'b1; add = 1'b1; #10;
a = 8'h5; b = 8'h8; pass = 1'b0; add = 1'b0; #10;
a = 8'h5; b = 8'h8; pass = 1'b0; add = 1'b1; #10;
a = 8'h5; b = 8'h8; pass = 1'b1; add = 1'b0; #10;
a = 8'h5; b = 8'h8; pass = 1'b1; add = 1'b1; #10;
a = 8'hff; b = 8'h1; pass = 1'