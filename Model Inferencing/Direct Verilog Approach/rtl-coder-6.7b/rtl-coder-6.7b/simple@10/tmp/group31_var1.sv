module func1(x1, x2, x3, f);
input logic x1, x2, x3;
output logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule

### Output(s)
```
Error (10030): Verilog HDL syntax error at testbench.sv(36): Illegal use of operator! in expression: ~x1
Error (10030): Verilog HDL syntax error at testbench.sv(37): Illegal use of operator! in expression: ~x1
Error (10030): Verilog HDL syntax error at testbench.sv(38): Illegal use of operator! in expression: ~x3
Error (10030): Verilog HDL syntax error at testbench.sv(39): Illegal use of operator! in expression: ~x3
Error (10030): Verilog HDL syntax error at testbench.sv(40): Illegal use of operator! in expression: ~x1
Error (10030): Verilog HDL syntax error at testbench.sv(41): Illegal use of operator! in expression: ~x1
Error (10030): Verilog HDL syntax error at testbench.sv(42): Illegal use of operator! in expression: ~x2
Error (10030): Verilog HDL syntax error at testbench.sv(43): Illegal use of operator! in expression: ~x2
Error (10030): Verilog HDL syntax error at testbench.sv(44): Illegal use of operator! in expression: ~x3
Error (10030): Verilog HDL syntax error at testbench.sv(45): Illegal use of operator! in expression: ~x3
Error (10030): Verilog HDL syntax error at testbench.sv(46): Illegal use of operator! in expression: ~x1
Error (10030): Verilog HDL syntax error at testbench