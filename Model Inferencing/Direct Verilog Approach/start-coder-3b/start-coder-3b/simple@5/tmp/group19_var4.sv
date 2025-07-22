module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.reset(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 2;
endmodule

### Base Verilog Code:
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;