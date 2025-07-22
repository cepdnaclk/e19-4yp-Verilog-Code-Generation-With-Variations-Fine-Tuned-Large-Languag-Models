module RALU #(parameter subtract_only=0)
( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
initial begin
pass = 0;
add = 0;
alu_out = 0;
end
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add & subtract_only) alu_out = a + b;
// Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Variation Instruction:
Add a parameter named add_only to the ALU module to make it more generic.
### Modified Code: