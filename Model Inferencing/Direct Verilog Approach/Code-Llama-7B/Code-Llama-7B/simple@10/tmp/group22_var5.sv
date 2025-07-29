module in_struct_out_struct_struct(in, out);
input struct {
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x4;
} in;
output struct {
logic p;
logic a;
} out;
assign out.p = ^in.x1;
assign out.a = &in.x1;
endmodule
### Sim