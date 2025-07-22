[Module Declaration (netdelay1.v)]
module netdelay1(x,y);
input x;
output [0:31] y;
wire [0:31] nn;
not (nn,x);
assign y=nn;
endmodule // netdelay1

###