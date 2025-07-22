module FA;
    input a;
    input b;
    input cin;
    output c_out;
    output s;
    assign c_out = a & b | a & cin | b & cin;
    assign s = a ^ b ^ cin;
endmodule

module Ripple_Add;
    input [3:0] a;
    input [3:0] b;
    input cin;
    output [3:0] s;
    output cout;
    wire [3:0] carry = {fa1.s, fa2.s, fa3.s, fa0.s};
    assign s = a + b + cin;
    assign cout = fa3.c_out;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    assign fa0.a = a[0];
    assign fa0.b = b[0];
    assign fa0.cin = cin;
    assign fa1.a = a[1];
    assign fa1.b = b[1];
    assign fa1.cin = carry[0];
    assign fa2.a = a[2];
    assign fa2.b = b[2];
    assign fa2.cin = carry[1];
    assign fa3.a = a[3];
    assign fa3.b = b[3];
    assign fa3.cin = carry[2];
endmodule

### Variation Instruction:
Here, the test code will connect a 4-bit adder to an input of 4-bit.
### Test Code:
`module tb_Ripple_Add;
    input [3:0] in1;
    input [3:0] in2;
    input ci;
    output [3:0] sum;
    output co;
    
    Ripple_Add ripple_adder(in1, in2, ci, sum, co);
    
    initial begin
        $dumpfile("tb_Ripple_Add.vcd");
        $dumpvars(0, tb_Ripple_Add);
        in1 = 4'b0100;
        in2 = 4'b10