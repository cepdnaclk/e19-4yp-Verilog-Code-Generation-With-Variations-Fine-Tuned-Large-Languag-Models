module netdelay1(x,y);
input [0:23] x;
output [0:23] y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x[0]); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign #(2,1) y=nn; // Assign '