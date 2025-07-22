module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] data;
always @(posedge clk or posedge rst) begin
    if (rst) data <= 4'b0000;
    else data <= data + 1;
end
assign count = data;
endmodule