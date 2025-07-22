module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
function [1:0] getFlags(int x, int y);
// Default outputs to 0
getFlags = 2'b0;
if(x > y)
getFlags[0] = 1'b1;
if(x == y)
getFlags[1] = 1'b1;
if(x < y)
getFlags[0] = 1'b1;
endfunction
always @(*) // Combinational logic
begin
// Get flags based on comparison
assign {gt, eq, lt} = getFlags(x, y);
end
endmodule
### Testbench Code:
`timescale 1ns/1ns
module tb ();
localparam N = 32;
logic [N-1:0] x, y;
logic gt, eq, lt;
// Instantiate DUT
comp #(.N(N))
DUT (.*);
initial begin
// Run tests
x = 0;
y = 5;
#10
$display("x = %d, y = %d, gt = %b, eq = %b, lt = %b", x, y, gt, eq, lt);
#10;
x = 4;
y = 4;
#10
$display("x = %d, y = %d, gt = %b, eq = %b, lt = %b", x, y, gt, eq, lt);
#10;
x = 6;
y = 5;
#10
$display("x = %d, y = %d, gt = %b, eq = %b, lt = %b", x, y, gt, eq, lt);
#10;
// Exit simulation
$finish;
end
endmodule
### Outputs:
```
x = 0, y = 5, gt = 1'b1, eq = 1'b0, lt = 1'b0
x =