module counter_regfile_aload (
    input wire clk, rst, aload,
    input wire [3:0] aload_data,
    output reg [3:0] count
);
reg [3:0] count_regfile[0:3