module Anding (input a, b, output y);
and (y, a, b);
endmodule
### Test Bench:
module Anding_testbench ();
reg a, b;
wire y;
Anding dut (a, b, y);
initial begin
$monitor ($time, "a=%b, b=%b, y=%b", a, b, y);
$dumpfile ("anding.vcd");
$dumpvars;
a = 0; b = 0; #10;
a = 0; b = 1; #10;
a = 1; b = 0; #10;
a = 1; b = 1; #10;
end
endmodule
### Test Output:
$ vlog anding_testbench.v test.v
$ vsim -novopt anding_testbench
# vcd info...
#...
#...
# t 0 a=00 b=00 y=00
# t 10 a=00 b=10 y=00
# t 20 a=10 b=00 y=00
# t 30 a=10 b=10 y=10
#...