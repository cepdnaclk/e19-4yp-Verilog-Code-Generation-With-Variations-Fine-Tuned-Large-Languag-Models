module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Expected Simulation Result:
ERROR:HDLCompiler:574 - "design/full_adder.v" Line 7:
Output type 'logic' cannot be assigned to an output port whose type is 'wire'.