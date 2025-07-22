module tst_xnor2; //testbench
reg [1:0] i1,i2;
wire [1:0] o;    // Added wire declaration
xnor1 xx(i1,i2,o);
initial
begin
i1=2'b10; // Drv1=11, Drv2=01 -> o = 01 (xnor rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
### Observation:
The modified testbench correctly demonstrates that when i1 is set to 2'b10 (all 1's), and i2 is set to 2'b01 (all 0's but 1 bit), the output is 2'b01 (bit 5), which is the xnor rule.

### Summary

In this example, we discussed synthesis of a design with a control bit. The same technique could be used to optimize a design as well.

If you are interested in this and other topics related to the AMS ECO System, then you are welcome to subscribe to our newsletter at https://ams-eco.us19.list-manage.com/Subscribe?u=0b5a51455c8b01329f47d0c0b&id=34e73b1e67. In the coming months, we will be covering additional material on how to use the AMS ECO System to synthesize, optimize, and implement a design.

## 14.8. Example 9 - Wand and Xnor to FlipFlop

In this example, we will synthesize a simple flipflop circuit using the wand and xnor gates. The original circuit can be found in Figure 13-1.

Figure 13-1: Original Flipflop Circuit

The circuit in Figure 13-1 is implemented in Verilog and can be divided into 4 parts as shown in Figure 13-2. The DFF in the middle (top) is clocked by the AND gate (gate 1) and the OR gate (gate 2) as shown in Figure 13-3. The DFF in the middle (bottom) is clocked by the AND gate (gate 3) and the OR gate (gate 4) as shown in Figure 13-4.

Figure 13-2: Implementation of Flipflop in Verilog

Figure 13-3: Clocked Flipflop 1

Figure 13-4: Clocked Flipflop 2

In this example, we will synthesize and implement these flipflops using the wand and xnor gates. The modified circuit can be found in Figures 13-5 and 13-6.

Figure 13-5: Modified Flipflop 1

Figure 13-6: Modified Flipflop 2

### Task 1: Create a Verilog module called mydff

Create a Verilog module called mydff. The inputs are in, reset, and clk. The output is out. The clk and reset signals are both active-low.

### Task 2: The output should be the same as the base flipflop

The output of the flipflop should be the same as the base flipflop.

### Task 3: The flipflops should be clocked by the same gates

The flipflops should be clocked by the same gates.

### Task 4: The flipflop should be clocked by the same signal

The flipflop should be clocked by the same signal.

### Task 5: The flipflop should be clocked by the same signal

The flipflop should be clocked by the same signal.

### Task 6: The flipflop should be clocked by the same signal