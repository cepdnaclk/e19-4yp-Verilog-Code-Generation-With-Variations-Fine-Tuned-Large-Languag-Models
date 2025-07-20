module simple_toggle_ff (
  input  clk,
  input  rst,
  input  enable,
  output toggle_out
);
  reg toggle_reg;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      toggle_reg <= 1'b0;
    end else if (enable) begin
      toggle_reg <= ~toggle_reg;
    end
  end
  assign toggle_out = toggle_reg;
endmodule