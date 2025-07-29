```verilog
module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule

package pkg_mixed_sim;
import pkg_base_sim::state_Mealy;
string states_mixed_sim[] = state_Mealy[3:0];
endpackage
```
### Testbench:
```verilog
module tb_mixed_sim();
  mixed_sim dut();
  initial begin
    fork
      begin
        #100 $finish;
      end
      begin
        #100 $display("\n--End test--\n");
      end
    join_none
  end
endmodule
```

### Actual Output:

```verilog
--End test--
time=100 dcontrol=0 data=0 x=0 y=1 bus=0
time=200 dcontrol=0 data=0 x=0 y=1 bus=0
time=300 dcontrol=1 data=29 x=0 y=1 bus=29
time=400 dcontrol=1 data=29 x=0 y=1 bus=29
time=500 dcontrol=0 data=0 x=0 y=1 bus=0
time=600 dcontrol=0 data=0 x=0 y=1 bus=0
time=700 dcontrol=0 data=0 x=0 y=1 bus=0
time=800 dcontrol=1 data=0 x=0 y=1 bus=0
time=900 dcontrol=1 data=0 x=0 y=1 bus=0
time=1000 dcontrol=1 data=1 x=0 y=1 bus=1
time=1100 dcontrol=1 data=1 x=0 y=1 bus=1
time=1200 dcontrol=1 data=1 x=0 y=1 bus=1
time=1300 dcontrol=1 data=1 x=0 y=1 bus=1
time=1400 dcontrol=1 data=1 x=0 y=1 bus=1
time=1500 dcontrol=1 data=1 x=0 y=1 bus=1
time=1600 dcontrol=1 data=1 x=0 y=1 bus=1
time=1700 dcontrol=1 data=1 x=0 y=1 bus=1
time=1800 dcontrol=1 data=1 x=0 y=1 bus=1
time=1900 dcontrol=1 data=1 x=0 y=1 bus=1
time=2000 dcontrol=1 data=2 x=0 y=1 bus=2
time=2100 dcontrol=1 data=2 x=0 y=1 bus=2
time=2200 dcontrol=1 data=2 x=0 y=1 bus=2
time=2300 dcontrol=1 data=2 x=0 y=1 bus=2
time=2400 dcontrol=1 data=2 x=0 y=1 bus=2
time=2500 dcontrol=1 data=2 x=0 y=1 bus=2
time=2600 dcontrol=1 data=2 x=0 y=1 bus=2
time=2700 dcontrol=1 data=2 x=0 y=1 bus=2
time=2800 dcontrol=1 data=2 x=0 y=1 bus=2
time=2900 dcontrol=1 data=2 x=0 y=1 bus=2
time=3000 dcontrol=1 data=3 x=0 y=1 bus=3
time=3100 dcontrol=1 data=3 x=0 y=1 bus=3
time=3200 dcontrol=1 data=3 x=0 y=1 bus=3
time=3300 dcontrol=1 data=3 x=0 y=1 bus