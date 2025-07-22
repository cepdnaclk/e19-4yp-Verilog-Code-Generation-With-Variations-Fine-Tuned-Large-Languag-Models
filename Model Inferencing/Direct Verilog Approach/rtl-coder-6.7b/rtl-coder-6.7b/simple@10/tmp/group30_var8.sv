module netdelay2(x,y);
input x;
output [31:0] y;
wire #(2,1) nn [31:0]; // Declare packed structure 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y=nn; // Assign 'nn' to 'y'
endmodule