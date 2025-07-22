module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Result:
#### Testbench Code:
module AndOrTB();

### Testbench:
module AndOrTB();

### Output:

### Output:


---
layout: post
author: 
title: Using SystemVerilog Bit-Selects for SystemVerilog-2012 Ports
---
<hr>
<h2>SystemVerilog 2012 Ports</h2>
<hr>
### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port_6);</h3>

<h3>(</h3>
<h3>input port_1, output port_2, inout port_3,</h3>
<h3>in output port_4, in inout port_5, output port_6)</h3>

Ports can be declared as a vector of a variable number of ports by using a type of port that is a vector. Here is the syntax for declaring a vector of a variable number of ports:

<h3>(input [N_1:0] port_1,</h3>
<h3>output [N_2:0] port_2, inout [N_3:0] port_3, in [N_4:0] port_4,</h3>
<h3>in inout [N_5:0] port_5, output [N_6:0] port_6);</h3>

### Background:
The SystemVerilog standard, version 2012, includes a capability to declare Ports in a similar way to how signals are declared. Here is the syntax for declaring a port:

<h3>module_name</h3>
<h3> (input port_1, output port_2, inout port_3, in output port_4, in inout port_5, output port