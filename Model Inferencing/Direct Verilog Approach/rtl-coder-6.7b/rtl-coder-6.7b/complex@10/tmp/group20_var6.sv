module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : `z_array;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule
### Modified Package with Constants:
package array_pkg;
parameter [31:0] z_array = 32'hzzzzzzzz;
endpackage