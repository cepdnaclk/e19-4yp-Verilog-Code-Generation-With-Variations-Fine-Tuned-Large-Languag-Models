```verilog
module dff_with_reset(data, clock, r, out, sel, array);
input clock, r, data, sel;
input [3:0] array;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end

always @*
begin
if (sel) begin
    if (data inside {array})
        out = 1;
    else
        out = 0;
end
end
endmodule
```
This modified code will set output 'out' to 1 when 'data' is inside the 'array' and'sel' is high. In all other cases, 'out' will be set to 0. The if-else statement inside the always block checks if'sel' is high (true) and 'data' is inside the 'array' then 'out' will be set to 1 else it will be set to 0.

Remember that inside operator is used for array membership check in Verilog.

Also, since this is a part-select operation, array should be a continuous range. The array should be at least two wide and the range should be continuous. For example, [3:0] would work whereas [8:0] would not.

Also, please note that this variation code is synthesizable, but please take into account that this method may not be the most efficient for large arrays or a long part-select range. In such cases, you may need to use a more efficient method of checking array membership, such as a lookup table, or a more efficient part-select operation.### Verilog Code:
```verilog
module dff_with_reset(data, clock, r, out, sel, array);
input clock, r, data, sel;
input [3:0] array;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end

always @*
begin
if (sel) begin
    if (data inside {array})
        out = 1;
    else
        out = 0;
end
end
endmodule
```
In this code, the