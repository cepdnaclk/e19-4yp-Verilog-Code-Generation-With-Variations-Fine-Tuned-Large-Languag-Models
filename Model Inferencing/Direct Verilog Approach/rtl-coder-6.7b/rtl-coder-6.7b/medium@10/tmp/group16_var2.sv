module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y[2]
);
always @(*)
if(s == 0)
y[0] = a;
else
y[1] = b;
endmodule