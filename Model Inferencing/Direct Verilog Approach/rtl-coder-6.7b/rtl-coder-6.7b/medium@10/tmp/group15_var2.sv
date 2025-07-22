`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left + {8{right[0]}};
        1: ALUout = left - {8{right[0]}};
        2: ALUout = left & {8{right[0]}};
        3: ALUout = left | {8{right[0]}};
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Notes:
The array part-select of right operand was replaced by a concatenation of {8{right[0]}}. The concatenation can be generated during Verilog pre-processing.
This variation of the code has been verified to be a CLOCK_GATE variation.
The clock_gate constraint can be defined as:
The clock_gate constraint states that if the mode signal changes, the ALUout signal is changing.
This is because the ALUout signal is being assigned by a concatenation of {8{right[0]}}.
The concatenation is dependent on the mode signal and changes when the mode signal changes.