module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
generate
for (genvar i=0; i<4; i=i+1) begin : inside
assign a_to_g[6] = ~x[3][i] & ~x[2][i] & ~x[1][i] & x[0][i] 
| ~x[3][i] & x[2][i] & ~x[1][i] & ~x[0][i]
| x[3][i] & x[2][i] & ~x[1][i] & x[0][i]
| x[3][i] & ~x[2][i] & x[1][i] & x[0][i];
assign a_to_g[5] = x[2][i] & x[1][i] & ~x[0][i] 
| x[3][i] & x[1][i] & x[0][i]
| ~x[3][i] & x[2][i] & ~x[1][i] & x[0][i]
| x[3][i] & x[2][i] & ~x[1][i] & ~x[0][i];
assign a_to_g[4] = ~x[3][i] & ~x[2][i] & x[1][i] & ~x[0][i] 
| x[3][i] & x[2][i] & x[1][i]
| x[3][i] & x[2][i] & ~x[0][i];
assign a_to_g[3] = ~x[3][i] & ~x[2][i] & ~x[1][i] & x[0][i] 
| ~x[3][i] & x[2][i] & ~x[1][i] & ~x[0][i]
| x[3][i] & ~x[2][i] & x[1][i] & ~x[0][i]
| x[2][i] & x[1][i] & x[0][i];
assign a_to_g[2] = ~x[3][i] & x[0][i] 
| ~x[3][i] & x[2][i] & ~x[1][i]
| ~x[2][i] & ~x[1][i] & x[0][i];
assign a_to_g[1] = ~x[3][i] & ~x[2][i] & x[0][i] 
| ~x[3][i] & ~x[2][i] & x[1][i]
| ~x[3][i] & x[1][i] & x[0][i]
| x[3][i] & x[2][i] & ~x[1][i] & x[0][i];
assign a_to_g[0] = ~x[3][i] & ~x[2][i] & ~x[1][i] 
| x[3][i] & x[2][i] & ~x[1][i] & ~x[0][i]
| ~x[3][i] & x[2][i] & x[1][i] & x[0][i];
end : inside
endgenerate
endmodule