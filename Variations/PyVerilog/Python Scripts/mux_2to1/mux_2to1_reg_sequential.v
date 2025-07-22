
module mux_2to1_reg_sequential
(
  input CLK,
  input A,
  input B,
  input SEL,
  output Y
);

  reg Y;

  always @(posedge CLK) begin
    Y <= (SEL)? A : B;
  end


endmodule
