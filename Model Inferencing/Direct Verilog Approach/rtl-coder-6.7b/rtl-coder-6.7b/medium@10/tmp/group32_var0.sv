module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk)
case ({di,clk}) inside
[2'b01:2'b11]:do <= di; // Non-blocking assignment
endcase
endmodule
### Expected Output:
```
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do = 0
do = 1
do =