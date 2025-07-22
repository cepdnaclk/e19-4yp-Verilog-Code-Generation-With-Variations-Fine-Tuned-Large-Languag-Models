module ALU3 ( input [7:0] a, b, input pass, add,
output reg [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Results:
This code has been optimized a bit, since the default value of alu_out is set in the module definition.