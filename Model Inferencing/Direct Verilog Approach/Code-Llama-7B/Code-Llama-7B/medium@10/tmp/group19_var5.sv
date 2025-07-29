module counter (
    input wire clk, rst,
    output reg [3:0] count,
    output reg [3:0] addout
);
initial begin
    count <= 4'b0000;
    addout <= count[2:1];