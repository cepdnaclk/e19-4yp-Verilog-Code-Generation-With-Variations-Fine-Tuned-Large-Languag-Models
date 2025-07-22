module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_slice;
wire [3:0] count_plus_1;
always @(posedge clst or posedge rst) begin
    if (rst) begin
        count_slice <= 4'b0000;
        count <= 4'b0000;
    end
    else begin
        count_slice <= count_slice +1;
        count <= count_slice;
    end
end
endmodule
### Testbench Code:
module tb_counter();
    reg clk,reset;
    reg [3:0] count;
    counter c ( clk, reset, count );
    always
        #10 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
        clk = 0;
        reset = 0;
        #15 reset = 1;
        #50 reset = 0;
        #1000;
        $finish;
    end
endmodule