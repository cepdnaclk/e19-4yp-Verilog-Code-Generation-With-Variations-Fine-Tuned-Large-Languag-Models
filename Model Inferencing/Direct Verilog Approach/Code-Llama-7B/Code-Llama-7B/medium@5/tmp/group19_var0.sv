module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial begin
    count[3:1] = '0;
end
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0