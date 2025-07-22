module Mux4Way4(a,b,c,d,sel,sum); // Four-Way-4 Mux
input [3:0] a,b,c,d,sel;
output sum;
// Assign inputs to outputs using procedural assignment
case(sel)
// Assign inputs to outputs
0: sum=a;
1: sum=b;
2: sum=c;
3: sum=d;
default: sum=a;
endcase
endmodule
### Result:

### Base Verilog Code:
module fulladder(S,C,A,B); // Four-Bit Full Adder
output