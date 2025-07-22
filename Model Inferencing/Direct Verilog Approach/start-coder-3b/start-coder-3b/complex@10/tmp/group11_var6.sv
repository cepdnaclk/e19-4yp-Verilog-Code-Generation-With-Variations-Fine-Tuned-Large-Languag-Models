```
generate
begin
ttst_ttrimux2_1
generate
end generate
```

> Output:
![ttst_ttrimux2_1_1.png](ttst_ttrimux2_1_1.png)
![ttst_ttrimux2_1_2.png](ttst_ttrimux2_1_2.png)

# 16.7.11 Timing Controlled Test with Random Inputs

### Base Verilog Code:
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
### Variation Instruction:
Remove the first 2 initial blocks from the testbench and add the following code inside the generate block:
```
initial
begin
e =rand_range(0,1); i = rand_range(0,3); s = rand_range(0,1);
end
```
> Output:
![ttst_ttrimux2_1_1.png](ttst_ttrimux2_1_1.png)
![ttst_ttrimux2_1_2.png](ttst_ttrimux2_1_2.png)

# 16.7.12 Timing Controlled Test with Random Inputs

### Base Verilog Code:
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
### Variation Instruction:
Remove the first 2 initial blocks from the testbench and add the following code inside the generate block:
```
initial
begin
e =rand_range(0,1); i = rand_range(0,3); s = rand_range(0,1);
end
```
> Output:
![ttst_ttrimux2_1_1.png](ttst_ttrimux2_1_1.png)
![ttst_ttrimux2_1_2.png](ttst_ttrimux2_1_2.png)

# 16.7.13 Timing Controlled Test with Random Inputs

### Base Verilog Code:
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
### Variation Instruction:
Remove the first 2 initial blocks from the testbench and add the following code inside the generate block:
```
initial
begin
e =rand_range(0,1); i = rand_range(0,3); s = rand_range(0,1);
end
```
> Output:
![ttst_ttrimux2_1_1.png](ttst_ttrimux2_1_1.png)
![ttst_ttrimux2_1_2.png](ttst_ttrimux2_1_2.png)
# 3.2.1 Introduction to Simulink

# 3.2.2 Simulink Architecture

## Simulink Architecture

- Simulink software provides two major architecture components:
  - A modeler: A graphical user interface (GUI) that creates a Simulink model of the system to be simulated.
  - A simulator: A library of C-code generators that takes a specified Simulink model and converts it into a suite of C-code functions that are called by the simulator library.

## Simulink Components

- Simulink components are basic building blocks of a Simulink model.
  - Sources: Input and output ports that can either be direct, or indirect.
    - Direct sources are those that communicate directly with the target system.
    - Indirect sources are those that communicate indirectly with the target system.
      - For example, a bus that does not have an active connection to the target system is indirectly communicating through an internal bus that is directly connected to the target system.
  - Sinks: Output ports that send signals to an output device.
  - Integrators: Sources and Sinks that generate new input signals from their past state.
  - Sample and hold: Source and sinks that hold a value for a specified period.
  - Combinational logic: Logic blocks that perform combinational logic functions.
    - XOR, OR, AND, NAND, NOR, NOR, XNOR, etc.
  - Memory blocks: Source and sinks that store values for a specified period.
    - Look up table (LUT)
  - Summing junctions: Source and sinks that sum values that are received at the input.
    - Counter, Counter with Reset.
  - Multipliers: Source and sinks that multiply the input with a specified value.
    - Multiplier, Multiplier with Reset, etc.
  - Summation blocks: Sources and sinks that sum the input values in parallel.
    - Sum, Sum with Reset, etc.
  - Other components:
    - Sources and sinks that represent signal generators.
    - Sources and sinks that represent measurement device.

## Simulink Components

- Sink
  - Sink component with a constant value
  - Sink component with a table lookup
- Source
  - Source component with a constant value
  - Source component with a table lookup
- Input port
  - Connector used to connect a Simulink model to a physical object, such as a sensor
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller
  - Connector used to connect a Simulink model to a physical object, such as a sensor
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller
  - Connector used to connect a Simulink model to a physical object, such as a sensor
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller
- Input ports
  - Connector used to connect a Simulink model to a physical object, such as a sensor
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller
- Output port
  - Connector used to connect a physical device to a Simulink model
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller
- Output ports
  - Connector used to connect a physical device to a Simulink model
  - Connector used to connect a Simulink model to another Simulink model
  - Connector used to connect a Simulink model to a physical device, such as a controller