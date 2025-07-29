module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
genvar i;
generate for (i=0; i<4; i=i+1) begin : inside
assign a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[i] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[i]
| x[3] & x[2] & ~x[1] & x[i];
assign a_to_g[5] = x[2] & x[1] & ~x[i] // b (segment index 5)
| x[3] & x[1] & x[i]
| ~x[3] & x[2] & ~x[1] & x[i];
assign a_to_g[4] = ~x[3] & ~x[2] & x[1] & ~x[i] // c (segment index 4)
| x[3] & x[2] & x[1]
| x[3] & x[2] & ~x[i];
assign a_to_g[3] = ~x[3] & ~x[2] & ~x[1] & x[i] // d (segment index 3)
| ~x[3] & x[2] & ~x[1] & ~x[i]
| x[3] & ~x[2] & x[1] & ~x[i]
| x[2] & x[1] & x[i];
assign a_to_g[2] = ~x[3] & x[i] // e (segment index 2)
| ~x[3] & x[2] & ~x[1]
| ~x[2] & ~x[1] & x[i];
assign a_to_g[1] = ~x[3] & ~x[2] & x[i] //