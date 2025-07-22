module Prob_18_22_D_Latch_Mealy (D_out, di, clk, wr, rst);
// D-latch with Mealy reset
output D_out;
input di, clk, wr, rst;
reg [7: 0] D_latch_input;
always @ (posedge clk)
if (rst) begin
D_latch_input <= 0;
end else
if (wr) begin
D_latch_input <=
$inside({D_latch_input[7: 0], di[0]}, {0, 0, 0, 0, 0, 0, 0, 1}); end else D_latch_input <=
$inside({D_latch_input[7: 0], di[0]}, {0, 0, 0, 0, 0, 0, 0, 1});
D_out = D_latch_input[7: 0];
endmodule
### Implementation Code:
Implement the `Prob_18_22_D_Latch_Mealy` module.
### Generated Code:
module Prob_18_22_D_Latch_Mealy (D_out, di, clk, wr, rst);
// D-latch with Mealy reset
output D_out;
input di, clk, wr, rst;
reg [7: 0] D_latch_input;
always @ (posedge clk) begin
if (rst) begin
D_latch_input <= 0;
end else begin
if (wr) begin
D_latch_input <=
$inside({D_latch_input[7: 0], di[0]}, {0, 0, 0, 0, 0, 0, 0, 1});
end else begin
D_latch_input <=
$inside({D_latch_input[7: 0], di[0]}, {0, 0, 0, 0, 0, 0, 0, 1});
end
end
end
D_out = D_latch_input[7: 0];
endmodule
Note: this is a simplified version of the `Prob_18_22_D_Latch_SR` module. However, you may want to use this as a basis for your own implementation of the `Prob_18_22_D_Latch_SR` module.

Next Section - Prob_85_108_Mealy_16bits