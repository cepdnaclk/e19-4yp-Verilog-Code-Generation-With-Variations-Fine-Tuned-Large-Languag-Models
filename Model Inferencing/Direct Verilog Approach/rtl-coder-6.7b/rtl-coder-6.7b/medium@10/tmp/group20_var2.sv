module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count [1:0] = Count [1:0] + 2'b01;
        Count [2:3] = Count [2:3];
    end
end
endmodule