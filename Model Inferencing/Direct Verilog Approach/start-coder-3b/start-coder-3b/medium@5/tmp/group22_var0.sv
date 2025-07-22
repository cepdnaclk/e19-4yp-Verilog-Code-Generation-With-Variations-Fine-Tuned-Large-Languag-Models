module nil;
reg [1:0] data[3];
reg [1:0] base;
initial
begin
data[0] = 0;
data[1] = 1;
data[2] = 0;
base = 0;
$display ("t=%0t display: data[%d] = %d", $time, base, data[base]);
end
initial
$monitor ("t=%0t monitor: data[%d] = %d", $time, base, data[base]);
endmodule
### Variation Example:
You can use this variation to make a monitor statement display the value of a 1-level array variable with a dynamic index variable. The base variable is used to select the appropriate dimension and the index is incremented and reset to zero after the last value.
module nil;
reg [1:0] data[3];
wire [1:0] base