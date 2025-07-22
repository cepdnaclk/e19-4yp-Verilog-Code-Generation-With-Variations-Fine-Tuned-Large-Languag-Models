module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Error Output:
### Error message:

*** Error: /home/jrthornton/Projects/courses/ECE492/adder_test.v(33): (vsim-3330) Variable "cout" is of wire type and cannot be used as logic in expression.