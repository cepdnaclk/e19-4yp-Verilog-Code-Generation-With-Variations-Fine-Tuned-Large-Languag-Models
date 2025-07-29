module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed [15:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Synthesized Verilog Code:
module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed [15:0] f = 1'sd0;
assign f = 1'sd0 | (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Sample Design:
module top1(clock);
input clock;
wire a, b, c;
wire f;
func1 f_inst(a, b, c, f);

always #1 clock = ~clock;
always @(negedge clock)
begin
a <= 1'b0;
b <= 1'b0;
c <= 1'b0;
end

always #2
if (a == 1'b0 && b == 1'b0 && c == 1'b0)
begin
a <= 1'b1;
b <= 1'b0;
c <= 1'b0;
end

else if (a == 1'b0 && b == 1'b0 && c == 1'b1)
begin
a <= 1'b1;
b <= 1'b0;
c <= 1'b0;
end

else if (a == 1'b0 && b == 1'b1 && c == 1'b0)
begin
a <= 1'b1;
b <= 1'b0;
c <= 1'b0;
end

else if (a == 1'b0 && b == 1'b1 && c == 1