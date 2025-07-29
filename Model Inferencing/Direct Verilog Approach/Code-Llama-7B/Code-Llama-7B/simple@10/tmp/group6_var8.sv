```
// Verilog code
module reg_test ( input pass, input clk, output [3:0] out );
// Verilog register declaration
reg [3:0] i;
// Verilog wire declaration
wire [3:0] j;
 
always @(posedge clk) begin
if (pass)
    out <= i;
else
    out <= j;
end

endmodule
```
### Ex