module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
rand bit [2:0] rand;
wire [1:0] g_val, h_val;
assign g_val = rand[1:0];
assign h_val = rand[3:2];
assign g = (x1 & g_val[0]) | (x2 & g_val[1]);
assign h = (x1 | h_val[0]) & (x2 | h_val[1]);
assign f = g | h;
endmodule