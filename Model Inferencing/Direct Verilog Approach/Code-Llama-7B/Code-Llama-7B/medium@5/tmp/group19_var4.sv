module counter (
    input wire clk, rst,
    output reg [3:0] count,
    input [3:0] number
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
wire [3:0] number_index = number[0];
initial begin
	number_index = number[2:0];
end