module simple_shift_reg (
  input        clk,
  input        rst,
  input        data_in,
  output [7:0] shift_out
);
  reg [7:0] shift_reg;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      shift_reg <= 8'h00;
    end else begin
      shift_reg <= {shift_reg[6:0], data_in};
    end
  end
  assign shift_out = shift_reg;
endmodule