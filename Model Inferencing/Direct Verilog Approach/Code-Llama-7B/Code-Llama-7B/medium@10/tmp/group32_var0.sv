module reg16(ad,d,we,q); // 16-bit register
input [3:0] ad, d, we; // 4-bit address, data input, write enable
output [15:0] q; // 16-bit data output
reg [15:0] q; // Internal 16-bit register
// Initialize all register bits with 0s
initial
q = 16'b0;
// Assign input 'd' to output 'q' on negative clock edge
// when 'we' is high
always@(negedge clk)
if (we) q[ad] <= d;