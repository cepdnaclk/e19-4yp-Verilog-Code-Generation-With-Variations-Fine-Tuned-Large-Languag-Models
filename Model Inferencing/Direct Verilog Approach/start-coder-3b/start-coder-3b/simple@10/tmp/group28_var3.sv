module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
wire [3:0] Data3;
assign Sum = Data3 + RegSum;
endmodule
### Results:
<img src="https://github.com/chuanmingtan/Verilog/blob/master/Lab3/lab3_6.PNG"/>
<img src="https://github.com/chuanmingtan/Verilog/blob/master/Lab3/lab3_7.PNG"/>
### Question 2: Why does the signal name of “Sum” change when you change the wire type?
### Answer:
Because the input wire is of type array with unpacked dimension. When wire type changes, the signal name changes as well since wire array signal can be decomposed to several wires.

### Question 3: What kind of constraint are all the wire and reg types in the verilog code?
### Answer:
wire and reg types are regular wires and regs, respectively.

### Question 4: How can you differentiate between a signal having drive strength 0 and a signal having an explicit drive strength?
### Answer:
A signal has drive strength 0 can be implemented with a 2-input nand gate. Otherwise, the signal can be implemented with an n-input nand gate where n is the number of drive strengths that are other than 0.

### Question 5: What happens if you try to connect a signal using the same signal name?
### Answer:
If the signal name collides with another signal, the simulation will output an error.

### Question 6: What can you do to avoid the error when you use the same signal name?
### Answer:
Use the keyword “wire” to prevent the signal name collision that occurs when wire type is used.

### Question 7: When is it possible that a signal has 2 different drive strengths? Explain.
### Answer:
A signal has two different drive strengths when the signal has 2 different wire types. In the verilog code, the signal “Sum” has both a reg type and an wire type. Hence the signal has two different drive strengths.

### Question 8: What is the difference between the implicit and the explicit drive strength? Explain.
### Answer:
When the signal is connected to an output, the simulation uses the explicit drive strength in the verilog code. Otherwise, the implicit drive strength is used.

### Question 9: Is it always possible to have the same signal name for different drive strengths?
### Answer:
No.

### Question 10: How do you check that the output you are trying to connect to is of the correct drive strength?
### Answer:
Connect the output wire to the input wire and check if it goes through the simulation.

### Question 11: What does the wire type do?
### Answer:
The wire type is an alias for a signal.

### Question 12: What is the difference between a wire and a reg?
### Answer:
A wire can be used and assigned to like a regular wire. A reg can only be assigned once during the simulation.

### Question 13: Why is it a good idea to use the wire type?
### Answer:
Using the wire type preserves the signal name which improves readability.

### Question 14: How many registers do you need to simulate the following code?
### Answer:
3 registers.

### Question 15: What is the purpose of the input wire type?
### Answer:
The input wire type is an alias for an input.

### Question 16: When do you use the input wire type? What is the difference from using standard inputs?
### Answer:
When you are connecting the input as the signal, use input wire type. The difference between the standard input and the input wire type is that the standard input can be connected to a signal (the standard input can be a wire).

### Question 17: Describe the purpose of the output wire type?
### Answer:
The output wire type is an alias for an output.

### Question 18: Explain why you should not use the output wire type.
### Answer:
A signal cannot be assigned to an output wire type because the output wire type is an alias for an output.

### Question 19: How can you convert a wire to a reg?
### Answer:
Assign the wire to a reg.

### Question 20: How can you convert a reg to a wire?
### Answer:
Assign the reg to a wire.

### Question 21: What is the purpose of the wire array type?
### Answer:
The wire array type is an alias for a wire array.

### Question 22: Why is it not allowed to use wire array types for storage elements?
### Answer:
Wire array types can only be used for drivers and the assignment of the reg.

### Question 23: Explain why the following code is not well-formed:
module wrong_clock(clk, rst);
input clk, rst;
endmodule
### Answer:
A driver is used on a clock signal, which is not well-formed.

### Question 24: How can you fix the above error?
### Answer:
An array of the clock should be used.

### Question 25: What is the purpose of the assign statement?
### Answer:
The assign statement assigns one expression to another expression.

### Question 26: What is the difference between a parameter and an input? Explain.
### Answer:
A parameter is used to pass the input values to a module. An input is used to connect to the module.

### Question 27: How can you declare a parameter? What are the different types of parameters?
### Answer:
The parameter can be declared by using “parameter” keyword. Different types of parameters are “localparam” for constant parameters, “parameter” for module parameters, “localparam [type]” for type-casted constant parameters, and “localparam [type] [range]” for range-casted constant parameters.

### Question 28: How can you declare a local parameter? What are the different types of parameters?
### Answer:
The local parameter can be declared by using “localparam” keyword. Different types of parameters are “localparam” for constant parameters, “localparam [type]” for type-casted constant parameters, and “localparam [type] [range]” for range-casted constant parameters.

### Question 29: How is the parameter name and the local parameter name different?
### Answer:
The parameter name is the name of the parameter and the local parameter name is the name of the module.

### Question 30: What is the difference between a parameter and a local parameter? Explain.
### Answer:
A parameter is used to pass the input values to a module. A local parameter is used to pass the input values to a module and is local to the module.

### Question 31: What is a differentiator between a parameter and a local parameter?
### Answer:
A parameter is a port. A local parameter is not a port.

### Question 32: How can you define a range-casted parameter?
### Answer:
Use square brackets around the range for the parameter.

### Question 33: How can you define a type-casted parameter?
### Answer:
Use square brackets around the type for the parameter.

### Question 34: What is the difference between a parameter and an input?
### Answer:
A parameter is used to pass the input values to a module. An input is used to connect to the module.

### Question 35: How can you define a range-casted parameter with a constant value?
### Answer:
Use the range “n : 0” where n is the number of bits of the range-casted parameter.

### Question 36: How can you define a type-casted parameter with a constant value?
### Answer:
Use a range of “:” for the type-casted parameter.

### Question 37: How can you define a range-casted parameter with a variable that has a value? Explain.
### Answer:
Use the range “n : $c$” where n is the number of bits of the range-casted parameter.

### Question 38: How can you define a variable that is of a range-casted type? Explain.
### Answer:
Use the range “:” for the type-casted parameter.

### Question 39: How can you define a variable that is of a type-casted type? Explain.
### Answer:
Use the range “n : $c$” where n is the number of bits of the range-casted parameter.

### Question 40: Explain why the following code is not well-formed:
parameter [3:0] MAX = 8;
module wrong_range(a, b);
input a, b;