module dff_inst(D, Clock, Resetn, Q);
input [1:0][1:0] D;
input Clock, Resetn;
output [1:0][1:0] Q;
genvar i, j ;
generate
for(i = 0; i < 2; i = i + 1)
begin
for(j = 0; j < 2; j = j + 1)
begin
lpm_ff flipflop(.data(D[i][j]),.aclr(Resetn),.clock(Clock),.q(Q[i][j]));
end
end
endgenerate
defparam flipflop.lpm_width = 1;
endmodule