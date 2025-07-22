module maj3 (a, b, c, y, sel_maj);
input a, b, c;
input [1:0] sel_maj;
output y;
wire [1:0] im;
and #(2, 4)
    (im[0], a, b),
    (im[1], b, c);
or #(3, 5) (y, im[sel_maj], c, a);
endmodule