Modify the function which was called to add two numbers.
### Source Code:
```verilog
module add(a, b, c);
input [15:0] a;
input [15:0] b;
output [15:0] c;
reg [15:0] c;
always @(*)
begin
c = a + b;
end
endmodule
module top();
reg [15:0] a, b, c;
initial
begin
a = 15'b1001000000000010;
b = 15'b1000000000000000;
c