```verilog
module clock_gen_forever_indexed;
  reg clk, en;
  reg [3:0] index;
  
  function automatic [3:0] increment_index;
    input [3:0] current_index;
    increment_index = (current_index == 4'd15)? 4'd0 : current_index + 4'd1;
  endfunction

  always @(posedge en) begin
    index = 4'd0;
    forever begin
      #2 clk = ~clk;
      index = increment_index(index);
    end
  end

  initial begin
    clk = 1'b0;
    en = 1'b0;
  end

  initial $monitor("clk=%b, t=%0d, en=%b, index=%0d", clk, $time, en, index);

endmodule
```
This version of the module generates a clock signal based on the 'en' input. When 'en' is asserted, it starts an always block that toggles the value of 'clk' every 2 time units. An index (for display purposes) is also incremented and displayed each time 'clk' toggles. The index is initialized to 0 and incremented by 1 each time 'clk' toggles, looping back to 0 after reaching 15. The clock initialization and 'en' are also included in the initial blocks, as in the first code snippet.
Please note that this modifies the initial `forever` loop to use an index that increments every 2 time units, based on the function `increment_index`. The function simply loops back from 15 to 0, and increments the index by 1 each cycle. The `index` is displayed in a monitor statement for easy viewing of the index's value. 

The original code was not changed in this variation; it remains an example of a clock generator with a controlled switch (`en`) that controls the start of a clock generation process.


Remember, verilog uses `$time` to get the current time in nanoseconds, it is used by default. The code monitors the status of the clk,