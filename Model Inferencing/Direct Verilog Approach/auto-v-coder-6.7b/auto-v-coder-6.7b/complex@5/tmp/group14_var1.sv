```
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
wire [3:0] inside;

generate
  for (genvar i = 0; i < 4; i++) begin : g
    assign inside[i] = x[i];
  end
endgenerate

assign a_to_g[6] = ~inside[3] & ~inside[2] & ~inside[1] & inside[0] // a (segment index 6)
| ~inside[3] & inside[2] & ~inside[1] & ~inside[0]
| inside[3] & inside[2] & ~inside[1] & inside[0]
| inside[3] & ~inside[2] & inside[1] & inside[0];
assign a_to_g[5] = inside[2] & inside[1] & ~inside[0] // b (segment index 5)
| inside[3] & inside[1] & inside[0]
| ~inside[3] & inside[2] & ~inside[1] & inside[0]
| inside[3] & inside[2] & ~inside[1] & ~inside[0];
assign a_to_g[4] = ~inside[3] & ~inside[2] & inside[1] & ~inside[0] // c (segment index 4)
| inside[3] & inside[2] & inside[1]
| inside[3] & inside[2] & ~inside[0];
assign a_to_g[3] = ~inside[3] & ~inside[2] & ~inside[1] & inside[0] // d (segment index 3)
| ~inside[3] & inside[2] & ~inside[1] & ~inside[0]
| inside[3] & ~inside[2] & inside[1] & ~inside[0]