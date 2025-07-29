module test_maj3 (a, b, c, y);
input a, b, c;
output y;
wire [4:0] im;
assign im[0] = a;
assign im[1] = b;
assign im[2] = c;
and #(2, 4)
    (im[0], a, b),
    (im[1], b, c),
    (im[2], c, a);
or #(3, 5) (y, im[0:2]);
endmodule
### Description of Addition: