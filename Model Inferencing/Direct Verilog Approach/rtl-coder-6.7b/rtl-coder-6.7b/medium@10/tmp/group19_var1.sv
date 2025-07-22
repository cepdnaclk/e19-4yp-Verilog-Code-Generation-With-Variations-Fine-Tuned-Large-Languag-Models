module counter (
    input wire clk, rst,
    output reg [3:0] count
);
wire [2:0] a = 3'b000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule
### Testbench Script:
`include "counter.v"
module tb();
reg clk, rst;
wire [3:0] count;
counter counter1(clk, rst, count);
initial begin
clk = 0;
rst = 1;
#4 rst = 0;
end
always #1 clk = ~clk;
always @(posedge clk) begin
$display("clk=%d, rst=%d, count=%b", clk, rst, count);
end
endmodule