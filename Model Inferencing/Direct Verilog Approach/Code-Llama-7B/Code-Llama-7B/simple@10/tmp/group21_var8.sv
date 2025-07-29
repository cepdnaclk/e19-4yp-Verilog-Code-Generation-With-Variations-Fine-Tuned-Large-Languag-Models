module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
reg [5:0] c = 0;
string s = "";
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
always @(posedge x1 | posedge x2)
begin
if (x1)
c = $random();
else
c = $random();
end
always @(posedge x2 | posedge x3)
begin
if (x2)
c = $random();
else
c = $random();
end
endmodule
### Modified Testbench:
module example4_tb();
wire x1, x2, x3, x4;
wire f, g, h;
reg [5:0] c = 0;
string s = "";
assign x1 = $random();
assign x2 = $random();
assign x3 = $random();
assign x4 = $random();
example4 dut(.x1(x1),.x2(x2),.x3(x3),.x4(x4),.f(f),.g(g),.h(h));
initial begin
c = $random();
for (int i = 0; i < 5; i = i+1)
begin
    if (c[i])
s = {s, "1"};
else
s = {s, "0"};
end
if (c > 31)
$display("WARNING: rand value outside of bitstring range");
$display("rand value: %b = %s", c, s);
end
initial begin
wait (x1 | x2);
c = $random();
for (int i = 0; i < 5; i = i+1)
begin
    if (c[i])
s = {s, "1"};
else
s = {s, "0"};
end