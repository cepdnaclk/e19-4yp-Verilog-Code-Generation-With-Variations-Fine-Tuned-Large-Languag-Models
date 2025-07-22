module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Output:
```
Simulation failed. Reason:
    Line 11:
        ALU.v:12: port 'alu_out' has a type'reg', but
        ALU.v:11: port 'alu_out' has a type 'logic'
```