module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di =~di; // Toggle data
always #16 pr=1'b1; // Assert preset
always #20 pr =1'b0; // Deassert preset
always
begin
#30 di={1'b1,di[0]};
end
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop; // Stop simulation
endmodule
### Verilog Code:
`include "dffalter.v"
`include "clksyn.v"
module dffalter_tst_v(); // Testbench, likely for a DFF named dffalter
reg clk,clr,pr;
wire q;
dffalter #(.INIT_OUT(1'b1)) dff(.q(q),.qb(),.di(clk),.clk(clr),.clr(pr),.pr()); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 clk =~clk; // Toggle clock
always #16 pr=1'b1; // Assert preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, q=%b ", $time,clk,clr,pr,q);
initial #50 $stop; // Stop simulation
endmodule
### Synopsys DC Code:
`include "dffalter.sv"
`include "clksyn.sv"
module dffalter_tst_dc(); // Testbench, likely for a DFF named dffalter
reg clk,clr,pr;
wire q;
dffalter #(.INIT_OUT(1'b1)) dff(.q(q),.qb(),.di(clk),.clk(clr),.clr(pr),.pr()); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 clk =~clk; // Toggle clock
always #16 pr=1'b1; // Assert preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, q=%b ", $time,clk,clr,pr,q);
initial #50 $stop; // Stop simulation
endmodule