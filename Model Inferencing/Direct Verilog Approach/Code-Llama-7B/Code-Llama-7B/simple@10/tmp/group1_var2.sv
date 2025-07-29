```
module mux_3to1(input s,
                input [2:0] [0:1] A,
                output [2:0] out);
    assign out = s? A[1] : (s? A[0] : A[2]);
endmodule
```

### Original Problem (Problem 6)
### Base Verilog Code:
// Problem 6
// Verilog code for Problem 6
module mux_4to1(input s,
                input [2:0] in1,
                input [2:0] in2,
                input [2:0] in3,
                input [2:0] in4,
                output [2:0] out);
    assign out = s? in4 : (s? in3 : (s? in2 : in1));
endmodule
### Variation Instruction:
Modify the inputs in1, in2, in3, and in4 to be elements of a packed 4D logic-vector array (e.g., logic [1:0] A [0:0] [0:1] [0:2]).