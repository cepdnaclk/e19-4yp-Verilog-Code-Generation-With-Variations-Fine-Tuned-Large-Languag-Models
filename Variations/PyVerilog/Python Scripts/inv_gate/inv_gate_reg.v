
module inv_gate_reg
(
  input A,
  output Y
);

  reg Y;

  always @(A) begin
    Y <= ~A;
  end


endmodule
