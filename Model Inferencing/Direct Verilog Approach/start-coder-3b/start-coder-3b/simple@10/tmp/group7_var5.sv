module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
/Homework 3/Homework 3.md
# Homework 3
## Group 13,,, 

### Problem 1
#### a.
![Alt text](p1a1.png)

#### b.
![Alt text](p1b1.png)

#### c.
![Alt text](p1c1.png)

### Problem 2
#### a.
![Alt text](p2a1.png)

#### b.
![Alt text](p2b1.png)

#### c.
![Alt text](p2c1.png)

### Problem 3
#### a.
![Alt text](p3a1.png)

#### b.
![Alt text](p3b1.png)

#### c.
![Alt text](p3c1.png)
/Homework 7/question3.md
## 3. Design a 32-bit divider with a 3-bit control signal that uses the following table for signal assignment:

| Control     | dividend      | divisor      | result      |
|-------------|---------------|--------------|-------------|
| 000         | 00000000000000| 000000       | 000000000000 |
| 001         | 00000000000000| 000000       | 000000000000 |
| 010         | 00000000000000| 000000       | 000000000000 |
| 011         | 00000000000000| 000000       | 000000000000 |
| 100         | 00000000000000| 000000       | 000000000000 |
| 101         | 00000000000000| 000000       | 000000000000 |
| 110         | 00000000000000| 000000       | 000000000000 |
| 111         | 00000000000000| 000000       | 000000000000 |

### Verilog Code

#### Divider
```verilog
//Divider module
module divider_core(
	input [31:0] dividend,
	input [2:0] control,
	input [2:0] divisor,
	output [31:0] result
);

always @ (posedge control)
	if (control == 0)
		result <= 0;
	else
		result <= {divisor, dividend[31:0]};
end

endmodule
```
/Homework 3/question2.md
## 2. Design a two-stage pipelined multiplier that uses the following table for signal assignment:

| Control     | A             | B             | Product      |
|-------------|---------------|---------------|--------------|
| 000         | 0             | 0             | 0            |
| 001         | 0             | 0             | 0            |
| 010         | 0             | 0             | 0            |
| 011         | A[19:0]       | B[19:0]       | A[19:0] x B[19:0] |
| 100         | A[31:20]      | B[31:20]      | A[31:20] x B[31:20] |
| 101         | A[31:0]       | B[31:0]       | A[31:0] x B[31:0] |
| 110         | A[31:20]      | B[19:0]       | A[31:20] x B[19:0] |
| 111         | A[31:0]       | B[31:20]      | A[31:0] x B[31:20] |

### Verilog Code
#### Multiplier
```verilog
// Multiplier module
module multiplier_core(
	input [31:0] A,
	input [31:0] B,
	input [2:0] control,
	output [63:0] product
);

always @ (posedge control)
	if (control == 0)
		product <= {A, B};
	else if (control == 1)
		product <= {A[31:20], B[19:0]};
	else if (control == 2)
		product <= {A[31:0], B[31:0]};
	else if (control == 3)
		product <= {A[31:20], B[19:0]};
	else if (control == 4)
		product <= {A[31:0], B[31:20]};
	else if (control == 5)
		product <= {A[31:0], B[31:0]};
	else if (control == 6)
		product <= {A[31:20], B[31:20]};
	else if (control == 7)
		product <= {A[31:0], B[31:20]};
end

endmodule
```
#### Two-Stage Pipeline
```verilog
// Two-Stage Pipeline module
module mul_2stg(
	input [31:0] A,
	input [31:0] B,
	input [2:0] control,
	output [63:0] product
);

reg [63:0] A_buffer = {A, 0};
reg [63:0] B_buffer = {B, 0};
reg [2:0] control_buffer = 0;

assign control_buffer = control;

assign product = {A_buffer[31:20], B_buffer[31:20]};
always @ (posedge control)
	if (control == 0)
		product <= {A_buffer[31:0], B_buffer[31:0]};
	else if (control == 1)
		B_buffer <= {A_buffer[31:0], B[31:20]};
	else if (control == 2)
		A_buffer <= {A[31:0], B[31:0]};
	else if (control == 3)
		B_buffer <= {A[31:0], B[31:20]};
	else if (control == 4)
		A_buffer <= {A[31:0], B[31:0]};
	else if (control == 5)
		B_buffer <= {A[31:20], B[31:0]};
	else if (control == 6)
		product <= {A[31:20], B[19:0]};
	else if (control == 7)
		product <= {A[31:0], B[31:20]};
end

endmodule
```
#### Combinatorial Architecture
```verilog
module multiplier(
	input [31:0] A,
	input [31:0] B,
	input [2:0] control,
	output [63:0] product
);

mul_2stg mul_inst
	(
		.A(A),
		.B(B),
		.control(control),
		.product(product)
	);

endmodule
```
#### Testbench
```verilog
module multiplier_test
(
    input [31:0] A,
    input [31:0] B,
    input [2:0] control,
    output [63:0] product
);

reg [