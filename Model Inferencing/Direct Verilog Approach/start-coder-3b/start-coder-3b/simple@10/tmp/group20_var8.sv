module latch (input d, c, output [7:0] q, q_b );
```

## 3) Verilog code:
```
/**
 * Description:
 *  This is a basic latch using two signals
 *  d and clock c.
 */

module latch (
	input d,
	input c,
	output reg q,
	output q_b
);

always begin
	wait ( c );
end

endmodule
```

## 4) Running the code
```
bash-3.2$./run.sh
```
/2/README.md
# Week 2

## Problem 1

### 1) Verilog code (part 1):
```
/**
* Description:
*  This is an adder circuit
*  with 2 2-bit inputs and 
*  one 4-bit output.
**/
module adder(
	input [1:0] a,
	input [1:0] b,
	output [3:0] c
);

reg [1:0] c0;
reg [1:0] c1;
reg [1:0] c2;
reg [1:0] c3;
reg [1:0] c4;
reg [1:0] c5;
reg [1:0] c6;
reg [1:0] c7;

always begin
	c0 = a[1] xor b[1];
	c1 = ~a[1] & b[1];
	c2 = a[1] & ~b[1];
	c3 = ~a[1] & ~b[1];
	c4 = c[3];
	c5 = ~a[0] & b[0];
	c6 = a[0] & ~b[0];
	c7 = ~a[0] & ~b[0];
	c[3:0] = c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7;
end

endmodule
```

### 2) Verilog code (part 2):
```
/**
* Description:
*  This is an adder circuit
*  with 2 2-bit inputs and 
*  one 4-bit output.
**/
module adder(
	input [1:0] a,
	input [1:0] b,
	output [3:0] c
);

reg [1:0] c0;
reg [1:0] c1;
reg [1:0] c2;
reg [1:0] c3;
reg [1:0] c4;
reg [1:0] c5;
reg [1:0] c6;
reg [1:0] c7;

always begin
	c0 = a[1] xor b[1];
	c1 = ~a[1] & b[1];
	c2 = a[1] & ~b[1];
	c3 = ~a[1] & ~b[1];
	c4 = c[3];
	c5 = ~a[0] & b[0];
	c6 = a[0] & ~b[0];
	c7 = ~a[0] & ~b[0];
	c[3:0] = c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7;
end

endmodule
```

### 3) Verilog code (part 3):
```
/**
* Description:
*  This is an adder circuit
*  with 2 2-bit inputs and 
*  one 4-bit output.
**/
module adder(
	input [1:0] a,
	input [1:0] b,
	output [3:0] c
);

reg [1:0] c0;
reg [1:0] c1;
reg [1:0] c2;
reg [1:0] c3;
reg [1:0] c4;
reg [1:0] c5;
reg [1:0] c6;
reg [1:0] c7;

always begin
	c0 = a[1] xor b[1];
	c1 = ~a[1] & b[1];
	c2 = a[1] & ~b[1];
	c3 = ~a[1] & ~b[1];
	c4 = c[3];
	c5 = ~a[0] & b[0];
	c6 = a[0] & ~b[0];
	c7 = ~a[0] & ~b[0];
	c[3:0] = c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7;
end

endmodule
```

### 4) Verilog code (part 4):
```
/**
* Description:
*  This is an adder circuit
*  with 2 2-bit inputs and 
*  one 4-bit output.
**/
module adder(
	input [1:0] a,
	input [1:0] b,
	output [3:0] c
);

reg [1:0] c0;
reg [1:0] c1;
reg [1:0] c2;
reg [1:0] c3;
reg [1:0] c4;
reg [1:0] c5;
reg [1:0] c6;
reg [1:0] c7;

always begin
	c0 = a[1] xor b[1];
	c1 = ~a[1] & b[1];
	c2 = a[1] & ~b[1];
	c3 = ~a[1] & ~b[1];
	c4 = c[3];
	c5 = ~a[0] & b[0];
	c6 = a[0] & ~b[0];
	c7 = ~a[0] & ~b[0];
	c[3:0] = c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7;
end

endmodule
```

### 5) Verilog code (part 5):
```
/**
* Description:
*  This is an adder circuit
*  with 2 2-bit inputs and 
*  one 4-bit output.
**/
module adder(
	input [1:0] a,
	input [1:0] b,
	output [3:0] c
);

reg [1:0] c0;
reg [1:0] c1;
reg [1:0] c2;
reg [1:0] c3;
reg [1:0] c4;
reg [1:0] c5;
reg [1:0] c6;
reg [1:0] c7;

always begin
	c0 = a[1] xor b[1];
	c1 = ~a[1] & b[1];
	c2 = a[1] & ~b[1];
	c3 = ~a[1] & ~b[1];
	c4 = c[3];
	c5 = ~a[0] & b[0];
	c6 = a[0] & ~b[0];
	c7 = ~a[0] & ~b[0];
	c[3:0] = c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7;
end

endmodule
```

### 6) Verilog code (part 6):
```
/**
* Description: