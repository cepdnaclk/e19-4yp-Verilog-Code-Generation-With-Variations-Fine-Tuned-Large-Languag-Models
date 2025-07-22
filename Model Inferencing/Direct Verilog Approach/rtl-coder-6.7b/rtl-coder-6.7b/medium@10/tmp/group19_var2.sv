module counter (
    input wire clk, rst,
    output reg [3:0] count
);
assign  a = count[1:0];
initial begin
    #100;
    a = 1;
    #100;
    a = 0;
end
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule