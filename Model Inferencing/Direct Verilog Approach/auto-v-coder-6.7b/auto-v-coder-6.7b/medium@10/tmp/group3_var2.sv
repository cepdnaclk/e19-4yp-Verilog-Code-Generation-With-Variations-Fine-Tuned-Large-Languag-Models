```verilog
module FA;
    input a;
    input b;
    input cin;
    output s;
    output cout;
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module Ripple_Add;
    input [3:0] a;
    input [3:0] b;
    input cin;
    output [3:0] s;
    output cout;
    
    wire [3:0] c;
    FA fa0(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.cout(c[0]));
    FA fa1(.a(a[1]),.b(b[1]),.cin(c[0]),.s(s[1]),.cout(c[1]));
    FA fa2(.a(a[2]),.b(b[2]),.cin(c[1]),.s(s[2]),.cout(c[2]));
    FA fa3(.a(a[3]),.b(b[3]),.cin(c[2]),.s(s[3]),.cout(cout));
endmodule
```
This code adds the fulladder module to the Ripple_add module and connects the carry output of one full adder to the carry input of the next. The final carry output is assigned to the cin of the next full adder. The couts of all full adders are then assigned to the c array. This serves to pass the carry bits from one full adder to the next. The output cout of the last full adder is then connected to the cout of the Ripple_add module.

Inside the always block you can use test by changing a, b, and cin values to observe the operation of the full adder and the ripple carry adder.

```verilog
always @(a, b, cin) begin
    #1;
    a = 4'b0001;
    b = 4'b0010;
    cin = 0;
    #1;