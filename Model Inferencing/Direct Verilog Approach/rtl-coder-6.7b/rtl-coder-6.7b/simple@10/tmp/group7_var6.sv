module AndOr (output X, Y, bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Output:
X = 001  Y = 001
X = 110  Y = 011
X = 001  Y = 011
### Explanation:
The SystemVerilog bit type is a 1-bit signed integer with a range of -2**(w-1) to 2**(w-1)-1. It is used to model logic signals with a single bit of information (i.e., high or low).
SystemVerilog also supports the unsigned bit type, which is a 1-bit unsigned integer with a range of 0 to 2**w-1.
If you need a 1-bit unsigned integer that can take on the value X’bz, where z is an arbitrary bit, then you should use the logic type.
The bit type in SystemVerilog is similar to the Verilog bit type, which is a 1-bit signed integer with a range of -2147483648 to 2147483647. The bit type in SystemVerilog is a 1-bit signed integer that can only take on the values 1 or 0.
The bit type in SystemVerilog is a 1-bit signed integer that can only take on the values 1 or 0.