`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
    ALUout = ALUout[7:0];
end
endmodule
`
<br/>
### Differences:
1. The result of `ALUout` is now an 8-bit variable as expected by the design.
2. The `==` operator between the 8-bit variable and 8-bits `right` operand has been removed.
3. The `ALUout` variable is a 8-bit variable.
4. The part-select operator is used to get the 8-bits of result and assign it to `ALUout` variable.
5. This version works fine.
<br/>
<br/>

### References:
[1],. "Computer Organization and Design: The Hardware/Software Interface. 9th Ed. New York: Wiley, 2006."
/L02_D_MUX8/readme.md
# 2-output D-Type Multiplexer

## Problem Statement
Develop a two-output D-type multiplexer that multiplies its inputs, and uses the 4-to-1 multiplexer as its component.

An a.
```
`timescale 1ns/100ps
module MUX4_8 (input [3:0] I, input [1:0] S, output [3:0] O);
assign O = I[3:0] * 4'bX[3:S];
endmodule
```
This code is the exact same with previous question, but uses S in the D-Type Multiplexer.

## 2-output D-Type Multiplexer
This is the main question, which was provided in the lab handout.
```
`timescale 1ns/100ps
module MUX8 (input [7:0] I, input [3:0] S, output reg [7:0] O);
reg [3:0] OH, OL;
MUX4_8 M1 (I[3:0], S[1:0], OH);
MUX4_8 M2 (I[7:4], S[1:0], OL);
always @* begin
    O = {OH, OL};
end
endmodule
```
example of a D-type multiplexer is shown in Fig. 3.12.

The D-type multiplexer has four inputs: two multiplicand inputs, 𝑆0, and 𝑆1, which are connected to the select line, and two inputs, 𝑉0, and 𝑉1, which are connected to the data line. The output of the D-type multiplexer, Y, is determined by the value of 𝑆, which has two possible values, 0 and 1.

When the select input, 𝑆, is 0, the data inputs, 𝑉0, and 𝑉1, are connected to the output. When 𝑆 is 1, the data inputs are connected to the output.

![alt text](DType_Multiplexer.png "Mux Diagram")

## 4-to-1 Multiplexer
The 4-to-1 multiplexer was provided to us in the start of the lab exercise, so I will not add any additional code. The code is given below:
```
`timescale 1ns/100ps
module MUX4_1 (input [3:0] I, input S, output O);
assign O = S? I[1] : I[0];
endmodule
```
The code above will return the first input when the select input is high, the second input when the select input is low. We can get the value of the first input as
`MUX4_1 M1 (I[3:0], S[0], O[0]);`
and the value of the second input as
`MUX4_1 M2 (I[3:0], S[0], O[1]);`

## 4-to-8 Multiplexer
Next, we add another module called `MUX4_8` to create a 4-to-8 multiplexor. We need the same four inputs as in the previous module. The only difference is the output, which needs to be re-indexed so that we can get the values for the first 4 outputs. We also need to use the `==` operator to return the correct value of the select input.

Since the multiplexor is a D-Type multiplexer, the code for the multiplexor is as below.
```
`timescale 1ns/100ps
module MUX4_8 (input [3:0] I, input [1:0] S, output reg [7:0] O);
reg [3:0] OH, OL;
MUX4_1 M1 (I[3:0], S, OH);
MUX4_1 M2 (I[3:0],!S, OL);
always @* begin
    O = OH[1:0]!= OL[1:0]? OH!= 4'b1111 : OH[1:0];
end
endmodule
```
The code above will return the first input when the select input is high (1), the second input when the select input is low (0), and the third input as 1111 when the select input is high and low.

## 4-to-32 Multiplexer
Finally, we add another module called `MUX4_32` to create a 4-to-32 multiplexor. We need the same four inputs as in the previous 2 modules. The only difference is the output, which needs to be re-indexed so that we can get the values for the first 32 outputs. The only difference is the output, which needs to be re-indexed so that we can get the values for the first 32 outputs. We also need to use the `==` operator to return the correct value of the select input.
```
`timescale 1ns/100ps
module MUX4_32 (input [3:0] I, input [4:0] S, output [31:0] O);
reg [3:0] OH, OL, OM;
MUX4_8 M1 (I[3:0], S[3:0], OH);
MUX4_8 M2 (I[3:0], S[4:3], OL);
MUX4_1 M3 (I[3:0], OH[1:0] == OL[1:0]? OH[0] : OH[1], OM);
always @* begin
    O = {OM[0], OH[0] == OL[0]? OL[1:0] : OH[0], OH[1:0] == OL[1:0]? OL[0] : OH[1], OL[1:0]};
end
endmodule
```
The code above will return the first input when the select input is high (1), the second input when the select input is low (0), and the third input as 1111 when the select input is high and low.

## Verilog Code
```
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
reg [31:0] ALUout;
MUX4_32 M1 (left, mode, ALUout);
endmodule
```
This code requires the additional module.
```
`timescale 1ns/100ps
module MUX4_8 (input [3:0] I, input [1:0] S, output reg [7:0] O);
reg [3:0] OH, OL;
MUX4_1 M1 (I[3:0], S, OH);
MUX4_1 M2 (I[3:0],!S, OL);
always @* begin
    O = OH[1:0]!= OL[1:0]? OH!= 4'b1111 : OH[1:0];
end
endmodule
```
This code is the exact same with the previous code, but it uses the `==` operator to return the correct result.
```
`timescale 1ns/100ps
module MUX4_1 (input [3:0] I, input S, output O);
assign