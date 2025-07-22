module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_temp;
always @(posedge clk or posedge rst) begin
    if (rst) count_temp <= 4'b0000;