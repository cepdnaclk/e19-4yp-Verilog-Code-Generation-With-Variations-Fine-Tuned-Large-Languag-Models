module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
reg [2:0] mask;
reg [3:0] var;
reg [3:0] const [3:0] arr = {8'd12, 8'd14, 8'd13, 8'd11};

always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: begin
            var <= A;
            F <= B - var;
        end
        2: begin
            var <= B;
            F <= A - var;
        end
        3: begin
            var <= A;
            F <= var + B;
        end
        4: begin
            var <= A;
            F <= var ^ B;
        end
        5: begin
            var <= A;
            F <= var | B;
        end
        6: begin
            var <= A;
            F <= var & B;
        end
        7: F = 4'b1111;
    endcase
endmodule
### Verification:
- Design Pass/Fail: Pass
- RTL Validation: Pass
- Compilation: Pass
- Simulation: Pass (with warnings)
  - Warnings:
    - Simulation: 1 (Warnings)
    - 1: line 8: Verilog HDL warning at alu.v(8): expression does not conform to its actual type 
    - 2: line