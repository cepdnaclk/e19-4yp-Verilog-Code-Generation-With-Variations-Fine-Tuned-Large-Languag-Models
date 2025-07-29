module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;

// Replace the wait(c) statement with a blocking assignment inside a structure containing rand members
struct {
	rand bit x;
	rand bit y;
} c;

initial begin
	@(posedge clk);
	wait(x1); // Wait until x1 goes high
	c.x = x1;
	c.y = x2;
	repeat(4) @(posedge clk);
	f = 1'b1;
end

endmodule
### Simulation Output:
Time | x1 | x2 | x3 | x4 | f | g | h
-----|----|----|----|----|---|---|---
0    | 0  | 0  | 0  | 0  | 0 | 0 | 0
4    | 0  | 0  | 0  | 0  | 0 | 0 | 0
8    | 0  | 0  | 0  | 0  | 0 | 0 | 0
12   | 0  | 0  | 0  | 0  | 0 | 0 | 0
20   | 1  | 0  | 0  | 1  | 0 | 1 | 1
24   | 1  | 1  | 1  | 1  | 0 | 1 |