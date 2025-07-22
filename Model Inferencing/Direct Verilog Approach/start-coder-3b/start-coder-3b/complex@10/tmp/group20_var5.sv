module mixed_sim;
reg [1:0] state_Mealy; // new
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d state_Mealy=%d dcontrol=%d data=%d x=%d y=%d bus=%d",         // new
$time, state_Mealy, dcontrol, data, x, y, bus); // new
dcontrol = 0;
end
endmodule
### Test:

```
@test "mixed_sim/Vmix/src/test/mixed_sim.sv" "in" "test"
```

### Expected:
no error

### Result:
Error
```
$ cat test.results
../../../../src/main/scala/vsim/vlib/src/test/mixed_sim.sv:12: WARNING: Verilog input 'test_input' at line 12 of../../../../src/main/scala/vsim/vlib/src/test/mixed_sim.sv is unsupported.
../../../../src/main/scala/vsim/vlib/src/test/mixed_sim.sv:12: WARNING: Verilog input 'test_input' at line 12 of../../../../src/main/scala/vsim/vlib/src/test/mixed_sim.sv is unsupported.
../../../../src/main/scala/vsim/vlib/src/test/mixed_sim.sv:12: ERROR: Undefined input of module test_input
```

# `test/mixed_sim.sv`

### Base Verilog Code:
module mixed_sim;
reg