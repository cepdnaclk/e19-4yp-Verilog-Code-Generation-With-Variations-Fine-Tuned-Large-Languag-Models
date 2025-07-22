module logic_1;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
if (a == 1'b1) begin
// No action
end else switch (a) begin
case (1'b1) : begin
$display ("t=%0t display