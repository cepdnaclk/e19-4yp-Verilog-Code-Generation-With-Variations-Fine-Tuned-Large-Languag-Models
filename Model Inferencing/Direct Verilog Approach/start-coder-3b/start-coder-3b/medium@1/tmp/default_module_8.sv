module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
if (i[0]==1)
dec2_4beh dec(o,i[1:0]);
else
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule

## References

1.. "An introduction to VHDL." The University of Cambridge. 2012. http://www.cs.bham.ac.uk/~exr/lectures/prog/vhdl/VHDL.pdf.
2.. "VHDL Tutorial." https://www.tutorialspoint.com/vhdl.
3.,, and. "VHDL Basics." https://www.ic.unicamp.br/~helium/VHDL/VHDL_Basics/VHDL_Basics.pdf.
4.. "Introduction to VHDL." https://www.vunit.org/docs/tutorial.pdf.
5.,,, et al. "A Tutorial on VHDL Syntax." https://eeweb.poly.edu/ise/tutorials/vhdl/vhdl.html.