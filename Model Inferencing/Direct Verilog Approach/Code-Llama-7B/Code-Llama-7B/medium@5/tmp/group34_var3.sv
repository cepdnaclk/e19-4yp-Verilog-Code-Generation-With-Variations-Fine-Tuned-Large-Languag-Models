module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
reg [2:0] ld_reg;
reg [3:0] sw_reg;
wire [2:0] ld_mux;
wire [3:0] sw_mux;
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(ld_mux),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
always @(posedge clk)
begin
  ld_reg <= ld_mux;
  sw_reg <= sw_mux;
  casez({sw_reg[3], sw_reg[2], sw_reg[1], sw_reg[0]})
    4'b0111: ld_mux <= ld_reg;
    4'b1011: ld_mux <= ld_reg;
    4'b1101: ld_mux <= ld_reg;
    4'b1111: ld_mux <= ld_reg;
    default: ld_mux <= 3'b000;
  endcase
  casez({sw_reg[3], sw_reg[2], sw_reg[1], sw_reg[0]})
    4'b0111: sw_mux <= 4'b0001;
    4'b1011: sw_mux <= 4'b0010;
    4'