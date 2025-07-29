```
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_array [3:0];
reg [3:0] count_reg;
reg [3:0] count_reg_2;
reg [3:0] count_reg_3;
wire [3:0] mux_out;

initial begin
    count_array = 4'b0000;
end

always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end

always @(*) begin
    if (count < 4) count_reg = count_array[count];
end