module netdelay1(x,y);
input x;
output packed[31:0] y;
reg [1:0] #("nn") nn; // Declare wire 'nn' with rise=2, fall=1 delay
not #() nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y.v=nn; // Assign 'nn' to 'y.v' (direct assignment)
endmodule
### Result:
![](./Test8_structural_granularity_38.png)

### Base Verilog Code:
module netdelay1(x,y);
input x;
output y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y=nn; // Assign 'nn' to 'y' (direct assignment