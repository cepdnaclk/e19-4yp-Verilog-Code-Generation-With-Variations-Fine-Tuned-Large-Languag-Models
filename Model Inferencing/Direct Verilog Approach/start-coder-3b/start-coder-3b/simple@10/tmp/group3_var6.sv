```verilog
module full_adder1(i1, i2, cin, sum, cout);
input i1, i2, cin;
outout sum, cout;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
```
#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.

### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


### Base Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule


#### Expected Behaviour:
The simulator should halt with an error message because "cout" is a logic vector and cannot be used in a "wire" assignment.

#### Actual Behavior:
The simulator has no errors and the testbench terminates without any error messages.


/lab01/lab1/README.md
# lab1.2020

## Setup

Copy the testbench code to the `lab1` directory.

```bash
cp ~/Desktop/testbench.sv lab1
```

## Task-1

Implement the full adder using logic gates in Verilog.

```verilog
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
// todo: implement the full adder here
endmodule
```


Open the test bench file in the IDE and run the test bench.

```verilog
module test_full_adder;

reg a, b, c;
reg sum, cout;

full_adder adder(a, b, c, sum, cout);
initial begin
	$monitor($time, "a=%b b=%b c=%b sum=%b cout=%b", a, b, c, sum, cout);
	a = 0; b = 0; c = 0;
	#1;
	a = 0; b = 1; c = 1;
	#1;
	a = 1; b = 0; c = 1;
	#1;
	a = 1; b = 1; c = 1;
	#10000;
end
endmodule
```


## Task-2

Implement the half adder using logic gates in Verilog.

```verilog
module half_adder(i1, i2, sum, cout);
input i1, i2;
output sum, cout;
// todo: implement the half adder here
endmodule
```

Similarly use the test bench to test your half adder.

```verilog
module test_half_adder;

reg a, b;
reg sum, cout;

half_adder adder(a, b, sum, cout);
initial begin
	$monitor($time, "a=%b b=%b sum=%b cout=%b", a, b, sum, cout);
	a = 0; b = 0;
	#1;
	a = 0; b = 1;
	#1;
	a = 1; b = 0;
	#1;
	a = 1; b = 1;
	#10000;
end
endmodule
```

## Task-3

Implement the XOR gate using the full adder and half adder in Verilog.

```verilog
module xor(i1, i2, sum, cout);
input i1, i2;
output sum, cout;
// todo: implement the xor gate here
endmodule
```

Similarly use the test bench to test your XOR.

```verilog
module test_xor;

reg a, b;
reg sum, cout;

xor adder(a, b, sum, cout);
initial begin
	$monitor($time, "a=%b b=%b sum=%b cout=%b", a, b, sum, cout);
	a = 0; b = 0;
	#1;
	a = 0; b = 1;
	#1;
	a = 1; b = 0;
	#1;
	a = 1; b = 1;
	#10000;
end
endmodule
```

## Task-4

Implement the full adder using RTL implementation in Verilog.

```verilog