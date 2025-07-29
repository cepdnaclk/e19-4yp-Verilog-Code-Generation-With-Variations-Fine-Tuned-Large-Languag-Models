module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
initial begin
    count[3:1] = 3'b100;
end
endmodule
### Final Code
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
initial begin
    count[3:1] = 3'b100;
end
endmodule
### Final Output: 
(1)