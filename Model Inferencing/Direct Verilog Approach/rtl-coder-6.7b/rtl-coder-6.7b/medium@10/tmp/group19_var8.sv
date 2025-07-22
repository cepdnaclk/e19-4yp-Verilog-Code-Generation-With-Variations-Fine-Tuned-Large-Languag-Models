module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] array_slice[0:3];
initial begin
    array_slice[0] = 0;
    array_slice[1] = 1;
    array_slice[2] = 2;
    array_slice[3] = 3;
end
wire [3:0] initial_block_code = array_slice[0] + 1;
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= initial_block_code;
end
endmodule