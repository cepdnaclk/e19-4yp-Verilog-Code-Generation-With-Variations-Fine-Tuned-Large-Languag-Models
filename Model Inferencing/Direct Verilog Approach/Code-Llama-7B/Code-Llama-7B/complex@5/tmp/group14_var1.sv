module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)

generate
generate

inside
{
wire [3:0] x_inside_[3:0] = x[3:0];
assign a_to_g[6] = ~x_inside_[3] & ~x_inside_[2] & ~x_inside_[1] & x_inside_[0] // a (segment index 6)
| ~x_inside_[3] & x_inside_[2] & ~x_inside_[1] & ~x_inside_[0]
| x_inside_[3] & x_inside_[2] & ~x_inside_[1] & x_inside_[0]
| x_inside_[3] & ~x_inside_[2] & x_inside_[1] & x_inside_[0];
assign a_to_g[5] = x_inside_[2] & x_inside_[1] & ~x_inside_[0] // b (segment index 5)
| x_inside_[3] & x_inside_[1] & x_inside_[0]
| ~x_inside_[3] & x_inside_[2] & ~x_inside_[1] & x_inside_[0]
| x_inside_[3] & ~x_inside_[2] & x_inside_[1] & ~x_inside_[0];
assign a_to_g[4] = ~x_inside_[3] & ~x_inside_[2] & x_inside_[1] & ~x_inside_[0] // c (segment index 4)
| x_inside_[3] & x_inside_[2] & x_inside_[1]
| x_inside_[3] & x_inside_[2] & ~x_inside_[0];
assign a_to_g[3] = ~x_inside_[3] & ~x_inside_[2] & ~x_inside_[1] & x_inside_[0] // d (segment index 3)
| ~x_inside_[3] & x_inside_[2] & ~x_inside_[1] & ~x_inside_[0]
| x_inside_[3] & ~x_inside_[2] & x_inside_[1] & ~x_inside_[0]
| x_inside_[2] & x_inside_[1] & x_inside_[0];
assign a_to_g[2] = ~x_inside_[3] & x_inside_[0] // e (segment index 2)
| ~x_inside_[3] & x_inside_[2] & ~x_inside_[1]
| ~x_inside_[2] & ~x_inside_[1] & x_inside_[0];
assign a_to_g[1] = ~x_inside_[3] & ~x_inside_[2] & x_inside_[0] // f (segment index 1)
| ~x_inside_[3] & ~x_inside_[2] & x_inside_[1]
| ~x_inside_[3] & x_inside_[1] & x_inside_[0]
| x_inside_[3] & x_inside_[2] & ~x_inside_[1] & x_inside_[0];
assign a_to_g[0] = ~x_inside_[3] & ~x_inside_[2] & ~x_inside_[1] // g (segment index 0)
| x_inside_[3] & x_inside_[2] & ~x_inside_[1] & ~x_