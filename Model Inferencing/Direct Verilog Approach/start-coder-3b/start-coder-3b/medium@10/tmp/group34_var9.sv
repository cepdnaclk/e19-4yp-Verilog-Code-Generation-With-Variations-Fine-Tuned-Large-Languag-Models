module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
always_comb
begin
case (sw)
2'b00: ld = {ld[0], ld[1], ld[2]}; // no priority case
2'b01: ld = {ld[1], ld[2], ld[2]}; // priority case
2'b10: ld = {ld[2], ld[2], ld[2]}; // priority case
default: ld = {ld[3], ld[2], ld[2]}; // priority case
endcase
end
endmodule