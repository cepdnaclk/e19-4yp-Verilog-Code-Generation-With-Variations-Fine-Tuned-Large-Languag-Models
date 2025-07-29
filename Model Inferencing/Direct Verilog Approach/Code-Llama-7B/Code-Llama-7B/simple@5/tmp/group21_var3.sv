module example4(a, b, c, d, e, f, g, h)
rand bit a, b;
rand int c, d;
rand bit[10:0] e;
rand #0 f;
rand #0 g;
reg h;
initial begin
h = 0;
#50
h = 1;
end
assign f = (a && b) || (c && d);
assign g = (e[10] && e[9]) || (e[1] && e[0]);
assign h = (f && g);
endmodule
### Modifications:
1. Modified code to use rand instead of wait in a structure which contains rand variables.
### Expected Output:
### Actual Output:
### Compliance:
This test case needs to pass