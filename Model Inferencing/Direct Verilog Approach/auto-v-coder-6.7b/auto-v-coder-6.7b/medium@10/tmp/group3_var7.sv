```verilog
module FA;
    input a;
    input b;
    input cin;
    output reg s;
    output reg cout;

    always @(a or b or cin) begin
        s = a ^ b ^ cin;
        cout = (a & b) | (a & cin) | (b & cin);
    end
endmodule

module Ripple_Add;
    input [3:0] a;
    input [3:0] b;
    input cin;
    output [3:0] sum;
    output cout;

    FA fa0(.a(a[0]),.b(b[0]),.cin(cin),.s(sum[0]),.cout(cout));
    FA fa1(.a(a[1]),.b(b[1]),.cin(cout),.s(sum[1]),.cout(cout));
    FA fa2(.a(a[2]),.b(b[2]),.cin(cout),.s(sum[2]),.cout(cout));
    FA fa3(.a(a[3]),.b(b[3]),.cin(cout),.s(sum[3]),.cout(cout));
endmodule
```
This example defines a full adder (FA) and a 4-bit ripple adder (Ripple_Add). The part-select expression of the input in the Ripple_Add verilog module, `a[{i}]` and `b[{i}]`, generates the 4-bit result of a 4-bit adder. The `cout` in the full adder (FA) module shows the carry-out of a full bit adder.

This code will help verify the functionality of a full adder and a 4-bit ripple adder under the condition of each bit. The results can be compared with the expected results to ensure the code is doing what it is supposed to do.

Remember that a full adder adds two bits and a carry. In a 4-bit ripple adder, each full adder connects to the full adder immediately above it in the "pipeline" (or chain