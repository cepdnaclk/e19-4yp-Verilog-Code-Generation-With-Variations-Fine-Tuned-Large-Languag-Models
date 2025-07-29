module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always_ff @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out =