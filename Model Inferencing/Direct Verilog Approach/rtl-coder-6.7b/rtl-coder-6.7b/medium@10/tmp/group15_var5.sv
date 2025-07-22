`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Output:
```
Error (10170): VERILOG HDL: Illegal indexed lvalue in port/variable definition for 'ALUout'.
Error (10417): VERILOG HDL: Illegal variable assignment to non-variable LHS 8'bX in case statement.
Error (10619): VERILOG HDL: Non-constant index in port/variable definition for 'ALUout'.
Error (10687): VERILOG HDL: Non-constant operand in port/variable definition for 'ALUout'.
Error (10709): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10725): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10741): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10757): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10773): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10789): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10805): VERILOG HDL: Illegal case statement control expression in port/variable definition for 'ALUout'.
Error (10821): VERILOG HDL: Illegal case statement control expression in port/variable definition