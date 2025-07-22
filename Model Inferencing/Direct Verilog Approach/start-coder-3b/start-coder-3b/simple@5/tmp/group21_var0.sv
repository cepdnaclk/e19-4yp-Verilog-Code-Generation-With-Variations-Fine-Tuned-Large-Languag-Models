module example9(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;

structure s1 random;
rand bit c;
endstructure

structure s2 random;
rand bit c2;
endstructure

assign g2 = (x1 & x3) | (x2 & x4);
assign h2 = (x1 | x3) & (x2 | x4);
assign g = s1.c? g2 : g;
assign h = s2.c2? h2 : h;
assign f = g | h;
endmodule
### Execution:

### S1
Simulation time: 1000 ns
Number of