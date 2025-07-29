module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) case (do)
2'd1: do = 2'd2;
2'd2: do = 2'd3;
2'd3: do = 2'd4;
default: do = 2'd1; // Use non-blocking <= for sequential logic
endcase
endmodule
### Output:
![](d.png)
### Analysis:
Here we have a dff which has a case statement. It takes input for the 2-bit data in the form of do and then each bit of the data is assigned to the do so output changes its value.
### Reference:
[Refer](https://github