module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

struct data {
rand bit rand_data;
} data_in;

endmodule

## 5.6.5. Verilog Testbench¶

The testbench tests the behavior of a module (or a sub-module) with the input signals given. The testbench must match the module input/output signals exactly; otherwise, the testbench will not be able to check the correctness of the module. The testbench is executed using the vsim command.

### Verilog Testbench Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule
### Testbench Code:
module TB_DataComp (CLK, DataIn, DataOut, ControlSignals);
reg CLK = 0;
reg [7:0] DataIn;
reg [7:0] DataOut;
reg ControlSignals;
reg done = 0;

initial begin
#10 CLK = 1;
#10 CLK = 0;
#10 done = 1;
#10 CLK = 0;
#10 CLK = 1;
#10 DataIn = 56;
#10 ControlSignals = 1;
#10 DataOut = 0;
end

always #10 CLK = ~CLK;

endmodule

### Simulation Run Command:
> vsim TB_DataComp

## 5.6.6. Procedural Simulation¶

A procedural simulation is a program that takes an initial state as input and prints the state of the system after the defined number of time steps.

### Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg done = 0;

always begin
if (ControlSignals == 1) begin
data = DataIn;
done = 1;
end
end
always @(posedge clk) begin
DataOut <= data;
end

endmodule

### Simulation Command:
>./procedural 10000 56
### Input:
0 1 0 0 0 0 0 0
### Output:
56 56 56 56 56 56 56 56

## 5.6.7. Parameterized Simulation¶

Simulate the component with 10,000 time steps and the input of 56.

### Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg done = 0;

always begin
if (ControlSignals == 1) begin
data = DataIn;
done = 1;
end
end
always @(posedge clk) begin
DataOut <= data;
end

endmodule

### Simulation Command:
>./procedural 10000 56 50
### Input:
0 1 0 0 0 0 0 0
### Output:
56 56 56 56 56 56 56 56

## 5.6.8. Behavioral Simulation¶

Behavioral simulation is the simulation within a single time step. The simulation time step is determined by the simulation speed (in ns)

### Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg done = 0;

always begin
if (ControlSignals == 1) begin
data = DataIn;
done = 1;
end
end
always @(posedge clk) begin
DataOut <= data;
end

endmodule

### Simulation Command:
>./procedural 1 0 100
### Input:
0 1 0 0 0 0 0 0
### Output:
0 0 0 0 0 0 0 0

## 5.6.9. Modelsim Simulation¶

### Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg done = 0;

always begin
if (ControlSignals == 1) begin
data = DataIn;
done = 1;
end
end
always @(posedge clk) begin
DataOut <= data;
end

endmodule
### Verilog Testbench Code:
module TB_DataComp (CLK, DataIn, DataOut, ControlSignals);
reg CLK = 0;
reg [7:0] DataIn;
reg [7:0] DataOut;
reg ControlSignals;
reg done = 0;

initial begin
#10 CLK = 1;
#10 CLK = 0;
#10 done = 1;
#10 CLK = 0;
#10 CLK = 1;
#10 DataIn = 56;
#10 ControlSignals = 1;
#10 DataOut = 0;
end

always #10 CLK = ~CLK;

endmodule
### Modelsim Simulation Command:
> vsim -c TB_DataComp

## 5.7. Testing Components¶

### 5.7.1. Functional Testing:¶

Functional testing is the process of validating the output produced from a component against the expected output.

Functional testing is a type of testing in which a program is used to test the output of a system during the normal operation of the system. The most common form of functional testing is to simulate the program.

For example:

• An LED is connected to a GPIO pin and the GPIO pin is connected to the input of a 7-segment display.

• The GPIO pin is set to 1 and the 7-segment display is expected to display the number 7.

To perform functional testing, the component is simulated with the correct input signals and the outputs are compared against the expected outputs.

## 5.7.1.1. Functional Testing¶

### 5.7.1.1.1. Functional Testing Example:¶

Functional testing for the 7-segment display is performed with the following test cases:

Input Expected Output
1 1
9 9
11 1
12 2
14 4
16 6
18 8


### 5.7.1.1.2. Testing the 7-segment Display in Verilog¶

### Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg done = 0;

always begin
if (ControlSignals == 1) begin
data = DataIn;
done = 1;
end
end
always @(posedge clk) begin
DataOut <= data;
end

endmodule
### Testbench Code:
module TB_DataComp (CLK, DataIn, DataOut, ControlSignals);
reg CLK = 0;
reg [7:0] DataIn;
reg [7:0] DataOut;
reg ControlSignals;
reg done = 0;

initial begin
#10 CLK = 1;
#10 CLK = 0;
#10 done = 1;
#10 CLK = 0;
#10 CLK = 1;
#10 DataIn = 56;
#10 ControlSignals = 1;
#10 DataOut = 0;
end

always #10 CLK = ~CLK;

endmodule
### Simulation Command:
> vsim -c TB_DataComp

## 5.7.1.2. Functional Testing¶

### 5.7.1.2.1. Functional Testing Example:¶

A test for the 7-segment display is created. The component is simulated with different data and control signals to see which configuration produces the expected output.

### Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

reg [7:0] data;
reg