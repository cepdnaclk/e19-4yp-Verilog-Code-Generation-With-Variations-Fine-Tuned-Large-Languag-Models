```verilog
module dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 do=di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
```
### Output:
```text
%m: Top-level testbench module
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
```

Clock cycle: 0, clk=0, di=0, do=0
Clock cycle: 1, clk=1, di=1, do=1
Clock cycle: 2, clk=0, di=0, do=0
Clock cycle: 3, clk=1, di=1, do=1
Clock cycle: 4, clk=0, di=0, do=0
Clock cycle: 5, clk=1, di=1, do=1
Clock cycle: 6, clk=0, di=0, do=0
Clock cycle: 7, clk=1, di=1, do=1
Clock cycle: 8, clk=0, di=0, do=0
Clock cycle: 9, clk=1, di=1, do=1
Clock cycle: 10, clk=0, di=0, do=0
Clock cycle: 11, clk=1, di=1, do=1
Clock cycle: 12, clk=0, di=0, do=0
Clock cycle: 13, clk=1, di=1, do=1
Clock cycle: 14, clk=0, di=0, do=0
Clock cycle: 15, clk=1, di=1, do=1
Clock cycle: 16, clk=0, di=0, do=0
Clock cycle: 17, clk=1, di=1, do=1
Clock cycle: 18, clk=0, di=0, do=0
Clock cycle: 19, clk=1, di=1, do=1

### Code Explanation:

- The procedural assign statement `do=di;` is equivalent to the following code:
  - `do=di;` is executed every time the clock edge is generated (by the `#3` instruction)
  - The output of the DFF `do` is simply assigned to its input (`di`).
  - With this in place, even if the procedural assign statement is not changed, the output of the DFF will always be 1.

## Task #2:

### Base Verilog Code:
```verilog
module dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
```
### Variation Instruction:
Change the