module simple_pulse_gen (
  input  clk,
  input  rst,
  output pulse_out
);
  reg [1:0] counter;
  reg pulse;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= 2'b00;
      pulse <= 1'b0;
    end else begin
      counter <= counter + 1;
      pulse <= (counter == 2'b11);
    end
  end
  assign pulse_out = pulse;
endmodule