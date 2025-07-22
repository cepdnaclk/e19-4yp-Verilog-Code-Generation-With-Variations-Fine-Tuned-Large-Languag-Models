module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        Count[1] = ~Count[1];
    end
end
always #1000 $display("Count = %0h: \n", Count);
end
always @(posedge Clk) begin
    if (Reset) Count = 0;
    else begin
        Count = Count + 1;
        Count[1] = ~Count[1];
    end
    Count[1] = ~Count[1];
end
endmodule
### Base Verilog Code:
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        Count[1] = ~Count[1];
    end
end
always #1000 $display("Count = %0h: \n", Count);
end
always @(posedge Clk) begin
    if (Reset) Count = 0;
    else begin