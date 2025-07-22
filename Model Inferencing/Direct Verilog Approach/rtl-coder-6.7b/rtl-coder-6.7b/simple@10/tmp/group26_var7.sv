module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Parameters:
A(1,0) = a
B(1,0) = b
C(1,0) = c
D(1,0) = a1
E(1,0) = b1
F(1,0) = c1
### Variation Verification:
### Verilog Test File Code:
// TestBench verilog file with input stimuli
module test;
reg bb,cc,dd,ee;
wire aa,ff;
gade u1(aa,ff,bb,cc,dd,ee);
initial begin
// Wait 10000 fs. Here wait is an internal delay
// delay for the signal to propagate.
#10000
// Check for all possible combinations of inputs
repeat(4) begin
// Repeat for 16 times, 4 inputs and 4 outputs
bb=$random();
cc=$random();
dd=$random();
ee=$random();
#100
end
end
endmodule
### Variation Output:
### 
### Expected Output:
### Simulation Results: