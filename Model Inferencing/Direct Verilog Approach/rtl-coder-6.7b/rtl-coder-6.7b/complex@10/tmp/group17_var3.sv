```verilog
// 8-bit signed comparison module
module comp(
input wire [7:0] x, // Input operand 1
input wire [7:0] y, // Input operand 2
output reg gt, // Greater than
output reg eq, // Equal
output reg lt); // Less than
generate
if (TYPE == "signed")
begin
if (PREC > 1)
always_ff @( posedge clk)
begin
if(x > y)
gt <= 1'b1;
else
gt <= 1'b0;
if(x == y)
eq <= 1'b1;
else
eq <= 1'b0;
if(x < y)
lt <= 1'b1;
else
lt <= 1'b0;
end
end
endgenerate
endmodule
```