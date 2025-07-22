module clock_gen_forever2;
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en)
  begin
    for (integer i = 0; i < 2**4; i = i + 1)
      begin
        #(i*i) clk = ~clk;
      end
  end
  initial
  begin
    clk = 1'b0;
    en = 1'b0;
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule