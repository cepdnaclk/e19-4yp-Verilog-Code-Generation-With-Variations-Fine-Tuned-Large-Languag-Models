```
module alu_4(d, co, a, b, f, cci);
  logic [3:0] d;
  logic co;
  logic [1:0] f;
  logic [3:0] a;
  logic [3:0] b;
  wire [3:0] sel;
  reg [3:0] d_reg;
  reg co_reg;
  reg [3:0] d_alu;
  assign d = d_alu;
  alu aluinst(d_alu, co_reg, sel);
  assign co = co_reg;
  assign d_reg = d_alu;
  always @(posedge cci) begin
    case(f)
      2'b00: sel = a;
      2'b01: sel = b;
      2'b10: sel = 0;
      2'b11: sel = 1'b1;
      default : sel = 0;
    endcase
  end
endmodule

module alu(d, co, sel);
  logic [3:0] d;
  logic co;
  logic [3:0] sel;
  reg [3:0] d_reg;
  reg co_reg;
  reg [3:0] d_alu;
  assign d = d_alu;
  assign co = co_reg;
  assign d_reg = d_alu;

  always @(sel) begin
    case(sel)
      4'h0: d_alu = 4'b0000;
      4'h1: d_alu = 4'b0001;
      4'h2: d_alu = 4'b0010;
      4'h3: d_alu = 4'b0011;
      4'h4: d_alu = 4'b0100;
      4'h5: d_alu = 4'b0101;
      4'h6: d_alu = 4'b0110;
      4'h7: d_alu = 4'b0111;
      4'h8: d_alu = 4'b1000;
      4'h9: d_alu = 4'b1001;
      4'ha: d_alu = 4'b1010;
      4'hb: d_alu = 4'b1011;
      4'hc: d_alu = 4'b1100;
      4'hd: d_alu = 4'b1101;
      4'he: d_alu = 4'b1110;
      4'hf: d_alu = 4'b1111;
      default: d_alu = sel;
    endcase
  end

  always @(sel) begin
    case(sel)
      4'h0: co_reg = 1'b1;
      4'h1: co_reg = 1'b1;
      4'h2: co_reg = 1'b1;
      4'h3: co_reg = 1'b1;
      4'h4: co_reg = 1'b1;
      4'h5: co_reg = 1'b1;
      4'h6: co_reg = 1'b1;
      4'h7: co_reg = 1'b1;
      4'h8: co_reg = 1'b1;
      4'h9: co_reg = 1'b1;
      4'ha: co_reg = 1'b1;
      4'hb: co_reg = 1'b1;
      4'hc: co_reg = 1'b1;
      4'hd: co_reg = 1'b1;
      4'he: co_reg = 1'b1;
      4'hf: co_reg = 1'b1;
      default