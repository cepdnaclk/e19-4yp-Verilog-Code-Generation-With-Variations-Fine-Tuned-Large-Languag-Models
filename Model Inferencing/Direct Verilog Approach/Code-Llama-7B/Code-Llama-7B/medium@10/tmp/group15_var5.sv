`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always @* begin
    case (mode)
        0: ALUout = left[3:0] + right[3:0];
        1: ALUout = left[7:4] - right[7:4];
        2: ALUout = left[7:4] & right[3:0];
        3: ALUout = left[3:0] | right[7:4];
        default: ALUout = 8'bX;
    endcase
end
endmodule

### Observations:
- Passed simulation.
### Result: 3/3


### Case Study 4
### Base Verilog Code:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always @(left, right, mode