```verilog
module test;
  bit [15:0] X;
  bit [3:0] Y;

  // Assign some values to X and Y
  initial begin
    X = 16'b1111_0000_1111_0000;
    Y = 4'b1111;
  end

  always @* begin
    // Check if X is inside the Y range
    if (X inside {[0:3],[12:15]}) begin
      $display("X is inside the Y range");
    end else begin
      $display("X is not inside the Y range");
    end
  end
endmodule
```
This code will check if `X` is inside the range of `Y` (`[0:3]` and `[12:15]`). If the range check passes, it will display 'X is inside the Y range', otherwise it will display 'X is not inside the Y range'.

You can verify the functionality by synthesizing and simulating this Verilog code in a tool like Icarus Verilog or ModelSim. The code will need to be placed in a file and executed to observe the results.