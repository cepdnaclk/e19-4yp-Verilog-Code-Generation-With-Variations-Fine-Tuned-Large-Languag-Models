```verilog
module comp
#(parameter N=1)
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);

generate
for(genvar i=0; i<N; i++) begin
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
// Set flags based on comparison results
if(x > y)
gt = 1'b1;
if(x == y)
eq = 1'b1;
if(x < y)
lt = 1'b1;
end
end
endgenerate
endmodule
```
In this modified code, `N` is a parameter that is used to define the number of bits in the input signals `x` and `y`. This allows for the flexibility to create an instance of this module with different parameter values to handle inputs of different sizes. The generate block is used to generate an always block for each bit in the input signals. Note that, in this way, we can handle inputs of different sizes with the same module.

Also, note that `eq` and `lt` outputs are inverted due to the logic of the condition check in the `if` statements. In the initial implementation `eq` is set to `1'b1` if `x == y` and `lt` is set to `1'b1` if `x < y`, which means that the output of `eq` is `1` if `x` is greater than `y` and `lt` is `1` if `x` is less than `y`. 

However, in the modified implementation, `eq` is set to `1'b1` if `x == y` and `lt` is set to `1'b1` if `x < y`, which means that the output of `eq` is `1` if `x` is less than `y` and `lt` is `1` if `x` is greater than `y`. This is to keep the original logic of the module. If you want to invert