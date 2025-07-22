```SystemVerilog
module hex7seg_le (
input wire [3:0] x,
output reg [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
genvar i;
generate
for (i=0;i<4;i++) begin : ins
always @(x[i]) begin
// Logic equations for each segment (active high assumed)
assign a_to_g[6] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (x[3] & x[2] & ~x[1] & x[0]) | (x[3] & ~x[2] & x[1] & x[0]);
assign a_to_g[5] = (x[2] & x[1] & ~x[0]) | (x[3] & x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & x[0]) | (x[3] & x[2] & ~x[1] & ~x[0]);
assign a_to_g[4] = (~x[3] & ~x[2] & x[1] & ~x[0]) | (x[3] & x[2] & x[1]) | (x[3] & x[2] & ~x[0]);
assign a_to_g[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (x[3] & ~x[2] & x[1] & ~x[0]) | (x[2] & x[1] & x[0]);
assign a_to_g[2] = (~x[3] & x[0]) | (~x[3] & x[2] & ~x[1]) | (~x[2] & ~x[1] & x