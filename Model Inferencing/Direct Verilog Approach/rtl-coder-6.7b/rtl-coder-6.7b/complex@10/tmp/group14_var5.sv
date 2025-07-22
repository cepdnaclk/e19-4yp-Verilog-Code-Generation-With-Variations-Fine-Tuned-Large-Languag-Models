```
module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g
);
generate
for (genvar i = 0; i < 4; i++) begin : inside
always @(x[i])
case (x[i])
0 : begin
assign a_to_g[6] = 1'b0;
assign a_to_g[5] = 1'b0;
assign a_to_g[4] = 1'b0;
assign a_to_g[3] = 1'b0;
assign a_to_g[2] = 1'b1;
assign a_to_g[1] = 1'b1;
assign a_to_g[0] = 1'b1;
end
1 : begin
assign a_to_g[6] = 1'b1;
assign a_to_g[5] = 1'b0;
assign a_to_g[4] = 1'b0;
assign a_to_g[3] = 1'b1;
assign a_to_g[2] = 1'b1;
assign a_to_g[1] = 1'b1;
assign a_to_g[0] = 1'b1;
end
2 : begin
assign a_to_g[6] = 1'b0;
assign a_to_g[5] = 1'b0;
assign a_to_g[4] = 1'b1;
assign a_to_g[3] = 1'b0;
assign a_to_g[2] = 1'b0;
assign a_to_g[1] = 1'b1;
assign a_to_g[0] = 1'b0;
end
3 : begin
assign a_to_g[6] = 1'b0;
assign a_to_g[5] = 1'b0;
assign a_to_g[4] = 1'b0;
assign a_to_g[3] = 1'b0;
assign a_to_g[2] = 1'b1;
assign a_