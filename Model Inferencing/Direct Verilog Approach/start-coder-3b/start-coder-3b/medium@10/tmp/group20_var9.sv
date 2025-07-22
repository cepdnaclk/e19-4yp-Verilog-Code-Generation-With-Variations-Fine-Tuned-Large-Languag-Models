module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        case(Count)
            4'b1111: Count <= 4'b0000;
            default: Count <= Count + 1;
        endcase
    end
end
endmodule
### Verilog Source Code:
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        case(Count)
            4'b1111: Count <= 4'b0000;
            default: