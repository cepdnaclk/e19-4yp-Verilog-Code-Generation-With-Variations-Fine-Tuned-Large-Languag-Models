module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
initial o <= ~(a1 || b1); // Continuous Assignment
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Summary
The initial block can be used to declare continuous assignments to combinational outputs. These can be procedural continuous assignments
using any of the procedural continuous assignment operators. The assignment in an always block does not overwrite the 
continuous assignment in the initial block. The assignment in the always block is the final value for a simulation step. 
The continuous assignment in the initial block is the initial value prior to simulation starts.
### Tip:
The continuous assignment in the initial block does not need to be a procedural assignment. A continuous assignment can be 
used if the right hand side is a constant. 
### Tip:
Use the initial block instead of a procedural continuous assignment to set a default value for an output. Procedural continuous
assignments are not needed. Use procedural continuous assignments only when a different value is needed during the simulation.
### Tip:
Use procedural continuous assignments to set a default value for an output. Use a simple initial block only when a different default value is 
needed.
### Tip:
The procedural continuous assignment statement is equivalent to a procedural assignment