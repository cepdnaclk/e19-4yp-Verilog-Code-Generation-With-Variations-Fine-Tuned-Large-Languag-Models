```Verilog
module comp
#(parameter N=32)
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
// Set flags based on comparison results
if(x > y)
gt = 1'b1;
if(x == y)
eq = 1'b1;
if(x < y)
lt = 1'b1;
end
endmodule