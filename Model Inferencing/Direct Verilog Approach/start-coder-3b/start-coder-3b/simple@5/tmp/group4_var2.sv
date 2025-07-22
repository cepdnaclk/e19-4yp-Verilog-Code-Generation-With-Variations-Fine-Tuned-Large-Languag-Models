module testbench ();
generate var_data;
process data;
endmodule

## Sources
https://www.edaboard.com/discourse-topic/verilog-random-number-in-struct-or-array-87944.html


## TODOs

/docs/_posts/2020-08-11-ECE453-Lecture6_11-8-2020.md
---
title: "ECE453-Lecutre 6 : 11-8-2020"
author: ""
date: "11/8/2020"
---

## Verilog Testbench Overview

Verilog testbench is a set of instructions that helps with testing the functions of a complex Verilog module. It's a good idea to add a testbench for every module. It is a good idea to document your testbench along with the module, and then when you come back to the testbench, your code will be more readable.

A testbench is a module that is responsible for generating a stimulus, running it through the system under test (SUT), and verifying the expected outputs.

## Code Example of Equation for Area of a Rectangle

```verilog
module area_rect ();

  //Declare all variables
  reg [31:0] rect_width;
  reg [31:0] rect_height;
  reg [31:0] rect_area;

  // Define the inputs and the outputs of this module
  input wire [31:0] width;
  output wire [31:0] area;

  // Create a process called calc_area that calculates the area and stores it in rect_area
  always @* begin
    rect_area <= width * height;
  end

  // Create a process called store that takes the output of calc_area and stores it in area
  always @* begin
    area <= rect_area;
  end

  // Instantiate the process
  always @* begin
    calc_area;
    store;
  end
endmodule
```

## Testbench Example
```verilog
module area_rect_tb;

  // Define all module inputs/outputs
  reg [31:0] width;
 _width;
    assign area = rect_area;
  end
endmodule
```


## Simulating Verilog Testbench

- When writing a testbench, it is good practice to make sure that the testbench does not affect the behavior of the module under test.
- To simulate a testbench, first compile the module without the testbench. Then, place the testbench module in between the module under test and the testbench as shown below.
```verilog
module testbench;
	// Declare all modules to be tested
	module module_under_test;
		// Testbench module
		module testbench;
			// Instantiate the module under test
			module module_under_test;
			// Instantiate the testbench
			module testbench;
		endmodule
	endmodule
endmodule



```


## TODOs

 reg [31:0] height;
  reg [31:0] area;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end
endmodule
```

## Testbench Example
```verilog
module area_rect_tb;

  // Define all module inputs/outputs
  reg [31:0] width;
  reg [31:0] height;
  wire [31:0] area;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end
endmodule
```

## Testbench Example
```verilog
module area_rect_tb;
  // Define all module inputs/outputs
  reg [31:0] width;
  reg [31:0] height;
  wire [31:0] area;

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Define testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end
endmodule
```

## Testbench Example (With process)
```verilog
module area_rect_tb;

  // Define all module inputs/outputs
  reg [31:0] width;
  reg [31:0] height;
  wire [31:0] area;

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Define testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end

  // Define a process called test that verifies the results
  always begin
    if (area_rect_top.rect_area!= width * height) begin
      $display("Area should be %d, actual is %d", width * height, area);
      $finish;
    end
  end
endmodule
```

## Other Testbench Examples

- Input and output can be specified with in and out or input and output.
- A testbench consists of an initial block that sets testbench inputs and then connects outputs from the module under test to the testbench outputs.
- The testbench usually includes a process called test that verifies the behavior of the module under test.
- The testbench usually consists of multiple processes so that it can be more readable and modular.

## Testbench Example
```verilog
module area_rect_tb;

  // Define all module inputs/outputs
  reg [31:0] width;
  reg [31:0] height;
  wire [31:0] area;

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Define the testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end

  // Define a process called test that verifies the results
  always begin
    if (area_rect_top.rect_area!= width * height) begin
      $display("Area should be %d, actual is %d", width * height, area);
      $finish;
    end
  end
endmodule
```

## Testbench Example
```verilog
module area_rect_tb;

  // Define all module inputs/outputs
  reg [31:0] width;
  reg [31:0] height;
  wire [31:0] area;

  // Instantiate the area_rect module
  area_rect area_rect_top;

  // Define testbench inputs
  initial begin
    width <= 5;
    height <= 4;
  end

  // Define the testbench outputs
  initial begin
    area <= area_rect_top.area; // Read area from module
  end

  // Define a process called test that verifies the results
  always begin
    if (area_rect_top.rect_area!= width * height) begin
      $display("Area should be %d, actual is %d", width * height, area);
      $finish;
    end
  end

  // Define a process called stim that stimulates the test
  always begin
    $display("Width: %d Height: %d", width, height);
    area_rect_top.rect/docs/_posts/2020-09-30-ECE453-Lab6_30-9-2020.md
---
title: "ECE453-Lab 6 : 30-9-2020"
author: ""
date: "30/9/2020"
---

## Design Example

![Design Example](/assets/img/lab6/design_example.JPG)
<br>

## Task 1: Creating the Verilog Design

```verilog
module alu_tb;
  	reg [3:0] a;
  	reg [3:0] b;
  	reg [4:0] r;

  	wire [3:0] a_out;
  	wire [3:0] b_out;
  	wire [4:0] r_out;
  	wire [4:0] control_out;
  	wire [3:0] result;

  	always @(a or b) begin
  		a_out <= a;
  		b_out <= b;
  	end

  	reg [1:0] control;
  	always begin
  		control <= 2'b10;
  	end

  	alu my_alu (
  	  .a(a_out),
  	  .b