module clock_gen_forever_func_call_test;
  reg clk, en;
  function bit [31:0] index_test(bit [31:0] a);
    bit [31:0] b;
    b = a+1;
    return b;
  endfunction  

  always @(posedge en) // Start clock generation on posedge en
    forever #index_test(0) clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk