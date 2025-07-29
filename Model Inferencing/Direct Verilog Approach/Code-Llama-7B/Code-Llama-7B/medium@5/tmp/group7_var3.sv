```module intr_3(o,clk,i,rst);
output o;
input clk,rst,i;
reg [127:0] o;
always @(posedge clk) begin
o <=