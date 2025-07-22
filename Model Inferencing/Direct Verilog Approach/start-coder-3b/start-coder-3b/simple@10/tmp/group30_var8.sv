module netdelay1(x,y);
input x;
output [31:0] y;
wire #(2,1) [31:0] nn; // Declare wire 'nn