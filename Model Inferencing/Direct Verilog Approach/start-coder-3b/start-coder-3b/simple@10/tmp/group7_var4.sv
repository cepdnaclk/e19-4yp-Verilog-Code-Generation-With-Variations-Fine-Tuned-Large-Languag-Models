module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Testbench:
module test_bench;
`timescale 1 ns / 10 ps
reg a, b, c;
wire x, y;
AndOr andOr(a, b, c);
initial begin
a = 1'b0;
b = 1'b0;
c = 1'b0;
#1000 b = 1'b1;
#1000 a = 1'b1;
#1000 c = 1'b1;
end
always @(a, b, c) begin
$display("X value = %b, Y value = %b", x, y);
end
endmodule
# 2021-02-25 13:23:13 -0500

X value = 0, Y value = 0
X value = 1, Y value = 0
X value = 1, Y value = 0
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
X value = 1, Y value = 1
# 2021-02-25 13:23:13 -0500

X value = 1, Y value = 1
X value = 1, Y value