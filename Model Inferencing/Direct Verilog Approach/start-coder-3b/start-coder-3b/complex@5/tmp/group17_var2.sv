module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
// Set flags based on comparison results
generate
for (i = 0; i < W; i = i + 1) begin
if (x[i]!= y[i]) begin
// Set flags based on comparison results
if (x[i] > y[i])
gt = 1'b1;
if (x[i] == y[i])
eq = 1'b1;
if (x[i] < y[i])
lt = 1'b1;
end
end
endgenerate
end
endmodule
## Summary

In this problem, we saw how to use hardware functions to make the code cleaner and more efficient.

## References

[1] https://www.edaplayground.com/x/b5m6

[2], and. Compilers: Principles, Techniques and Tools. 2nd Edition. Pearson Education, 2007. Print

[3],,,,,, and. Digital Design with Verilog: A Practical Design Methodology. 2nd Edition. Cambridge University Press, 2018. Print

[4],, and. Verilog HDL: A Systems Approach. 2nd Edition. IEEE Press, 2009. Print