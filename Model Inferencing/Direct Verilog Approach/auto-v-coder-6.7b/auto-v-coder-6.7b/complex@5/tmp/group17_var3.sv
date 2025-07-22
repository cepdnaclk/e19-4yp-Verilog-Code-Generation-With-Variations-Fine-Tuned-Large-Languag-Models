```verilog
`timescale 1ns/1ps
module comp
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
// Set flags based on comparison results
if(x > y)
gt = 1'b1;
if(x == y)
eq = 1'b1;
if(x < y)
lt = 1'b1;
end
endmodule
```
You should replace `N-1:0` with the correct width of signal `x` and `y`. Also, the code will be more optimized and readable if you use generate blocks:

```verilog
`timescale 1ns/1ps
module comp
(input wire [N-1:0] x,
 input wire [N-1:0] y,
 output reg gt, // Greater than
 output reg eq, // Equal
 output reg lt // Less than
);
generate
for(genvar i = 0; i < N; i++)
begin: compare
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
The generate block allows you to specify multiple instances of the same structure. In the example above, a separate comparator is implemented for each bit of the input signals. This will create a more efficient Verilog design, since it has a separate logic for each bit. 

Please note that in simulation the width of signals `x` and `y` must be the same. If they are different widths, you can use concatenation (`{>>