module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule

module Clock_Prog (clock);

parameter [5:0] default = 6'b010101;
parameter enum {A_default=0, B_default, C_default, D_default, E_default, F_default, G_default, H_default} ENUM_default_type = default;

localparam [1:0] enum {A_enum=0, B_enum, C_enum, D_enum, E_enum, F_enum, G_enum, H_enum} ENUM_enum_type = B_enum;

parameter [7:0] non_default = 8'b01011010;
parameter enum {A_non_default=0, B_non_default, C_non_default, D_non_default, E_non_default, F_non_default, G_non_default, H_non_default} ENUM_non_default_type = non_default;

localparam [2:0] enum {A_localparam_enum=0, B_localparam_enum, C_localparam_enum, D_localparam_enum, E_localparam_enum, F_localparam_enum, G_localparam_enum, H_localparam_enum} ENUM_localparam_enum_type = B_localparam_enum;


reg clk;
reg [6:0] count;

always @(posedge clk) begin
  if (count == 7'b0000000) begin
    case (ENUM_enum_type)
      A_enum: begin
        clock = 1;
      end
      B_enum: begin
        clock = 0;
      end
      default: begin
        clock = 0;
      end
    endcase
  end
  else begin
    clock = 0;
  end
end

always @(posedge clk) begin
  case (ENUM_non_default)
    A_non_default: begin