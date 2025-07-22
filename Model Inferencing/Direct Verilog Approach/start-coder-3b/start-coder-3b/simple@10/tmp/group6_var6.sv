module ALU ( input   [7:0] a, b, input pass, add,
output  logic [15:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### The Compiler’s View of the Code:
* Note the logic [15:0] modifier that is now used to declare an output.
* The compiler no longer complains that the output type is “unsigned” and not “logic”.
* The output type is now “logic”.
* The output type is now “unsigned”, but this is OK.

## 15.19 Unsigned Data and Virtuoso

### Base Verilog Code:
module ALU ( input [7:0] a, b, input pass, add,
output reg [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out =