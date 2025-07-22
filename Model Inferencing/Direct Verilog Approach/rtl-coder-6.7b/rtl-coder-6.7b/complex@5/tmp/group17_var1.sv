module comp_inside_gen;
parameter N = 8;
wire [N-1:0] x;
wire [N-1:0] y;
reg gt, eq, lt;
generate
comp comp_i
(x, y, gt, eq, lt);
endgenerate
wire inside_func;
assign inside_func = (x==y)|(x>y);
always @(*)
begin
if(inside_func)
begin
gt = gt;
eq = eq;
lt = lt;
end
else
begin
gt = gt;
eq = 1'b0;
lt = lt;
end
end
endmodule