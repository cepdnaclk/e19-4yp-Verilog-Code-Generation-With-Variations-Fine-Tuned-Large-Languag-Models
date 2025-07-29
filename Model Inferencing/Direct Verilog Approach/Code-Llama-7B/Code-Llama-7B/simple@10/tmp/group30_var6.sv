module netdelay1 (x,y,z,w);
input x;
output y,z;
wire nn1,nn2;
not (nn1,x);
not (nn2,z);
assign y=nn1;