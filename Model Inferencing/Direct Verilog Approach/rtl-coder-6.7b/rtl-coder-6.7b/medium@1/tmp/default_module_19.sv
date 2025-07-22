module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_array [0:7];
wire [3:0] result;
initial result = count_array[0][1:0] | count_array[2][1:0] | count_array[4][1:0] | count_array[6][1:0] | count_array[0][3] | count_array[2][3] | count_array[4][3] | count_array[6][3];
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule
### Testbench Code:
module tb_counter ();
wire clk, rst;
wire [3:0] count;
counter counter_0(clk, rst, count);
always #5 clk = ~clk;
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_counter);
    $monitor("%b", count);
end
initial begin
    clk = 1'b0;
    rst = 1'b1;
    #10 rst = 1'b0;
end
endmodule