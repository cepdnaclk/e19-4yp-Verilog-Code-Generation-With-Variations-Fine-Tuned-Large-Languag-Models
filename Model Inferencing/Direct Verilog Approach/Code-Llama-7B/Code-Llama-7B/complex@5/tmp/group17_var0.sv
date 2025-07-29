module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
// Declare all variables/regs for the module
reg [N-1:0] max;
reg [N-1:0] min;
function bit test_eq(wire [N-1:0] x, wire [N-1:0] y);
begin
repeat(N) test_eq = (x[i] == y[i]);
return test_eq;
end
endfunction
// Implement the body of the design
always @(*)
begin
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
if(x > y)
max = x;
else
max = y;
if(x < y)
min = x;
else
min = y;
if(test_eq(max, min))
eq = 1'b1;
else
eq = 1'b0;
end
generate
for(i = 0; i < N; i = i + 1 )
begin: g
if((i == max) || (i == min))
generate
if(i == max)
gt = 1'b