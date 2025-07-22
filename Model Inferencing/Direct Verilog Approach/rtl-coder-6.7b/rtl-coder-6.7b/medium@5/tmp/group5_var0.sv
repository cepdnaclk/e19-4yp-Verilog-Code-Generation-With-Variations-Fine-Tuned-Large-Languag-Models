module test_k;
logic q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
assign logic_array_2d[2][4] = 1;
assign logic_array_2d[0][4] = 1;
end
m555 timer(clock);
endmodule
### Behavioral Assertions:
[2021-02-16T05:47:20.151Z] 'q' is assigned '1' at test_k.v:38
[2021-02-16T05:47:20.151Z] 'q' is assigned '0' at test_k.v:42
[2021-02-16T05:47:20.151Z] 'q' is assigned '1' at test_k.v:43
[2021-02-16T05:47:20.151Z] 'q' is assigned '0' at test_k.v:45
[2021-02-16T05:47:20.152Z] 'q' is assigned '1' at test_k.v:48
[2021-02-16T05:47:20.152Z] 'q' is assigned '0' at test_k.v:49
[2021-02-16T05:47:20.152Z] 'q' is assigned '1' at test_k.v:50
[2021-02-16T05:47:20.152Z] 'q' is assigned '0' at test_k.v:52
### Test Results:
[2021-02-16T05:47:20.157Z] FAIL test_k:12: Test failed
[2021-02-16T05:47:20.157Z] FAIL test_k test failed/passed 3 of 3 tests.
</p>
</details>

## Example #4: procedural assignment with a local variable

Use a procedural assignment with a local variable to check the behavior of the array.

### Base Verilog Code:
module test_k;
wire q, clock, j, k, preset