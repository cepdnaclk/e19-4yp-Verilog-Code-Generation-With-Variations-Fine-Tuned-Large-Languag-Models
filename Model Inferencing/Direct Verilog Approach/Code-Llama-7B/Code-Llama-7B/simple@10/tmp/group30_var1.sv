module netdelay4(x2,y);
input x2;
output y;
wire #(2,1) nn;
not (nn,x2); // Assign NOT(x2) to 'nn' (takes effect after rise/fall delay)
assign y=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule

### Base Verilog Code:
module netdelay1(x,y);
input x;
output y;
wire #(2,1) nn;
not