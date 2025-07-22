[modified circuit](../modified-modules/JK_FF_case.v)

### Testbench:
[modified circuit testbench](../modified-modules/JK_FF_case.v)

**Expected Output:**

![image](../../resources/JK_FF_case.png)


# Solution

The first two tasks are similar to the previous week's solution.  The third and last task varies slightly in the way the code is written, and so it is worthwhile to go over it again.

## Task 3 - Altering the Gate Level Code for the JK Flip Flop
The following code is a modification to the base `JK_FF` code given in the week 9 slides.  This code creates 6 resistors, 6 nmos transistors and 3 JK flip flops.  The input and output wires for the flip flops are connected to the respective inputs and outputs.  The inputs are connected to the in and the output wires are connected to the q and qbar wires.  The JK flip flop module is instantiated twice, one for each input.

```
module JK_FF(clock,clear,in,out,q,qbar);
  input clock, clear;
  input in;
  output q, qbar;
  // Create 2 wires to hold in and qbar
  wire in;
  wire qbar;
  // Create 2 wires to hold the q-bar and q
  wire qbar2, q2;
  // Create 2 wires to hold the outputs
  wire q, qbar;
  // Create 3 JK flip flop modules, with their inputs and outputs connected to the wires
  jk_ff jk1(clock, clear, in, q, qbar2, q2);
  jk_ff jk2(q2, in, qbar, qbar2, q, q2);
  // Create 6 resistor modules, with inputs connected to the jk flip flops and outputs connected to wires
  resistor r1, r2, r3, r4, r5, r6;
  resistor(r1,in,q);
  resistor(r2,qbar2,q);
  resistor(r3,in,qbar);
  resistor(r4,in,q);
  resistor(r5,qbar2,q);
  resistor(r6,in,qbar);
  // Create 6 nmos modules, with inputs connected to the jk flip flops and outputs connected to wires
  nmos m1, m2, m3, m4, m5, m6;
  nmos(m1,in,q);
  nmos(m2,qbar2,q);
  nmos(m3,in,qbar);
  nmos(m4,in,q);
  nmos(m5,qbar2,q);
  nmos(m6,in,qbar);
endmodule
```

As with the last week's solution, a testbench for this code is created and the expected output is shown below.