module maj6 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4) (im1, a, b), (im2, b, c), (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
always @