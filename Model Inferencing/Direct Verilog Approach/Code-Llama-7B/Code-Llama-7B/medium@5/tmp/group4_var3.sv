module jk_gates(clk,reset,clkout,resetout);
  input clk,reset;
  output reg clkout,resetout;
  initial begin
    $dumpfile("jk_gates.vcd");
    $dumpvars;
  end
  always @(posedge clk) begin
    if (reset) begin
      clkout <= 0;
      resetout <= 0;
    end
    else begin
      case (inside(reset? 0 : clk)) //inside function call result in the index
        inside('0): cl