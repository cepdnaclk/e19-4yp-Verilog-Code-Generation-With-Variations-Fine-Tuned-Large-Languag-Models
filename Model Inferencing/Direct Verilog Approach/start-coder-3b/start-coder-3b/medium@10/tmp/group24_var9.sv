module tst_dff_p_c();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Verilog Code Output:
```
$ xvlog tst_dff_p_c.v
$ xelab tst_dff_p_c
Loading software package rtlil
Loading software package xst

Warning: tst_dff_p_c: Warning (369-31): $monitor:

The $monitor statement contains a mix of local and procedural code.
The local code should be moved in the initial block.

```
The output shows the warning.

### Solution:
The solution is to place the monitor instruction inside the initial block.

### Verilog Code Output:
```
$ xvlog tst_dff_p_c.v
Loading software package rtlil
Loading software package xst

Starting simulation (compile first with `vlog' or `vsim' to load design)

Simulating 500 ns

%m: Top-level testbench module
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=1, do=0
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
```

### Note:
You can create the testbench with the following steps:
1. Create a Verilog code for D-FF module.
2. Use $monitor to monitor the registers
3. Create a Verilog code for test bench module.
4. Use $monitor to monitor the outputs
5. Use initial block to toggle the inputs.
6. Use $display to display the testbench name.

### References:
[1] [A Practical Introduction to Verilog](https://www.nandland.com/verilog/)

[2] [Verilog HDL Programming Language Basics](https://www.nandland.com/vhdl/)# Overview:

### [Verilog 101 - Verilog Fundamentals](https://www.nandland.com/Verilog101/)

An introduction to Verilog fundamentals.

### [VHDL 101 - VHDL Fundamentals](https://www.nandland.com/VHDL101/)

An Introduction to VHDL fundamentals.

### [Verilog Language Reference](https://www.nandland.com/Verilog-language-reference)

Verilog language reference.

### [VHDL Language Reference](https://www.nandland.com/vhdl-language-reference)

VHDL language reference.## Using $monitor for output

### Verilog Code:
```
module dff_p(output q, input d, clk);
  reg q; // Register to hold the value of q
  initial begin q = 0; // Initialize register to 0
endmodule

module tst_dff_p();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do); // Monitor outputs
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do); // Monitor outputs
endmodule
```

### Verilog Code Output:
```
$ xvlog tst_dff_p.v
Loading software package rtlil
Loading software package xst

Starting simulation (compile first with `vlog' or `vsim' to load design)

Simulating 500 ns

15:42:17 %m: Top-level testbench module
clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
```

#### Note:

The $monitor instruction is used to monitor the outputs of a module.
The output is displayed as follows:

* clk: data of the clock
* di: data of the input
* do: data of the output

The time stamp is added by the simulator to the output.
## D-FF - D Flip Flop

### Explanation:

[Digital Flip Flop](https://www.nandland.com/digital-flip-flop)

### Verilog Code:

```
module dff(output q, input d, clk);
	reg q; // A register to hold the value of Q.
	initial begin q = 0; // Initialize the register to zero.
	always @ (posedge clk) if(d) begin q <= ~q; end
endmodule
```

#### Note:

The Verilog code for the D-FF is as follows:

module dff_p(output q, input d, clk);

A register is created and initialized to 0.
The clock line becomes the clock of the module and is fed to the D-FF module.
The data line is fed to the D-FF module.
The clock line is used to generate the clock of the D-FF module.
An always block is used with the clock line as the clock and the data line as the input.
The D-FF module has two inputs and one output.
The output of the D-FF module is connected to the Q output of the D-FF module.

### Verilog Code Output:
```
$ xvlog tst_dff.v
Loading software package rtlil
Loading software package xst

Starting simulation (compile first with `vlog' or `vsim' to load design)

Simulating 500 ns

clk=0, di=0, do=0
clk=1, di=1, do=1
clk=0, di=1, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=1, di=1, do=1
```

### Note:

The Verilog code for D-FF is a basic Verilog code for the D-FF module.
The Verilog code is similar to a sequential logic circuit.
The D-FF is similar to a sequential logic circuit.
The sequential logic circuit needs a clock signal to operate.
For a sequential circuit, a clock signal must be added to the design.

The Verilog code for the D-FF module is as follows:

module dff_p(output q, input d, clk);

A register is created and initialized to 0.
The clock line becomes the clock of the module and is fed to the D-FF module.
The data line is fed to the D-FF module.
The clock line is used to generate the clock of the D-FF module.
An always block is used with the clock line as the clock and the data line as the input.
The D-FF module has two inputs and one output.
The output of the D-FF module is connected to the Q output of the D-FF module.

### References:

[1] [A Practical Introduction to Verilog](https://www.nandland.com/verilog/)

[2] [Verilog HDL Programming Language Basics](https://www.nandland.com/vhdl/)## T-FF - T Flip Flop

### Verilog Code:
```
module tff_p(output q, input t, clk);
	reg q;
	always @(posedge clk) // If the clock edge is positive.
		if(t) // If the T signal is 1.
			q <= ~q; // T-FF behavior.
endmodule
```

### Verilog Code Output:

```
$ xvlog tff_p.v
Loading software package rtlil
Loading software package xst

Starting simulation (compile first with `vlog' or `vsim' to load design)

Simulating 500 ns