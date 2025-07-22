module tst_xnorr1; //testbench
reg i1,i2;
wire o; // Added wire declaration
xnorr1 xx(i1,i2,o);
initial
begin
i1=1; i2=1; // Drv1=high, Drv2=high -> o = low (xnor rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
### Test:
i1 = 1111b
i2 = 1111b
o  = 0000b

# 3.0. How to generate this code?

The following are two examples in Python to generate this document from a table of test patterns.

## 3.1. Generate all the variations of a single test pattern

The following script generates all the variations for one test pattern i.e. a Verilog module for testing the behaviour of an arithmetic operator using several test drivers.

## 3.2. Generate all the variations for each of the test pattern

The following script generates all the variations for each of the test patterns. The output will be placed into separate Verilog modules.

# 4.0. Known Issues and Limitations

• The script will probably fail to create a Verilog module for a test pattern if it contains any of the following:
1. Any verbatim literals (i.e. "0", "1", "x", "X", "...")
2. Verilog keywords (i.e. "function", "module", "output", "reg