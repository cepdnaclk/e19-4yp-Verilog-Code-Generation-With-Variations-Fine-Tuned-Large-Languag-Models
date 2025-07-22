```
module test(a, b);
reg [1:0] a, b;
wire c, d, e;
always_ff : a_always
    c = a + b;
end
endmodule