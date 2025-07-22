module gates4_top (
input wire [3:0] sw,
output wire [3:0] ld
);
wire [4:0] gates4_mda_wire;
wire [3:0] gates4_mda_select;
wire [1:0] gates4_mda_index;
always @(*) begin
gates4_mda_wire = {
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0
};
gates4_mda_select = {
1'h0,
1'h0,
1'h0,
1'h1,
1'h0,
1'h0,
1'h0,
1'h1,
1'h0,
1'h0,
1'h0,
1'h1,
1'h0,
1'h0,
1'h0,
1'h1,
1'h0,
1'h0,
1'h0,
1'h1
};
gates4_mda_index = {
3'b011,
3'b010,
3'b010
};
end
ld = {
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0,
3'h3,
3'h2,
3'h1,
3'h0
}[gates4_mda_index];
endmodule
### Result:
gates4_top.sv:4