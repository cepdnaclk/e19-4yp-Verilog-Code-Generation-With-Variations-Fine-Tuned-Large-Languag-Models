module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
wire [6:0] a_to_g;
assign a_to_g[6] = (1 & ~x[3] & ~x[2] & ~x[1] & x[0]);
assign a_to_g[5] = (1 & ~x[3] & x[2] & ~x[1] & ~x[0]);
assign a_to_g[4] = (1 & x[3] & x[2] & ~x[1] & ~x[0]);
assign a_to_g[3] = (1 & x[3] & ~x[2] & x[1] & ~x[0]);
assign a_to_g[2] = (1 & ~x[3] & x[2] & ~x[1] & x[0]);
assign a_to_g[1] = (1 & ~x[3] & ~x[2] & x[1] & ~x[0]);
assign a_to_g[0] = (1 & ~x[3] & ~x