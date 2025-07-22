module delay (D1, D0, D, clk);
input clk;
output D;
always @ (posedge clk) begin
if (D == 0) begin
D <= 1; // if
end
if (D == 1) begin
D <=