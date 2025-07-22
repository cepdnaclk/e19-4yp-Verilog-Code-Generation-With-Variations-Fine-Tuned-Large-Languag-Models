```
module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
begin
if (data >= 5 && data <= 10) 
out = data;
else
$display("The value is not between 5 and 10 and will not be assigned to output");
end
end
endmodule
```
In the above code, whenever the value of `data` falls into the range from 5 to 10, the value of `data` will be assigned to `out`. If the value of `data` is not in this range, an error message will be displayed on the display console using `$display`. This is a very simple example of a counter with a range restriction. It is an excellent example to illustrate the use of procedural blocks and the inside operator. This code can be extended to a wide range of applications.

Please note that this is a simple example and that you can't compare the value of `data` directly with the range in the else clause. You need `inside` operator. However, this is only synthesizable for synthesisable languages like Verilog. In case of other HDLs, you should use a more complex mechanism to check for a range.

For the `inside` operator, you should have a statement like `if (data inside {[5:10]}) out = data;`. This checks whether `data` is within the range 5-10. If `data` is not in this range, the statement inside the `if` block after the `else` will not be executed. This is only possible for ranges of 0-255 with the `inside` operator. For larger ranges, you need to create a custom check function.

Note: `$display` is Verilog specific keyword to print on the console. This might not work in different HDLs. In case of hardware description languages like VHDL, you can use a similar mechanism to print on the console. 

Remember, this code may not synthesizable due to the use of `$display`. Use this as a basic example to understand how to handle ranges and display messages. To synthesize