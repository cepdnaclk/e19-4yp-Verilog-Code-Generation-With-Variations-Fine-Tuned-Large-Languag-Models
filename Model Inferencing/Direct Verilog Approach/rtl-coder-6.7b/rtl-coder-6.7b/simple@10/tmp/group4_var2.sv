module testbench ();
generate struct { rand int data; } dat;
process dat;
endmodule
### Expected Result:
success
### Reference Code:
module testbench ();
generate struct { int unsigned data; } dat;
process dat;
endmodule
### Note:
This variation is marked as a non-blocking statement test because it is more realistic in that it forces the tool to use a non-blocking assignment.  In addition, it is an automated test.