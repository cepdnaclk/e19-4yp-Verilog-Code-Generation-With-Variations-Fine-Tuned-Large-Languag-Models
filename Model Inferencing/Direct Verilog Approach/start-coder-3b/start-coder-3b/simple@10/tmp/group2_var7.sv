module test;
packed struct pack struct
    {
    wire a;
    reg x;
    reg y;
    reg z;
    }
    pack_inst;
reg packed pack_struct;

assign #25 (pack_inst.a) = 1;
always begin
    (pack_inst.x) = #10 (pack_inst.a);
end
endmodule
### Result
![Schematic of the test bench](https://www.a-b-c.com/images/2.png)/0_Basic_Verilog/13_Using_the_wait_statement/Readme.md
### Background
The wait statement is used to wait for specified events to occur.

This instruction may be used inside a procedural, continuous, or initial block.

### Instructions
#### For the test bench code:
```
module tb;
reg a, b;
reg [5:0] c, d;
wire [1:0] e, f;
initial begin
  a = 0;
  b = 0;
  c = $random;
  d = $random;
  e = 2'b00;
  f = 2'b00;
  $display("Initial: a=%b b=%b c=%b d=%b e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	a = 1;
	$display("After a = 1: a=%b b=%b c=%b d=%b e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	a = 0;
	b = 1;
	$display("After a = 0, b = 1: a=%b b=%b c=%b d=%b e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	c = 1024;
	d = 2048;
	$display("After c = 1024, d = 2048: a=%b b=%b c=%d d=%d e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	e = 2'b10;
	$display("After e = 2'b10: a=%b b=%b c=%d d=%d e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	e = 2'b01;
	f = 2'b10;
	$display("After e = 2'b01, f = 2'b10: a=%b b=%b c=%d d=%d e=%b f=%b",a,b,c,d,e,f);
end
initial begin
	wait;
	$display("After wait: a=%b b=%b c=%b d=%b e=%b f=%b",a,b,c,d,e,f);
end
endmodule
```
#### For the main test bench module:
```
module test;
reg a, b;
reg [5:0] c, d;
wire [1:0] e, f;

assign #25 a = 0;
assign #25 b = 0;
assign #25 (c) = $random;
assign #25 (d) = $random;
assign #25 (e) = 2'b00;
assign #25 (f) = 2'b00;

always begin
	#25 a = 1;
end

always begin
	#25 b = 1;
end

always begin
	#25 (c) = 1024;
end

always begin
	#25 (d) = 2048;
end

always begin
	#25 (e) = 2'b10;
end

always begin
	#25 (f) = 2'b10;
end

always begin
	#100 wait;
end
endmodule
```
### Expected Result
#### For the test bench code
```
Initial: a=0 b=0 c=1023 d=2047 e=2'b00 f=2'b00
After a = 1: a=1 b=0 c=1023 d=2047 e=2'b00 f=2'b00
After a = 0, b = 1: a=1 b=1 c=1023 d=2047 e=2'b00 f=2'b00
After c = 1024, d = 2048: a=1 b=1 c=1024 d=2048 e=2'b00 f=2'b00
After e = 2'b10: a=1 b=1 c=1024 d=2048 e=2'b10 f=2'b00
After e = 2'b01, f = 2'b10: a=1 b=1 c=1024 d=2048 e=2'b01 f=2'b10
After wait: a=1 b=1 c=1024 d=2048 e=2'b01 f=2'b10
```
#### For the test module
```
Initial: a=0 b=0 c=23 d=24 e=2'b00 f=2'b00
After a = 1: a=1 b=0 c=23 d=24 e=2'b00 f=2'b00
After a = 0, b = 1: a=1 b=1 c=23 d=24 e=2'b00 f=2'b00
After c = 1024, d = 2048: a=1 b=1 c=1024 d=2048 e=2'b00 f=2'b00
After e = 2'b10: a=1 b=1 c=1024 d=2048 e=2'b10 f=2'b00
After e = 2'b01, f = 2'b10: a=1 b=1 c=1024 d=2048 e=2'b01 f=2'b10
After wait: a=1 b=1 c=1024 d=2048 e=2'b01 f=2'b10
```/0_Basic_Verilog/1_Basic_Verilog_Basics/10_Modular_Verilog_Code_Example/Readme.md
### Purpose
This module shows a simple example of the use of a block of test bench code in a larger test bench module.

### Background
A test bench is a module that is used to test the functionality of other modules.

The purpose of a test module is to test the functionality of the other modules. A test module has two parts:

* a test bench module
* a module that is being tested

### Instructions
#### For the test bench module:
```
module tb;
reg a;
reg b;
initial begin
    a = 0;
    b = 0;
    $display("Initial a=%b b=%b",a,b);
end
initial begin
    a = 1;
end
initial begin
    b = 1;
end
initial begin
    wait;
    $display("Final a=%b b=%b",a,b);
end
endmodule
```
#### For the test module:
```
module test;
reg a;
reg b;
assign #25 a = 0;
assign #25 b = 0;
always begin
    #25 a = 1;
end
always begin
    #25 b = 1;
end
endmodule
```
### Expected Result
```
Initial a=0 b=0
After a=1: a=1 b=0
After b=1: a=1 b=1
After wait: a=1 b=1
```er
```
module test;
reg a;
reg b;
assign #25 a = 0;
assign #25 b = 0;
always begin
    #10 a = 1;
    #10 b = 1;
end
endmodule
```
### Result
![Schematic of the test bench](https://www.a-b-c.com/images/3.png)/0_Basic_Verilog/11_Using_the_forever_statement_