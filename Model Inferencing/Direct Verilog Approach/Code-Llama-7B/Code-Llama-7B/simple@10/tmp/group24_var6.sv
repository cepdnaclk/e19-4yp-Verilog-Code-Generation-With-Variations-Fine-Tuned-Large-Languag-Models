module DFF (
    input clk,
    input [31:0] in_data,
    output [31:0] out_data
);
reg [31:0] data;
always @(posedge clk)
    data <= in_data;