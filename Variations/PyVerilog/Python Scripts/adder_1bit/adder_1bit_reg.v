
module adder_1bit_reg
(
  input A,
  input B,
  input CIN,
  output SUM
);

  reg SUM;

  always @(A or B or CIN) begin
    SUM <= A ^ B ^ CIN;
  end


endmodule
