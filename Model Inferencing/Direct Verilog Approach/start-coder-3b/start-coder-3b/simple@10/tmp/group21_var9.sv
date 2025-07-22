module example6(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;

// Test nested randomized structure
rand bit r1;
rand bit r2;
rand bit r3;
struct random_struct {
bit rand b1 = 100;
bit rand b2 = 100;
bit rand b3 = 100;
} random_structure_instance;

// Test blocking assignment
assign g <- (x1 & x3) | (x2 & x4);
assign h <- (x1 | x3) & (x2 | x4);
assign f <- g | h;
endmodule
### Simulation Results:

• x1 and x2 are assigned using a constant value.
• x3 and x4 are assigned using a constant value.
• f is assigned the value of g or h.

### Observations:

• Conditional randomization on a blocking assignment inside a nested randomized structure was not supported.

### Limitations

• Conditional randomization of structure members are not currently supported by EDA Playground.