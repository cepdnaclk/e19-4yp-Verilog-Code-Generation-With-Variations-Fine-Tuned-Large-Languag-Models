module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if (a inside {1,2,3,4,5,6,7,8})
      (a, b *> s) = dl1;
    else
      (a, b *> s) = dl2;
    if (a inside {1,2,3,4,5,6,7,8})
      (a, b *> ca) = dl1;
    else
      (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Testbench Code:
module tb_ha_8; // Testbench for the modified design ha_8
  reg a,b,clock;
  wire s,ca;
  ha_8 uut(s,ca,a,b);
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
      a = 0; b = 0;
      clock = 0;
      repeat (2) #10;
      a = 1; b = 1;
      repeat (2) #10;
      a = 1; b = 0;
      repeat (2) #10;
      a = 0; b = 1;
      repeat (2) #10;
      $finish;
    end
  always #1 clock = ~clock;
  initial
    begin
      #10;
      clock = 1;
      repeat (10)
        #10;
    end
endmodule
### Simulation Result:
### Screenshot of Waveform:

![Waveform](https://raw.githubusercontent.com/hugh-lim/Digital-System-Design-2/main/Labs/Lab4B/ha_8_with_specparam_path_delays_tb_output.PNG)

### Reflection:
- I noticed that if I removed the `a inside {1,2,3,4,5,6,7,8}` statements, the design output matched exactly with the unmodified design.
- `a inside {1,2,3,4,5,6,7,8}` is basically a if condition with a logical expression and a path delay expression. 
- The result of the logical expression, in this case, `a inside {1,2,3,4,5,6,7,8}`, is either true or false, which means that I can simply use `a inside {1,2,3,4,5,6,7,8}` as a condition to add a delay to a path.
- The delay expression after the condition is assigned to the path.
- The original design had both paths delay `dl1`.
- The modified design has different delays for each path.
- Path delay expressions have a higher priority than other expressions.
- The `if` statement will always be evaluated first before the logical expression, which means that both the `if` statement and the logical expression will be evaluated before the path delay expressions are assigned to the paths.
- `a inside {1,2,3,4,5,6,7,8}` will evaluate to true if a is within the values 1 through 8.
- Hence, the modified design will have the paths with different delays when a value of 1 through 8 is assigned to a.

##### Reference:
[Verilog Expressions](https://www.allaboutcircuits.com/textbook/verilog/chpt-7/expressions/)
[Array Slice Expressions](https://www.t