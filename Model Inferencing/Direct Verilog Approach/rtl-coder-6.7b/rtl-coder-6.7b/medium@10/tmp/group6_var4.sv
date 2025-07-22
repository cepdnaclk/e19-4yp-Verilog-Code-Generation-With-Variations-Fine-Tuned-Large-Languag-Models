module clock_gen_forever;
  reg clk, en;
  always @(posedge en) // Start clock generation on posedge en
    for (int i = 0; i < fn_retval(0,70,10); i = i + 2)
      #2 clk = ~clk; // Toggle clock every 2 time units
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule