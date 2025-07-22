module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
    case (in)
      (1'b0): // Low case
        nmv.in = 1'b0;
        nmv.out = 1'b1;
      (1'b1): // High case
        nmv.in = 1'b1;
        nmv.out = 1'b0;
    endcase
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
/vlog_examples/examples/verilog_module_tutorial/README.md
    - [Tutorial Instructions](#tutorial-instructions)
    - [Expected Output](#expected-output)
    - [References](#references)
    - [Source Code](#source-code)
    - [Verilog Code](#verilog-code)
  * [Tutorial Instructions](#tutorial-instructions)
    * [Getting Started](#getting-started)
    * [Adding a Module](#adding-a-module)
  * [Expected Output](#expected-output)
  * [References](#references)
  * [Source Code](#source-code)
  * [Verilog Code](#verilog-code)

## Tutorial Instructions

### Getting Started

This tutorial will walk you through creating a Verilog module and the basic syntax.

1. Open a new file in the IDE.
1. Copy the following code into the file.

```verilog
// module.v
module my_module();
endmodule
```

### Adding a Module

Now let's create our first Verilog module.

1. In the IDE, open the `my_module.v` file and add the following snippet to the end of the file.

```verilog
// my_module.v
module my_module(input in, output out);
	always
	begin
		out = in;
	end
endmodule
```

2. Save the file.

## Expected Output

When you save the file, the IDE opens up a terminal where you can view the output of the simulation.

1. The first time this is run, it will be pretty empty. It will display the following message.

```
19:17:34.012493 |INFO| The simulation has started!
```

2. After the first simulation, the simulation will show the modules it is currently simulating.

```
19:17:40.199391 |INFO| Module my_module has 1 instance(s)
19:17:40.199435 |INFO| Module my_module has no instance(s)
19:17:40.199457 |INFO| Done
```

3. After the simulation, we will see the following message.

```
19:17:42.228919 |INFO| Simulation completed successfully.
```

## References

- [Verilog HDL Manual](https://www.fpga-guru.com/download/verilog-hdl-reference-manual.pdf)

## Source Code

[Source Code](src)

## Verilog Code

[Verilog Code](src/module.v)

### References

- [Verilog HDL Manual](https://www.fpga-guru.com/download/verilog-hdl-reference-manual.pdf)
/vlog_examples/examples/verilog_module_tutorial/src/tst_nm_in.v// module.v
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule/vlog_examples/examples/verilog_module_tutorial/tst_nm_in.v// module.v
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule/vlog_examples/examples/verilog_module_tutorial/README.md@@ -25,11 +25,11 @@
 
 ```verilog
 // module.v
 module my_module();
 endmodule
-```
+```
 
 ### Adding a Module
 
 Now let's create our first Verilog module.
 @@ -40,11 +40,11 @@
 		out = in;
 	end
 endmodule
 ```
 
-2. Save the file.
+2. Save the file by typing **Ctrl + s** or **⌘ + s**
 
 ## Expected Output
 
 When you save the file, the IDE opens up a terminal where you can view the output of the simulation.
 @@ -68,11 +68,11 @@
 ```
 
 ## References
 
 - [Verilog HDL Manual](https://www.fpga-guru.com/download/verilog-hdl-reference-manual.pdf)
-
+## Other
 ## Source Code
 
 [Source Code](src)
 
 ## Verilog Codeusername_0: @username_1 I have fixed the error by adding a space after the parentheses.830996818created/vlog_examples/examples/verilog_module_tutorial/README.md@@ -24,13 +24,13 @@
 ```verilog
 // module.v
 module my_module();
 endmodule
 ```
 
-### Adding a Module
+### Adding a module
 
 Now let's create our first Verilog module.
 
 1. In the IDE, open the `my_module.v` file and add the following snippet to the end of the file.
 
 ```verilog@@ -40,13 +40,13 @@
 		out = in;
 	end
 endmodule
 ```
 
 2. Save the file.
-
+2. Save the file by typing **Ctrl + s** or **⌘ + s**
 ## Expected Output
 
 When you save the file, the IDE opens up a terminal where you can view the output of the simulation.
 
 1. The first time this is run, it will be pretty empty. It will display the following message.
 @@ -67,13 +67,13 @@
 19