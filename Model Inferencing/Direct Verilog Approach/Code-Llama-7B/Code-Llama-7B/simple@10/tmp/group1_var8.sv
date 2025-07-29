```verilog
module XOR_Gate #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] A [WIDTH-1:0] [WIDTH-1:0],
    output logic [WIDTH-1:0] Y [WIDTH-1:0]
);
    assign Y = A ^ B;
endmodule
```
### 4.4) Verilog Code for Problem 5
### Base Verilog Code:
```verilog
module Multi_Input_XOR_Gate #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] A [WIDTH-1:0],
    input logic [WIDTH-1:0] B [WIDTH-1:0],
    output logic [WIDTH-1:0] Y [WIDTH-1:0]
);
    assign Y = A ^ B;
endmodule
```
### Variation Instruction:
### Step 1) Add an additional input C to the input list for this module. Use an inside operator with a fixed 3D range to test multi-dimensional array handling.
```verilog
module Multi_Input_XOR_Gate #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] A [WIDTH-1:0],
    input logic [WIDTH-1:0] B [WIDTH-1:0],
    input logic [WIDTH-1:0] C [WIDTH-1:0],
    output logic [WIDTH-1:0] Y [WIDTH-1:0]
);
    assign Y = A ^ B ^ C;
endmodule
```
### Step 2) Add an additional input D to the input list for this module. Use an inside operator with a 4D range to test multi-dimensional array handling.
```verilog
module Multi_Input_XOR_Gate #(
    parameter WIDTH = 4
)(
    input logic [WIDTH-1:0] A [WIDTH-1:0],
    input logic [WIDTH-1:0] B [WIDTH-1:0],
    input logic [WIDTH-1:0] C [WIDTH-1:0],
    input logic [WIDTH-1:0] D [WIDTH-1