module clock_gen_forever_func; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  function [3:0] f; // Declare function 'f'
    input [3:0] x; // x has range [0:15]
    begin
      f = x | 4'h8; // Return x with the high bit set
    end
  endfunction
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule