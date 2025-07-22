
module or_gate_reg_sequential
(
  input CLK,
  input A,
  input B,
  output Y
);

  reg Y;

  always @(posedge CLK) begin
    Y <= A | B;
  end


endmodule
