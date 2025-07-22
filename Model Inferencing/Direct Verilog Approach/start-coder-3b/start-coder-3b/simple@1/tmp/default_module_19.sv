module dff_inst(D, D_mem, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
reg D_mem[0:D-1];
lpm_ff flipflop(.data(D[0]),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = D;

reg [3:0] i;
reg [3:0] max_i;
initial
max_i = 3'd3;
D_mem = 4'h0;

`else if (i == max_i)begin
D_mem = 4'h0;
end
end

initial
begin
i = 4'h0;
end

always @(negedge Clock)
begin
if (Resetn == 1'b0)
begin
i = 4'h0;
end
else
begin
D_mem[i] <= D;
i = i + 1;
end
end
endmodule
`