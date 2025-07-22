module ALU ( input logic [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always_comb
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else if (~add) alu_out = a - b; // Subtract 'b' from 'a'
else alu_out = 0;           // Default output is 0
endmodule