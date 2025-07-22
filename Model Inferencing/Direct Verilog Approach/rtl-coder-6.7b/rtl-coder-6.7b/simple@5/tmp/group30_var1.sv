module netdelay1(x,y);
input x;
output [0:31] y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y[0:31]=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule