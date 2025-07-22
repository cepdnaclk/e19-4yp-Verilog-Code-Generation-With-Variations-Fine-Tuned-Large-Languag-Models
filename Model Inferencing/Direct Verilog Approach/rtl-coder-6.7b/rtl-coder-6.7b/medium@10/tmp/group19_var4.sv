module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
initial begin
    count[0] = 0;
    count[1] = 0;
    count[2] = 0;
    count[3] = 0;
end
endmodule