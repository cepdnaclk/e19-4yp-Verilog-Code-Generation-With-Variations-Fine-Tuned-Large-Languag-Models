module mux21d (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case(s)
0 : y = a; // Select a if s=0
1 : y = b; // Select b if s=1
else if (a==b)
y=a;
case(b)
0:
else :
y = b;
endcase
default :
$error("Bad case"); endcase endmodule The output is: #5$error: mux21d.sv:14: Bad case
We see that the default case is still selected when s is not 1 or 0, but the compiler now outputs a single error for the default case. The case statement can be used to select a single value or an array of values, as well as a single value or an array of values in the case.

### Base Verilog Code:
module mux21d (
input wire a