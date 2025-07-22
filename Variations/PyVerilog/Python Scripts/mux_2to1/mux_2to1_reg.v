
module mux_2to1_reg
(
  input A,
  input B,
  input SEL,
  output Y
);

  reg Y;

  always @(A or B or SEL) begin
    Y <= (SEL)? A : B;
  end


endmodule
