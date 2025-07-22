module FA;
    input a, b, cin;
    output cout, s;
    assign cout = a & b;
    assign s = a ^ b ^ cin;
endmodule
module Ripple_Add;
    FA fa0(a[0], b[0], fa1.cout, fa1.s);
    FA fa1(a[1], b[1], fa2.cout, fa2.s);
    FA fa2(a[2], b[2], fa3.cout, fa3.s);
    FA fa3(a[3], b[3], cin, cout, s[3]);
endmodule
### Expected Output:
a[0]
b[0]
fa1.cout
fa1.s
a[1]
b[1]
fa2.cout
fa2.s
a[2]
b[2]
fa3.cout
fa3.s
a[3]
b[3]
cin
cout
s[3]