```
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
wire [0:2]  x_int;
generate
  if (x[0]) x_int[0] = 1'b1;
  else      x_int[0] = 1'b0;

  if (x[1]) x_int[1] = 1'b1;
  else      x_int[1] = 1'b0;

  if (x[2]) x_int[2] = 1'b1;
  else      x_int[2] = 1'b0;

endgenerate

// Logic equations for each segment (active high assumed)
assign a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0];
assign a_to_g[5] = x[2] & x[1] & ~x[0] // b (segment index 5)
| x[3] & x[1] & x[0]
| ~x[3] & x[2] & ~x[1] & x[0]
| x[3] & x[2] & ~x[1] & ~x[0];
assign a_to_g[4] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
| x[3] & x[2] & x[1]
| x[3] & x[2] & ~x[0];
assign a_to_g[3] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (