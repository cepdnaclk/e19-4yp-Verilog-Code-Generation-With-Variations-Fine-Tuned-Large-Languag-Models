`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = {8'd0, left} + {8'd0, right};
        1: ALUout = {8'd0, left} - {8'd0, right};
        2: ALUout = {8'd0, left} & {8'd0, right};
        3: ALUout = {8'd0, left} | {8'd0, right};
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Simulation Result:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1