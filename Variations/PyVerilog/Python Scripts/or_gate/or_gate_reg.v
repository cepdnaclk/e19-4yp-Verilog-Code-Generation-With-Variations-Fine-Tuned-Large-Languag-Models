
module or_gate_reg
(
  input A,
  input B,
  output Y
);

  reg Y;

  always @(A or B) begin
    Y <= A | B;
  end


endmodule
