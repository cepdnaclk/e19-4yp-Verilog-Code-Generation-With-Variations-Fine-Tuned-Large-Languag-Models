```
module mixed_sim;
reg [7:0] dcontrol;
reg [31:0] data;
reg [1:0] x;
reg y;
wire [31:0] bus;
assign bus = dcontrol[0]? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol[0] = 0;
dcontrol[7:1] = 0;
end
endmodule
```