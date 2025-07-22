module full_adder(input i1, i2, input cin, output logic sum, output cout);
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Result: Verilog code failed static checking.