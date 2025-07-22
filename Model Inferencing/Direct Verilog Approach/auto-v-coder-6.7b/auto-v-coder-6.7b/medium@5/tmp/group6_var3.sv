```verilog
module clock_gen_forever;
  reg clk, en;

  // A function to generate the frequency
  function real freq_function;
    input real time_unit; // Time unit in seconds
    freq_function = 1/time_unit; // Frequency in Hz
  endfunction

  always @(posedge en) begin
    for (integer i = 0; i < 10; i = i + 1) begin // 10 iterations
      #($itor(freq_function(2.0))*1s) clk = ~clk; // Set clk every 2 seconds
      $display("clk=%0b, t=%0t, en=%0b, i=%0d", clk, $realtime, en, i);
    end
  end

  initial begin
    clk = 1'b0;
    en = 1'b0;
  end
endmodule
```
In this variation, we use a for loop to toggle `clk` 10 times, each time delaying by 2 seconds (assuming a 1 Hz frequency) or `freq_function(2.0)` Hz. The function `freq_function` is used to calculate the frequency in Hz from the given time unit in seconds.

The `$itor` function is used to convert the function result to a integer.

Please change the time unit and the number of iterations according to your requirements. Also, make sure you have proper time precision or else the time units will be in picoseconds.

Note: To use `$itor` for converting a real number to integer, the real number should be a whole number. If it's a fraction, you will need to specify how you want to round it. In the code provided, it's rounded to the nearest integer.

Also, this code uses `$realtime` to calculate real time during simulation and `$display` to display the state of signals during simulation. The `$monitor` statement is replaced by `$display` to clarify the simulation progress.
  
Please note that the `$itor(freq_function(2.0))*1s` expression may not provide the desired delay between toggling clk, especially if the