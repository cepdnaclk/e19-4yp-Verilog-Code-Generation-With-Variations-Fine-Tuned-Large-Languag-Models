module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end

initial begin
    //$display("[%b]", count[3:0]);
    $display("[%b]", count[3:0], count[1:0]);
end
endmodule
### Expected Output: