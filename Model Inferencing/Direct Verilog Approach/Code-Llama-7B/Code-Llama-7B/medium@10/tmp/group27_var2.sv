// The following code has a case statement on an array
// accessed using XMR-based hierarchical indexing.
case(b)

4'b0000: a = 4'b0000;
4'b0001: a = 4'b0011;
4'b0010: a = 4'b0110;
4'b0011: a = 4'b0111;
4'b0100: a = 4'b1100;
4'b0101: a = 4'b1111;
4'b0110: a = 4'b1110;
4'b0111: a = 4'b1101;
4'b1000: a = 4'b1010;
4'b1001: a = 4'b1111;
4'b1010: a = 4'b1110;
4'b1011: a = 4'b1101;
4'b1100: a = 4'b1010;
4'b1101: a = 4'b1000;
4'b1110: a = 4'b1001;
4'b1111: a = 4'b1011;
endcase
### Original Verilog Code:
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(