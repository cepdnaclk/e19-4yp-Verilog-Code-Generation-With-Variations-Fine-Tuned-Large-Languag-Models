
module adder_1bit_reg_sequential
(
  input CLK,
  input A,
  input B,
  input CIN,
  output SUM
);

  reg SUM;

  always @(posedge CLK) begin
    SUM <= A ^ B ^ CIN;
  end


endmodule
