module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
localparam N = 4;
int inside(int w = N) {
if (w == 0)
return 1;
else
return w - 1;
}
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
if(x > y)
gt = 1'b1;
else if(x == y)
eq = 1'b1;
else
lt = inside(x - y);
end
endmodule

In this example, the results are mostly the same, with small differences in the performance.