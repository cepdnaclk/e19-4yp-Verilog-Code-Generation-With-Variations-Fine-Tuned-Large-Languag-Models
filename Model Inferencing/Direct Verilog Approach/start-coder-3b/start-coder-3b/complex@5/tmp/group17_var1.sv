module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
// Function call to the
// inside function.
always @(*)
gt = inside(x, y);
endmodule
function [N-1:0] inside(input wire [N-1:0] x, input wire [N-1:0] y);
// Declare the local
// array variables.
reg [N-1:0] a[N];
reg [N-1:0] b[N];
// Define array index variable
// declaration.
for(i=0; i<N; i=i+1)
begin
// Store the value of x[i]
// into the array.
a[i] = x[i];
// Store the value of y[i] into
// the array.
b[i] = y[i];
end
// Function to return inside function result.
if(a[0] > b[0])
inside = 1'b1;
else
inside = 1'b0;
endfunction
## Lesson: Write a function in Verilog
A function is a self-contained sub-routine or a subroutine that is able to perform some task or set of tasks. It performs some computation given