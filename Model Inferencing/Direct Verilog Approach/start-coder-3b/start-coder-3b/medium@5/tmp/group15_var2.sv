`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    ALUout = left[7:0] + right[7:0]; // operand is replaced with left[7:0]
    assign ALUout = left[7:0] + right[7:0]; // result is replaced with left[7:0]
end
endmodule
### Verilog simulation:
1:![alt text](https://github.com/HenryH13/VHDL2Verilog/blob/main/ScreenShots/ALU8_14.JPG)
2:![alt text](https://github.com/H