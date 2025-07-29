module dff_inst_array_for(D, Clock, Resetn, Q);
input [7:0] D, Clock, Resetn;
output [7:0] Q;
lpm_ff flipflop[8](.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop[0].lpm_width = 1;
defparam flipflop[1].lpm_width = 1;
defparam flipflop[2].lpm_width = 1;
defparam flipflop[3].lpm_width = 1;
defparam flipflop[4].lpm_width = 1;
defparam flipflop[5].lpm_width = 1;
defparam flipflop[6].lpm_width = 1;
defparam flipflop[7].lpm_width = 1;
integer i;
initial begin
for (i=0; i<8; i=i+1) begin