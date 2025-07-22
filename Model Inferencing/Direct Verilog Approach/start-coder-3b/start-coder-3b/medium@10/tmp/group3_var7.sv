module FA;
    output reg a0, b0, c0;
    input wire a0, b0, c0;
    reg [3:0] a0_in, b0_in;
    reg [3:0] c0_out, a0_out, b0_out;
    wire [3:0] c0_out_reg, a0_out_reg, b0_out_reg;
    assign c0_out_reg[0], a0;
    assign c0_out_reg[1], b0;
    assign a0_out_reg[0], c0;

endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @(*)
        fa0.a0_in <= a0;
        fa0.b0_in <= b0;
    always @(fa0.c0_out_reg, fa0.a0_out_reg[0], fa0.b0_out_reg[0])
        fa1.a0 <= fa0.c0_out_reg;
    always @(fa0.c0_out_reg, fa0.a0_out_reg[0], fa0.b0_out_reg[0])
        fa1.b0 <= fa0.a0_out_reg;
    always @(fa1.c0_out_reg, fa1.a0_out_reg[0], fa1.b0_out_reg[0])
        fa2.a0 <= fa1.c0_out_reg;
    always @(fa1.c0_out_reg, fa1.a0_out_reg[0], fa1.b0_out_reg[0])
        fa2.b0 <= fa1.a0_out_reg;
    always @(fa2.c0_out_reg, fa2.a0_out_reg[0], fa2.b0_out_reg[0])
        fa3.a0 <= fa2.c0_out_reg;
    always @(fa2.c0_out_reg, fa2.a0_out_reg[0], fa2.b0_out_reg[0])
        fa3.b0 <= fa2.a0_out_reg;
endmodule
### Expected Results:
The expected output should be equal to the expected output in the top module of the example design.

## 14-bit Adder (Part Selection)
## Example Verilog Code:
module FA;
    output reg a0, b0, c0;
    input wire a0, b0, c0;
    reg [3:0] a0_in, b0_in;
    reg [3:0] c0_out, a0_out, b0_out;
    wire [3:0] c0_out_reg, a0_out_reg, b0_out_reg;
    assign c0_out_reg[0], a0;
    assign c0_out_reg[1], b0;
    assign a0_out_reg[0], c0;

endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @(*)
        fa