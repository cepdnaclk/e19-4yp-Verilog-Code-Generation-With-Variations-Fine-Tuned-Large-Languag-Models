module modulename1 (
input reg clk,
input integer inp1,
input integer inp2,
output integer outp1
);
assign outp1 = inp1 ^ inp2;
modulename #(.CONSTANT(1)) u1(
.clk(clk),
.inp1(inp1),
.inp2(inp2),
.outp1(outp1));
endmodule
### Variation Instruction:
Change the wire type of the input inp1, inp2, and outp1 to integer or time to test usage of SystemVerilog time type.
### Modified Code