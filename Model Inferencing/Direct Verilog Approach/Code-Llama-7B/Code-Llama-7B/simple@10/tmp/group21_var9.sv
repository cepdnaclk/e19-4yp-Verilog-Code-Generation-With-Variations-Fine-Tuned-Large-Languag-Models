module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;

initial begin
#10
f = g | h;
end
assign g = (x1 & x3) | (x2 & x4);
assign h = (