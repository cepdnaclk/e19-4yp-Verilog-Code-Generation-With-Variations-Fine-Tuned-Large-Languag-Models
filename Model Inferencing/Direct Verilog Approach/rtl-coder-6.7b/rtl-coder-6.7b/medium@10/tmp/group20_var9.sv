module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count[3] <= Count[2];
        Count[2] <= Count[1];
        Count[1] <= Count[0];
        Count[0] <= ~Count[0];
        if(Count[0]) begin
            Count[3] <= 0;
            Count[2] <= 0;
            Count[1] <= 0;
            Count[0] <= 1;
        end
    end
end
endmodule
### Variation Instruction: