import std.stdio;
import std.array;

module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;

lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));

defparam flipflop.lpm_width = 1;
endmodule

module tb;
initial
for (int i = 0; i < 4; i++)
$dumpfile("dumpfile.vcd");$dumpvars(0, tb);

reg Clock, Resetn;

initial
Clock = 1'b0;
Resetn = 1'b1;

initial
for (int i = 0; i < 10; i++) {

$dumpvars(1, tb); Clock =!Clock; } while (false);$dumpvars(1, tb);

endmodule


• I think the problem was that the top module name was used as the name of the parameter in the lpm_ff instruction, as such the module named top_inst didn’t have any parameters. – Maurice Aug 10 at 10:55