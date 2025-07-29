module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule
package aoi_gate_0;
wire a[4];
wire b[3];
wire[2:0] c;
aoi_gate aoi(a,b,b,b,b);
endpackage
module top;
import aoi_gate_0::*;
reg clk;
initial clk=0;
always #10 clk=~clk;
always @(posedge clk)
begin
$monitor("clk = %b a[0] = %b a[1] = %b a[2] = %b a[3] = %b b[0] = %b \
 b[1] = %b b[2] = %b c = %b aoi = %b",
$time,a[0],a[1],a[2],a[3],b[0],b[1],b[2],c,o);
end
initial
begin
a[0] = 1'bx;
a[1] = 1'b0;
a[2] = 1'b1;
a[3] = 1'bx;
b[0] = 1'b0;
b[1] = 1'bx;
b[2] = 1'b1;
c = 3'b111;
end
aoi_gate aoi(a