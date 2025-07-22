```verilog
module mux4_1_0(in1, in2, in3, in4, sel, out);
    input in1,in2,in3,in4;
    input [1:0] sel;
    output out;
    assign out = {in1[sel==0],in2[sel==0],in3[sel==0],in4[sel==0]};
endmodule
```
#### Final Result:
![Image of final result][Image7]
Verilog compiled correctly, and results were correct as well.

## Sources
- [Module Instantiation](https://www.fpga4fun.com/verilog-inst.html)
- [Verilog 8.8.1 Reference Manual](https://www.ece.uwaterloo.ca/~aplevich/Verilog-Ref.pdf)
- [Verilog Code Tutorial](https://www.tutorialspoint.com/verilog/index.htm)
- [Verilog Programming](https://www.nandland.com/verilog/verilog-programming.html)
- [Verilog Variables](https://www.nandland.com/verilog/verilog-variables.html)
- [Verilog Assignments](https://www.nandland.com/verilog/verilog-assignments.html)
- [Verilog Operators](https://www.nandland.com/verilog/verilog-operators.html)
- [Verilog Conditionals](https://www.nandland.com/verilog/verilog-conditionals.html)
- [Verilog Functions](https://www.nandland.com/verilog/verilog-functions.html)
- [Verilog Procedures](https://www.nandland.com/verilog/verilog-procedures.html)
- [Verilog Arrays](https://www.nandland.com/verilog/verilog-arrays.html)
- [Verilog Slices and Packing](https://www.nandland.com/verilog/verilog-slices-and-packing.html)
- [Verilog Inside out](https://www.nandland.com/verilog/verilog-inside-out.html)
- [Verilog Data Types](https://www.nandland.com/verilog/verilog-data-types.html)
- [Verilog Signals and Registers](https://www.nandland.com/verilog/verilog-signals-and-registers.html)
- [Verilog Wires](https://www.nandland.com/verilog/verilog-wires.html)
- [Verilog Modules](https://www.nandland.com/verilog/verilog-modules.html)
- [Verilog Constants](https://www.nandland.com/verilog/verilog-constants.html)
- [Verilog Parameters and Specs](https://www.nandland.com/verilog/verilog-parameters-and-specs.html)
- [Verilog Generate](https://www.nandland.com/verilog/verilog-generate.html)
- [Verilog Primitive Gate-Level Description](https://www.nandland.com/verilog/verilog-primitive-gate-level-description.html)
- [Verilog Primitive Gate-Level Description](https://www.nandland.com/verilog/verilog-primitive-gate-level-description.html)
- [Verilog Primitive Gate-Level Description](https://www.nandland.com/verilog/verilog-primitive-gate-level-description.html)
- [Verilog Primitive Gate-Level Description](https://www.nandland.com/verilog/verilog-primitive-gate-level-