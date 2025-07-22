```
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

// DataComponent Module
struct DataStruct {
rand 1'b0 DataOutData;
} DataConstruct;

always@(posedge ControlSignals) begin
case (ControlSignals)
// Read
2'b00: begin
begin
DataConstruct.DataOutData <= DataIn;
end
// Write
2'b01: begin
begin
DataOut <= DataConstruct.DataOutData;
end
2'b10: DataConstruct.DataOutData <= DataIn;
2'b11: DataConstruct.DataOutData <= DataIn;
default: $fatal(0,0,"Unknown control signal input.");
endcase
end
endmodule
```
### Comments:
No change in behavior.
/_posts/2020-03-15-verilog-randomizing-control-signals.md
---
title: Verilog: Randomizing Control Signals
layout: post
description: How to randomizing control signals inside structs in verilog.
category: verilog
tags: [verilog, randomization]
---

<iframe height="480" width="640" src="https://www.youtube.com/embed/hH1y16m2-dU?rel=0" frameborder="0" allowfullscreen></iframe>

<div align="center"><strong>This is a video tutorial on how to randomizing control signals inside structures in verilog.</strong></div>

Verilog is a hardware description language (HDL) used in a field known as FPGA, but it can be also used for other platforms, like CPUs or microcontrollers (MC).

In FPGAs, where the majority of the software is programmed for the logic, you will find a lot of randomization inside the code, but there is a way to randomize control signals inside the code.

This can be done through struct, for a short explanation on structs and how to use them in the next article:
[Verilog: Structs](../2019/12/01/verilog-structs.html)

In this article I will explain how to randomize control signals inside a struct.

## Basic Code

```
### Basic Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule
```

## Variation Instruction
Replace the data construct with a struct containing a rand member to test randomization inside a structure.

## Modified Code
```
### Modified Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

// DataComponent Module
struct DataStruct {
rand 1'b0 DataOutData;
} DataConstruct;

always@(posedge ControlSignals) begin
case (ControlSignals)
// Read
2'b00: begin
begin
DataConstruct.DataOutData <= DataIn;
end
// Write
2'b01: begin
begin
DataOut <= DataConstruct.DataOutData;
end
2'b10: DataConstruct.DataOutData <= DataIn;
2'b11: DataConstruct.DataOutData <= DataIn;
default: $fatal(0,0,"Unknown control signal input.");
endcase
end
endmodule
```

## Comments
No change in behavior.
/_posts/2020-02-17-verilog-if-else-statement-and-case-statement.md
---
title: Verilog: If/Else statement and Case statement
layout: post
description: How to use the if-else and case statements in verilog
category: verilog
tags: [verilog, if-else, case]
---

<iframe height="480" width="640" src="https://www.youtube.com/embed/r67p5p16u6o?rel=0" frameborder="0" allowfullscreen></iframe>

<div align="center"><strong>This is a video tutorial on how to use the if-else and case statements in verilog.</strong></div>

Verilog is a hardware description language (HDL) used in a field known as FPGA, but it can be also used for other platforms, like CPUs or microcontrollers (MC).

In this article I will explain how to use the if-else and case statements.

## Basic Code
```
### Basic Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule
```

## Variation Instruction
Replace the data construct with an if-else or case statement to test the behavior of an if-else or case statement.

## Modified Code
```
### Modified Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

// DataComponent Module
always@(posedge ControlSignals) begin
case (ControlSignals)
// Read
2'b00: begin
begin
DataOut <= DataIn;
end
// Write
2'b01: begin
begin
DataOut <= DataIn;
end
2'b10: begin
begin
DataOut <= DataIn;
end
2'b11: begin
begin
DataOut <= DataIn;
end
default: $fatal(0,0,"Unknown control signal input.");
endcase
end
endmodule
```

## Comments
No change in behavior.
/_posts/2020-06-04-verilog-synchronous-verilog-code.md
---
title: Verilog: Synchronous Verilog Code
layout: post
description: This article explains the difference between synchronous and asynchronous verilog code.
category: verilog
tags: [verilog, synchronous, asynchronous]
---

<iframe height="480" width="640" src="https://www.youtube.com/embed/a6uC1L96eL8?rel=0" frameborder="0" allowfullscreen></iframe>

<div align="center"><strong>This is a video tutorial on how to synchronous verilog code.</strong></div>

Verilog is a hardware description language (HDL) used in a field known as FPGA, but it can be also used for other platforms, like CPUs or microcontrollers (MC).

In this article I will explain how synchronous verilog code works in different cases.

## Basic Code

### Verilog-2001

```
### Basic Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule
```

### Verilog-2001-Style

```
### Basic Verilog Code:
// DataComponent Module
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

// DataComponent Module
always@(posedge ControlSignals) begin
case (ControlSignals)
// Read
2'b00: begin
begin
DataOut <= DataIn;
end
// Write
2'b01: begin
begin
DataOut <= DataIn;
end
2'b10: begin
begin
DataOut <= DataIn;
end
2'b11: begin
begin
DataOut <= DataIn;
end
default: $fatal(0,0,"Unknown control signal input.");
endcase
end
endmodule
```

## Variation Instruction
Replace the code with an synchronous code.

## Modified Code

### Verilog-2001

```
### Modified Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule
```

### Verilog-2001-Style

```
### Modified Verilog Code:
// DataComponent Module
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

// DataComponent Module
always@(ControlSignals) begin
DataOut <= DataIn;
endmodule
```

## Comments
Verilog-2001 is synchronous because it has a always block which is evaluated only when ControlSignals is changed.

Verilog-2001-Style is synchronous because it has a always block which is evaluated only when ControlSignals is changed.