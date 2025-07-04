module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        Count[1] = Count[1];
    end
end
endmodule
### Modified Instruction:
Use the bit-select operator in a procedural assignment to directly access a