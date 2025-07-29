```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] slice;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        slice[3:0] <= 4'b0000;
        count <= 4'b0000;
    end
    else begin
        count <= count + 1;
        slice[3: