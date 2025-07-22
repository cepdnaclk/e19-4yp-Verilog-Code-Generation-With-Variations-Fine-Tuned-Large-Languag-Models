module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) begin
dff dff1(do,di,clk);
end
endmodule

# 5.6 Built-in Net Types

The built-in net types are integer types, real types, string types, and time types. In order to use a built-in net type, it should be declared before a net. Built-in net types can be used for any nets (output, input, inout, inout_reg, and reg) in the same module.

## 5.6.1 Integer

The integer type is commonly used by default, and it can be declared using any of the following keywords.

Keyword Description
integer Data is an integer.
int Data is an integer.
signed Data is an 8-bit signed integer.
unsigned Data is an 8-bit unsigned integer.
reg Data is a register. It must be used when the assigned value is changing.
## 5.6.2 Real

The real type is commonly used by default, and it can be declared using