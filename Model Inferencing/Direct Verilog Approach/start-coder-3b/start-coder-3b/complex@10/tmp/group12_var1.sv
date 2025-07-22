```verilog
module adder_tst();
reg [3:0]di,do,clk,clr,pr;
wire q, qb;
// adder adder(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT

package mypkg;
reg [3:0]di[];
initial
begin
di[0]=4;di[1]=5;di[2]=6;di[3]=7;di[4]=8;di[5]=9;di[6]=10;di[7]=11;
end
endpackage

initial
begin
clk=1'b1; // Start with preset asserted
end
always
begin
//clr=1'b0; // Deassert clear
end
always # 4 di =~di; // Toggle data
always #16 pr=