```verilog
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
generate
for(i=0;i<4;i=i+1) begin:inside
always @(*) begin

assign a_to_g[6-i] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0];
assign a_to_g[5-i] = x[2] & x[1] & ~x[0] // b (segment index 5)
| x[3] & x[1] & x[0]
| ~x[3] & x[2] & ~x[1] & x[0]
| x[3] & x[2] & ~x[1] & ~x[0];
assign a_to_g[4-i] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
| x[3] & x[2] & x[1]
| x[3] & x[2] & ~x[0];
assign a_to_g[3-i] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & ~x[2] & x[1] & ~x[0]
| x[2] & x[1] & x[0];
assign a_to_g[2-i] = ~x[3] &