`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Run and Results:
[sim]./ALU8 
ALUout[0] = 0b01010011 
ALUout[1] = 0b01010011 
ALUout[2] = 0b00110011 
ALUout[3] = 0b10100011 
ALUout[4] = 0b11111111 
ALUout[5] = 0b00000000 
ALUout[6] = 0b00000000 
ALUout[7] = 0b00000000 
Done in 889.045ns on PSIM

```
Upvotes: 1