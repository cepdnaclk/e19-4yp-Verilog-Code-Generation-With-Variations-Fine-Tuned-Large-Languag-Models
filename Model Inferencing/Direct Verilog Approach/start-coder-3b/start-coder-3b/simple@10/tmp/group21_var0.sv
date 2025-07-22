module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
localparam r_struct = rand_struct(rand0, rand1, rand2, rand3, rand4, rand5, rand6, rand7, rand8, rand9);
assign g = (