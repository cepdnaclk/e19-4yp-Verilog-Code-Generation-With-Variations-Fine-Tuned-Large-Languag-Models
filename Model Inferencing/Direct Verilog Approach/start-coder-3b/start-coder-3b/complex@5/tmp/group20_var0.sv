{% highlight verilog %}
module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @(posedge x)
  y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule
{% endhighlight verilog %}
### Testbench:
{% highlight verilog %}
module mixed_sim_tb;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
data <= 2'b00;
data <= 2'b01;
data <= 2'b10;
data <= 2'b11;
dcontrol = 0;
x = 1;
y = 0;
end
endmodule
{% endhighlight verilog %}
### Expected Output:
{% highlight verilog %}
## Module mixed_sim_tb
time=0 dcontrol=0 data=0 x=1 y=0 bus=1'bz
time=1 dcontrol=0 data=2 x=0 y=0 bus=1'b0
time=2 dcontrol=0 data=2 x=0 y=0 bus=1'b0
time=3 dcontrol=0 data=2 x=0 y=0 bus=1'b0
time=4 dcontrol=0 data=2 x=0 y=0 bus=1'b0
time=5 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=6 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=7 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=8 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=9 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=10 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=11 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=12 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=13 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=14 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=15 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=16 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=17 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=18 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=19 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=20 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=21 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=22 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=23 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=24 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=25 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=26 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=27 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=28 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=29 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=30 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=31 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=32 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=33 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=34 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=35 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=36 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=37 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=38 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=39 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=40 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=41 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=42 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=43 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=44 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=45 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=46 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=47 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=48 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=49 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=50 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=51 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=52 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=53 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=54 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=55 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=56 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=57 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=58 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=59 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=60 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=61 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=62 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=63 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=64 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=65 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=66 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=67 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=68 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=69 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=70 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=71 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=72 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=73 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=74 dcontrol=1 data=2 x=0 y=0 bus=1'bz
time=75 dcontrol=1 data=2 x=0 y=0 bus=1'bz