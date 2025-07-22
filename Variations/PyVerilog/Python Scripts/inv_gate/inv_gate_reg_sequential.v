
module inv_gate_reg_sequential
(
  input CLK,
  input A,
  output Y
);

  reg Y;

  always @(posedge CLK) begin
    Y <= ~A;
  end


endmodule
