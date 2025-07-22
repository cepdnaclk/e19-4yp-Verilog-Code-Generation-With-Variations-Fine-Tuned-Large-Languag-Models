```systemverilog
module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
$monitor("clk=%b, En=%b, N=%d, a=%d",clk,En,N,a);
end
always
initial begin
$display("Initializing simulation");
#35 $stop; // Stop simulation
end
// Nested generate block with escaped names and indexing
generate
for (genvar i = 0; i < 16; i++) begin
initial begin
$display("Starting test for input %d", i);
N = 4'b1111; // Set limit to 15
En = 1'b1; // Start enabled
#10; // Wait for counter to increment
$display("Counter value after 10ns is %d", a);
#20; // Wait for counter to increment
$display("Counter value after 30ns is %d", a);
end
end
endgenerate
endmodule
```

In this code, a loop is used to generate 16 initial blocks, each with a unique input to `N` and `En`. The counter value is monitored every 10ns and every 30ns after the counter starts. This demonstrates the use of nested generate blocks and variable indexing for range selection. Note that each `initial` block is used to test the counter output with the same values of `N` and `En`, but different simulation times inside each block. This is a simple demonstration of how to use nested generate blocks with variable indexing to test different conditions/inputs in a more flexible and scalable way.