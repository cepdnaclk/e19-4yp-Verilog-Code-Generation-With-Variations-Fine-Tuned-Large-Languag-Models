module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
if(x == y)
goto gt_else;
if(x > y)
gt = 1’b1;
goto gt_else;
lt = 1’b1;
gt_else:
gt = 1’b1;
end
endmodule
## 0300 - 0301 - C/C++ - Conditional Statements
### Base Verilog Code:
module