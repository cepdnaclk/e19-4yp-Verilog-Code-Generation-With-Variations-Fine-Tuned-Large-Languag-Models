module counter (
    input wire clk, rst,
    output reg [3:0] count
);
// Inserted code
initial begin
    count[3:1] = 3'b111;
end
// End of inserted code
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b