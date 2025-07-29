```VHDL
module state_Mealy 
#(parameter
    CODE = ""
  ) 
(
  input [31:0] data,
  input x,
  output y,
  output reg dcontrol
);
  initial
  begin
    dcontrol = 0;
  end

  import base::*;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;

  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
             $time, dcontrol, data, x, y, bus);
  end

  always @x
  begin
    y = inside({1'b0,CODE[14:13]},1'b0,x);
  end

endmodule
```
### Original Benchmark: (Mealy Machine)
```VHDL
module state_Mealy 
#(parameter
    CODE = ""
  ) 
(
  input [31:0] data,
  input x,
  output y,
  output reg dcontrol
);
  initial
  begin
    dcontrol = 0;
  end

  import base::*;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;

  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
             $time, dcontrol, data, x, y, bus);
  end

  always @x
  begin
    y = outside(inside(CODE[14:13],0,x),1'b0);
  end

endmodule
```
### Compilation Status:
##### Pass:
```
% ghdl -a --std=08 mixed_sim.vhdl
% ghdl mixed_sim
% ghdl -a --std=08 state_Mealy.vhdl
% ghdl state_Mealy
%./state_Mealy
time=100 dcontrol=0 data=0 x=1 y=0 bus=0
time=110 dcontrol=0 data=0 x=0 y=0 bus=0
time=120 dcontrol=0 data=1 x=0 y=0 bus=0
time=130 dcontrol=0 data=1 x=1 y=0 bus=0
time=140 dcontrol=0 data=0 x=0 y=0 bus=0
time=150 dcontrol=0 data=1 x=1 y=0 bus=0
time=160 dcontrol=0 data=0 x=0 y=0 bus=0
time=170 dcontrol=0 data=1 x=1 y=0 bus=0
time=180 dcontrol=0 data=0 x=0 y=0 bus=0
time=190 dcontrol=0 data=1 x=1 y=0 bus=0
time=200 dcontrol=0 data=0 x=0 y=0 bus=0
time=210 dcontrol=0 data=1 x=1 y=0 bus=0
time=220 dcontrol=0 data=0 x=0 y=0 bus=0
time=230 dcontrol=0 data=1 x=1 y=0 bus=0
time=240 dcontrol=0 data=0 x=0 y=0 bus=0
time=250 dcontrol=0 data=1 x=1 y=0 bus=0
time=260 dcontrol=0 data=0 x=0 y=0 bus=0
time=270 dcontrol=0 data=1 x=1 y=0 bus=0
time=280 dcontrol=0 data=0 x=0 y=0 bus=0
time=290 dcontrol=0 data=1 x=1 y=0 bus=0
time=300 dcontrol=0 data=0 x=0 y=0 bus=0
time=310 dcontrol=0 data=1 x=1 y=0 bus=0
time=320 dcontrol=0 data=0 x=0 y=0 bus=0
time=330 dcontrol=0 data=1 x=1 y=0 bus=0
time=340