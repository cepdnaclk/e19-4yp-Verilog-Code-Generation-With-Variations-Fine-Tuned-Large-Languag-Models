module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] a;
initial begin
    count = 4'b0000;
    a = 4'b0000;
    ##0;
    assert({a} === {count}) else $error("assertion failed");
end 
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule