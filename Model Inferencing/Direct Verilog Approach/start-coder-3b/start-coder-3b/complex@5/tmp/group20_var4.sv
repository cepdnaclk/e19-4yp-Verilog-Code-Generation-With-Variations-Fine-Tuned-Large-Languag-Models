module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor(
"time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
$time, dcontrol, data, x, y, bus
);
dcontrol = 0;
end
endmodule

```

This gives:

```
time=0 dcontrol=0 data=62143 x=0 y=0 bus=0
time=100 dcontrol=1 data=62143 x=0 y=1 bus=0
time=200 dcontrol=1 data=62143 x=0 y=1 bus=0
time=300 dcontrol=1 data=62143 x=0 y=1 bus=0

```
Upvotes: 0