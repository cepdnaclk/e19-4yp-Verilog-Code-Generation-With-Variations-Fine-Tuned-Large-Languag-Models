module DFF (input a, b, output y);
DFF_union u (input a, b, output y);
endmodule
module DFF_union (input a, b, output y);
reg x;
assign a = {a, b};
dff x (output x);
assign y = x;
endmodule
### Expected Output:
`y=a|b`