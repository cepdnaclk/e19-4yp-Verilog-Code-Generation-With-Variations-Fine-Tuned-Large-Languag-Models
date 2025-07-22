```verilog
module comp
#(parameter N = 16)
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
generate
for(genvar i = 0; i < N; i++) begin : gen_comp
  // Set flags based on comparison results
  if(x[i] > y[i])
    gt = 1'b1;
  if(x[i] == y[i])
    eq = 1'b1;
  if(x[i] < y[i])
    lt = 1'b1;
end
endgenerate
end
endmodule
```
In Verilog, the conditional specify block and the generate block are used to generate the same logic for different array indices. The generate block generates N instances where each instance checks the corresponding bits of `x` and `y`. Hence, the module can accept arrays of any length.

Note: Parameterized modules are used in Verilog to allow the user to define constants within the module declaration, which can be useful for reusing the same logic for different array lengths.

This code can be compiled with different N values to generate modules for different array lengths. However, the actual use case might require different verification methods and test vectors to be provided, as the comparison and flag setting logic remains the same. 

Please replace the parameter `N` with the array length you want to use. In general, the parameterization and usage of Verilog's generate statements make it flexible and powerful for such array index comparison tasks. 

This module can be called with two equal-sized vectors of bits as input, and it will set the `gt`, `eq`, and `lt` flags based on the comparisons for each respective bit in the arrays. The flags will be set to 1 if the corresponding bit in the input arrays fulfill the comparison conditions, and they will be set to 0 otherwise.<API_RUN_STOP>