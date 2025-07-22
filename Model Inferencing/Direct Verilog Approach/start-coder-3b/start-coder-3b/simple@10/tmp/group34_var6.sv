```verilog
wire_assign in;
```
### Expected Results:
All outputs are assigned to the input if the module is a wired assignment.
/Documentation/CodeExamples.md
# Code Examples of Module Variations

This document contains all the code examples used in development.

<hr>

## 2.27.0 - Wire Assign Module Examples

### wire_assign (wired assignment)
#### Variation 1 - [2.27.1](../Code/wire_assign.v)
Create a module with two inputs and a single output.
```verilog
// Module
module wire_assign( input in1, input in2, output out );
    assign out = (in1, in2);