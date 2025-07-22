module ALU ( input [7:0] a, b, input pass, add,
logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Simulated Code:
module top;
// Testbench code
reg [7:0] a, b;
reg pass, add;
wire [7:0] alu_out;
// Instantiate ALU module
ALU my_alu (.a(a),.b(b),.pass(pass),.add(add),.alu_out(alu_out) );
initial begin
// Set some input values
a = 8'h10;
b = 8'h20;
# 10;       // Wait 10ns
pass = 1;   // Set pass to 1 to pass 'a'
# 10;       // Wait 10ns
pass = 0;   // Set pass to 0 to add 'a' and 'b'
# 10;       // Wait 10ns
add = 1;    // Set add to 1 to add 'a' and 'b'
# 10;       // Wait 10ns
add = 0;    // Set add to 0
end
endmodule