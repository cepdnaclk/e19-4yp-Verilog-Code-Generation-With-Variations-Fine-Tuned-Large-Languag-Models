module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
logic rand1, rand2, rand3, rand4;
always_comb
begin
rand1 = 1'b0;
rand2 = 1'b0;
rand3 = 1'b0;
rand4 = 1'b0;
{rand1, rand2} = {rand1, rand3};
{rand2, rand4} = {rand2, rand4};
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = (g | h) & (rand1 | rand2);
end
endmodule
`

```

Note: `//wait(c)` should be replaced with `wait()` that is blocking for `100ns`.
Upvotes: 4 [selected_answer]