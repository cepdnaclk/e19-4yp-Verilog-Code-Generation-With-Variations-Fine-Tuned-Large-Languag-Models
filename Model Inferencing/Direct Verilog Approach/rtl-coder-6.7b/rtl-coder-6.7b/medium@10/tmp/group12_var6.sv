module maj3 (a, b, c, y);
input [2:0] a;
input [1:0] b;
input [0:1] c;
output [1:0] y;
wire [2:0] im1;
wire [1:0] im2;
wire [0:1] im3;
and #(2, 4)
    (im1[0], a[1], a[2]),
    (im1[1], a[0], a[2]),
    (im1[2],