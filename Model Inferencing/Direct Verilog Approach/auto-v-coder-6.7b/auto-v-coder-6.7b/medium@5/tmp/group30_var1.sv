```verilog
module dff_with_reset(data, clock, r, out);
input [WIDTH-1:0] data;
input clock, r;
output reg [WIDTH-1:0] out;
always @(posedge clock or posedge r)
begin
if (r)
out <= 0;
else
out <= data;
end
endmodule
```
In the code above, WIDTH is the width of the data and out array. Please replace it with the actual width that you are using. This makes the design more robust and prevents errors by defining the width of the data at the start.
Note: Always use input data and output out as reg. The reason is that these are asynchronous signals and any value change must be seen in the next cycle. Hence, using reg is a good practice to hold the values in the next cycle. If you use wire, then the compiler might treat these as signals and might optimize the code in such a way that these may not be captured in the next cycle. Also, in the reset block the value is initialized to 0.
For inputs, you can use 'wire' or'reg' keywords. For output, always use'reg' as output must be registered due to asynchronous signal. 

You may define a parameter for the width to make it more flexible to use for different widths.
```verilog
module dff_with_reset(data, clock, r, out);
parameter WIDTH = 4;
input [WIDTH-1:0] data;
input clock, r;
output reg [WIDTH-1:0] out;
always @(posedge clock or posedge r)
begin
if (r)
out <= 0;
else
out <= data;
end
endmodule
``` 
Now, if you want to use the module for a different width, you can just change the value of the parameter. 
Please be aware that using'reg' is usually better for registers as 'wire' is unsuitable for holding data and is usually used for wires or other signals. This makes your design more robust and prevents any unwanted behavior. In this case, using'reg' instead of 'wire' in the output assignment is best practice for registering the signal for the next clock cycle.

The 'always @(posedge clock or posedge