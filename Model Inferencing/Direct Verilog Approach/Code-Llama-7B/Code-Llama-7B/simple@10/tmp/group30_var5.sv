module netdelay1(x,y);
input x;
output y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y={nn[0],nn[1],nn[2],nn[3],nn[4],nn[5],nn[6],nn[7],nn[8],nn[9],nn[10],nn[11],nn[12],nn[13],nn[14],nn[