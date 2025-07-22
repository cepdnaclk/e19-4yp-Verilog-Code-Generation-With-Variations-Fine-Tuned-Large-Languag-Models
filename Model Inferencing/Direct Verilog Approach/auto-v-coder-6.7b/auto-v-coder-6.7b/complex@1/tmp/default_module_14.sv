```verilog
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);

wire [3:0] x_inside;
generate
  for(genvar i=0; i<4; i++) begin
    assign x_inside[i] = x[i];
  end
endgenerate

// Logic equations for each segment (active high assumed)
assign a_to_g[6] = ~x_inside[3] & ~x_inside[2] & ~x_inside[1] & x_inside[0] // a (segment index 6)
| ~x_inside[3] & x_inside[2] & ~x_inside[1] & ~x_inside[0]
| x_inside[3] & x_inside[2] & ~x_inside[1] & x_inside[0]
| x_inside[3] & ~x_inside[2] & x_inside[1] & x_inside[0];
assign a_to_g[5] = x_inside[2] & x_inside[1] & ~x_inside[0] // b (segment index 5)
| x_inside[3] & x_inside[1] & x_inside[0]
| ~x_inside[3] & x_inside[2] & ~x_inside[1] & x_inside[0]
| x_inside[3] & x_inside[2] & ~x_inside[1] & ~x_inside[0];
assign a_to_g[4] = ~x_inside[3] & ~x_inside[2] & x_inside[1] & ~x_inside[0] // c (segment index 4)
| x_inside[3] & x_inside[2] & x_inside[1]
| x_inside[3] & x_ins