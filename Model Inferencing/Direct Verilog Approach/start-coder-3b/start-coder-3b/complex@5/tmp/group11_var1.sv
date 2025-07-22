module ttst_ttrimux2_1(); // Assuming this tests a tristate 2-to-1 mux called ttrimux2_1
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
reg s;
wire out; // Added wire declaration
// ttrimux2_1 mm(out,e,i,s); // Instantiation requires correct MUX definition
initial
begin
e =0; i = 2'b00; s = 1'b0; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
endmodule

## Variation Instruction:
Wrap the tristate multiplexer testbench inside a generate block and use `inside` operator on `s` with escaped generate name.

## Restricted Verilog Code:
Code for the tristate 2-to-1 mux (ttrimux2_1):

```verilog
module ttrimux2_1(
output out,
input enable,
input i,
input s
);
reg [1:0]sel;
initial
begin
sel = 2'b00;
end
assign out = {s[1:0],sel[1:0]}[i];
always @(posedge enable)
begin
sel = {i,s}[1:0];
end
endmodule
```
## Final Verilog Code:
```verilog
module ttst_ttrimux2_1(); // Assuming this tests a tristate 2-to-1 mux called ttrimux2_1
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
reg s;
wire out; // Added wire declaration
// ttrimux2_1 mm(out,e,i,s); // Instantiation requires correct MUX definition
initial
begin
e =0; i = 2'b00; s = 1'b0; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
endmodule
```

## Verilog Simulation Results:

![image](https://user-images.githubusercontent.com/45302426/116784159-20eb0400-aa8f-11eb-8781-497f1e76b335.png)






## Summary:

### Problem 1:

We have used a simple tristate logic implementation in the verilog code for the tristate 2-to-1 mux (ttrimux2_1). The problem with the existing verilog code is that it is not able to handle the tristate control signals correctly. For the mux to be tristate, we should be able to assign the tristate states to the outputs of the `ttrimux2_1` module at all possible states of the control signals. This is particularly important for the module to be used in an asynchronous manner. The existing module has an instantiation error because of unmatching number and type of control signals. We should be able to change the module to pass the correct control signals.

To handle the control signals, we have used the `genvar` statement and the `foreach` loop to iterate through the control signals and assign the tristate states. We also have used the `always` block to handle the assignment of the tristate states for the control signals in an asynchronous manner. The `genvar` statement creates a new type of variable called a `genvar`, which can be assigned any value and is useful for dealing with arrays of different sizes or types. The `foreach` loop iterates over a range of values specified within curly braces, which can be of any type. The genvar statement is useful for creating variables with multiple types and sizes.

The `genvar` statement helps us create a new type of variable that can be assigned any value and can be used for dealing with arrays of different sizes or types. The `foreach` loop iterates over a range of values, which can be of any type, and assigns the tristate states for the control signals in an asynchronous manner.

### Problem 2:
Our verilog code is a testbench for the tristate 2-to-1 mux (ttrimux2_1). The tristate 2-to-1 mux is a combinational logic device that takes 3 inputs and returns 2 outputs. It can be used to implement tristate logic, where the control inputs are either high-impedance (HIZ) or tristate. The tristate 2-to-1 mux can be used in a wide range of applications, such as in logic synthesis, signal processing, etc. We have used the `always@(posedge)` statement in the `ttst_ttrimux2_1` module to handle the asynchronous assignment of the tristate states for the control signals. This statement ensures that the tristate states are updated at the positive edge of the clock signal.

We have used the `initial` block to declare the initial values for the control signals. We have also used the `initial` block to declare the initial values for the control signals. We have also used the `initial` block to declare the initial values for the control signals. These initial values are used for initializing the state of the control signals at the start of the simulation.

We have used the `$monitor` statement to print out the values of the control signals and the tristate outputs. The `$monitor` statement allows us to monitor the values of the signals and print them out during the simulation. This helps analyze the behavior of the circuit and identify any issues.

We have used the `$stop` statement at the end of the code. This statement stops the simulation and exits the program. It ensures that the simulation runs until it reaches this line. This helps ensure that the simulation finishes properly.

## Variation Instruction:

## Restricted Verilog Code:

Code for the tristate 2-to-1 mux (ttrimux2_1):

```verilog
module ttrimux2_1(
output out,
input enable,
input i,
input s
);
reg [1:0]sel;
initial
begin
sel = 2'b00;
end
assign out = {s[1:0],sel[1:0]}[i];
always @(posedge enable)
begin
sel = {i,s}[1:0];
end
endmodule
```

## Final Verilog Code:

```verilog
module ttst_ttrimux2_1(); // Assuming this tests a tristate 2-to-1 mux called ttrimux2_1
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
reg s;
wire out; // Added wire declaration
// ttrimux2_1 mm(out,e,i,s); // Instantiation requires correct MUX definition
initial
begin
e =0; i = 2'b00; s = 1'b0; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
endmodule
```

## Verilog Simulation Results:

![image](https://user-images.githubusercontent.com/45302426/116784159-20eb0400-aa8f-11eb-8781-497f1e76b335.png)
/Project_3/README.md
# Project_3:

## Problem Statement:

Design a circuit that has an input, a clock, a reset line, and a two-bit counter. The counter should count up from zero to 7. The counter should count continuously from zero to 7 and restart after it reaches 7. It should work as follows:

* On reset the counter should be set to zero. On rising clock edge, the counter's value should be incremented by 1. If the counter reaches number 7, it should reset.
* The output of the counter should be passed through a multiplexer. An enable input to the multiplexer should be connected to a clock. The multiplexer should select between the counter's output and a reset value. If the enable input is not high, the counter's output should be passed through.