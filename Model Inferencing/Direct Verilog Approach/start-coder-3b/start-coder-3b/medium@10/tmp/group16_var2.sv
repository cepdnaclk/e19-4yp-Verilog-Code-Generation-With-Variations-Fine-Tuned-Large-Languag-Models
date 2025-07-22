module mux8(input wire [1:0] a0, input wire [1:0] a1, input wire [1:0] a2, input wire [1:0] a3, input wire [1:0] b, input wire s, output reg [1:0] y);
always @(*)
if(s == 0)
y = a0;
else if(s == 1)
y = a1;
else if(s == 2)
y = a2;
else
y = a3;
endmodule

### Base Verilog Code:
module mux4in1b(
input wire [3:0] a,
input wire [3:0] b,
input wire [1:0] s,
output reg [3: