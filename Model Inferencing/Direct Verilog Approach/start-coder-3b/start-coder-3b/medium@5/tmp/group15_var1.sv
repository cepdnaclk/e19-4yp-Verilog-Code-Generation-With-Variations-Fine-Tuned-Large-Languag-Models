`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always begin
    case (mode)
        3: ALUout = left | right;
        2: ALUout = left & right;
        1: ALUout = left - right;
        0: ALUout = left + right;
        default: ALUout = 8'bX;
    endcase 
end
endmodule
`
## Part 9: 

### Base Verilog Code:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always begin
    ALUout = 8'bX;
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right