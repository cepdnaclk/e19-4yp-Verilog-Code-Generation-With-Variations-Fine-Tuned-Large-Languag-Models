module example4(x1, x2, x3, x4, f, g, h);
// The line below is the only line that changed
output wire f;
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
wire [3:0] c;

always @(*)
begin
    if (c == 0)
        f = 1'b0;
    else
        f = 1'b1;
end

endmodule
###