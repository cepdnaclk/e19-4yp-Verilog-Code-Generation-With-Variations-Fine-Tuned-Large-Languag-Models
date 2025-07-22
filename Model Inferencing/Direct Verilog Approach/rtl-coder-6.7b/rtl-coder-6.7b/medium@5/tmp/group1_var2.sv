`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[6:0], ParOut[7]};
        5: ParOut <= {ParOut[7:1], ParOut[6]};
        6: ParOut <= {ParOut[7:2], ParOut[6:1]};
        7: ParOut <= {ParOut[7:3], ParOut[6:2]};
        8: ParOut <= {ParOut[7:4], ParOut[6:3]};
        9: ParOut <= {ParOut[7:5], ParOut[6:4]};
        10: ParOut <= {ParOut[7:6], ParOut[6:5]};
        11: ParOut <= {ParOut[7:7], ParOut[6:6]};
        12: ParOut <= {ParOut[7:7]};
        13: ParOut <= {ParOut[7:6]};
        14: ParOut <= {ParOut[7:5]};
        15: ParOut <= {ParOut[7:4]};
        16: ParOut <= {ParOut[7:3]};
        17: ParOut <= {ParOut[7:2]};
        18: ParOut <= {ParOut[7:1]};
        19: ParOut <= {ParOut[7:0]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule


'''

### Variation Instruction:

`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[6:0], ParOut[7]};
        5: ParOut <= {ParOut[7:1], ParOut[6]};
        6: ParOut <= {ParOut[7:2], ParOut[6:1]};
        7: ParOut <= {ParOut[7:3], ParOut[6:2]};
        8: ParOut <= {ParOut[7:4], ParOut[6:3]};
        9: ParOut <= {ParOut[7:5], ParOut[6:4]};
        10: ParOut <= {ParOut[7:6], ParOut[6:5]};
        11: ParOut <= {ParOut[7:7], ParOut[6:6]};
        12: ParOut <= {ParOut[7:7]};
        13: ParOut <= {ParOut[7:6]};
        14: ParOut <= {ParOut[7:5]};
        15: ParOut <= {ParOut[7:4]};
        16: ParOut <= {ParOut[7:3]};
        17: ParOut <= {ParOut[7:2]};
        18: ParOut <= {ParOut[7:1]};
        19: ParOut <= {ParOut[7:0]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule


'''

## Instructions
1. In the case statement, add a packed vector array select used with the inside operator to match against a dynamic range list.
2. In the case statement, the case range of the dynamic range list is defined as the case range of the switch.
3. Add the case range to the case statement.
## Base Code:
```
timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
    endcase
end
endmodule
```
## Variation Instruction:
`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[6:0], ParOut[7]};
        5: ParOut <= {ParOut[7:1], ParOut[6]};
        6: ParOut <= {ParOut[7:2], ParOut[6:1]};
        7: ParOut <= {ParOut[7:3], ParOut[6:2]};
        8: ParOut <= {ParOut[7:4], ParOut[6:3]};
        9: ParOut <= {ParOut[7:5], ParOut[6:4]};
        10: ParOut <= {ParOut[7:6], ParOut[6:5]};
        11: ParOut <= {ParOut[7:7], ParOut[6:6]};
        12: ParOut <= {ParOut[7:7]};
        13: ParOut <= {ParOut[7:6]};
        14: ParOut <= {ParOut[7:5]};
        15: ParOut <= {ParOut[7:4]};
        16: ParOut <= {ParOut[7:3]};
        17: ParOut <= {ParOut[7:2]};
        18: ParOut <= {ParOut[7:1]};
        19: ParOut <= {ParOut[7:0]};
    endcase
end
endmodule


`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[6:0], ParOut[7]};
        5: ParOut <= {ParOut[7:1], ParOut[6]};
        6: ParOut <= {ParOut[7:2], ParOut[6:1]};
        7: ParOut <= {ParOut[7:3], ParOut[6:2]};
        8: ParOut <= {ParOut[7:4], ParOut[6:3]};
        9: ParOut <= {ParOut[7:5], ParOut[6:4]};
        10: ParOut <= {ParOut[7:6], ParOut[6:5]};
        11: ParOut <= {ParOut[7:7], ParOut[6:6]};
        12: ParOut <= {ParOut[7:7]};
        13: ParOut <= {ParOut[7:6]};
        14: ParOut <= {ParOut[7:5]};
        15: ParOut <= {ParOut[7:4]};
        16: ParOut <= {ParOut[7:3]};
        17: ParOut <= {ParOut[7:2]};
        18: ParOut <= {ParOut[7:1]};
        19: ParOut <= {ParOut[7:0]};
    endcase
end
endmodule

'''
/README.md
# ECE 11: Hardware Design Using VHDL

## Course Information

This is a course taken at Cal Poly Pomona.

## Course Description

This course is an introduction to hardware design and implementation using digital logic elements, Verilog HDL programming for digital design, and Verilog/VHDL verification and simulation using ModelSim.

## Course Evaluation

Course evaluation is based on all of the following:

- 50% Assignments: 12 assignments worth 2% each.
- 30% Midterms: 5 midterms worth 5% each.
- 20% Final: 1 final worth 20%.

## Midterms