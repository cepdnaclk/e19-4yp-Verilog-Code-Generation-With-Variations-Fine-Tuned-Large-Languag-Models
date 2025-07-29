module gates4_top (
input wire [3:0] sw,
output logic [2:0] ld
);
reg  [2:0] ld_reg;
reg [2:0] const_operand;
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld_reg[2]),
.or4_(ld_reg[1]),
.xor4_(ld_reg[0])
);
always_comb
begin
case(const_operand)
[0:0]: ld = ld_reg;
[1:1]: ld = not(ld_reg);
[2:2]: ld = ~ld_reg;
[3:3]: ld = 1'b0;
endcase
end
endmodule
### Testbench code:
module gates4_tb ();
parameter N = 4;
logic [N:0] sw = 0;
logic [2:0] ld;
gates4 U1 (
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
integer i;
initial
begin
for (i = 0; i < N; i = i + 1)
begin
	sw[i] = 0;
end
ld = 0;
sw[1] = 1;
sw[3] = 1;
wait(1);
sw[3] = 0;
sw[2] = 1;
wait(2);
sw[2] = 0;
sw[0] = 1;
wait(3);
sw[0] = 0;
sw[1] = 0;
sw[3] = 1;
wait(4);
sw[3] = 0;
sw[2] = 0;
sw[0] = 1;
wait(5);
sw[0] = 0;
sw[1] = 1;
sw[2] = 1;
wait(6