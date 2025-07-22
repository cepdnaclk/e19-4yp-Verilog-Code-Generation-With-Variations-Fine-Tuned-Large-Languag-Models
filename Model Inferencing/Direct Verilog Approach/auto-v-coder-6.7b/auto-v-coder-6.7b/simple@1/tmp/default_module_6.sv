```verilog
module ALU ( input [7:0] a, b, input pass, add,
output logic[7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
```

Changes from the original code:
- Changed output type from reg to logic.

Note: The changes made are part of style guidelines and are not necessary to the function of the ALU. The original code is already compliant with Verilog syntax. The changes were made to align with modern Verilog style guides.