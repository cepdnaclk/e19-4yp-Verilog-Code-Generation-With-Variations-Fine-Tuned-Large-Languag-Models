`define IOS "input Clk, Reset, input [3:0] Enable, output [3:0] Count"
module Counter #(parameter DATA_WIDTH = 4) (
`IOS
);
    reg [3:0] Count;
    always @(posedge Clk) begin
        if(Reset) Count = 0;
        else Count = Count + Enable;
    end
    final begin : count_final
       Count[2:0] = Count[2:0] + 1;