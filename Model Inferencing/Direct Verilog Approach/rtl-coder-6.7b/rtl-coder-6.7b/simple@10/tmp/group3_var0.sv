module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Error Messages:
ERROR:HDLCompiler:438 - The module full_adder contains an
inout port. In the port declarations, a port must be declared
as an input or an output.
#####