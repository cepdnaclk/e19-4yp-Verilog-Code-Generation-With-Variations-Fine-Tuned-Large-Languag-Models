module clock_gen_forever; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever begin
      #2 clk = ~clk; // Toggle clock every 2 time units forever
      if (clk)
      for (integer i=0; i<$random; i++)
        $display("i=%d, clk=%b, t=%0d, en=%b ", i, clk,$time,en); // Print some information
    end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
#### Notes:
-   Use initial blocks for procedural code that needs to be executed once at simulation startup.
-   Use always blocks for procedural code that needs to be executed repeatedly.
-   Use always @(...) blocks for continuous assignment code that needs to be executed repeatedly as a result of changes in the sensitivity list.
-   The always block will be executed every time the sensitivity list changes.
-   The above statement means that the block of code will be executed every time the signal on the right-hand side of the @() changes.
-   If the sensitivity list has the special signal '$', the block will be executed every time the `$root` variable changes.
### Example 1:
// Wait for some time after the input signal goes high; reset the output signal when the input signal goes low
### Base Code:
module wait_reset_sync_tutorial(
  input logic clk,
  input logic rst,
  input logic in,
  output logic out
);
  reg [31:0] reset;
  initial begin
    out = 0;
    reset = '0;
  end
  always @(posedge clk)
    if (~rst) // If ~rst
      reset <= '0;
    else if (reset)
      reset <= '1;
  always