module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_wire;
initial
count_wire = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= count_wire;
    else count <= count_wire + 1;
end
endmodule
### Expected Result:
Passed without errors
### Reference Circuit:
counter.v