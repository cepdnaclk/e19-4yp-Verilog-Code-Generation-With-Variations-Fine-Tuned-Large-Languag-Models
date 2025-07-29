module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Expected Output:
The following code has been tested in Modelsim and is expected to produce the same results for the 
testbench ALU_tb.