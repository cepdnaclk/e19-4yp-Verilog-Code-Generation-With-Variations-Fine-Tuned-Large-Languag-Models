module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = {3'b0, 3'b1};
    else Count = Count + {3'b0, 3'b1};
end
endmodule
### Testbench File:
module Chap1Tester;
    reg [1:0] TestClk;
    reg Reset;
    initial begin
        Reset = 1'b0;
        #5 Reset = 1'b1;
        #5 Reset = 1'b0;
    end
    always #1 TestClk = ~TestClk;
    initial begin
        #100;
        $display("Chap1Counter Testbench Start\n");
        $write("Chap1Counter Testbench Start\n");
        #10