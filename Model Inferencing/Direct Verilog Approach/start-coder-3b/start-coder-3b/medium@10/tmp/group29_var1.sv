module or(a, b, c);
input a, b, c;
output reg and;
wire or1, and, xor;
or1 <= a||b;
and <= or1 && c;
xor <= a!=b;
and <= or