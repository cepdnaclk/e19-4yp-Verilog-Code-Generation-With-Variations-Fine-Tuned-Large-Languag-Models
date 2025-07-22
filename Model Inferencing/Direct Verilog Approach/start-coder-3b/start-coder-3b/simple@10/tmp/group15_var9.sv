Now a 5 bit signed number is added to an 8 bit value. The sum is then written to an 8 bit value.
The expected output is sign extended to 8 bits and the expected output is the sum.
module alu(
input T in1,
input T in2,
input T in3,
input T in4,
input T in5,
input T in6,
input T in7,
input T in8,
output T out
) ;
assign out = in1 + in2 + in3 + in4 + in5 + in6 + in7 + in8;
endmodule
module sw2led3 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule
module alu_tb(
input [7:0] a,
input [7:0] b,
input [7:0] c,
input [7:0] d,
input [7:0] e,
input [7:0] f,
input [7:0] g,
input [7:0] h,
input [7:0] out
) ;
alu u_alu(.in1 (a),.in2 (b),.in3 (c),.in4 (d),.in5 (e),.in6 (f),.in7 (g),.in8 (h),.out (out) );
sw2led3 u_led (.sw (out),.ld (o) );
endmodule

## Signed Arithmetic Operations

The sign of the result is the sign of the first operand, and so if both operands are negative the result is negative. Otherwise, the result is positive.

## Sign Extension

### Sign Extension Signals

To simulate a sign extension we will use a special kind of signal called a combinatorial logic signal. The combinatorial signal is a signal that changes only on the rising edge of the clock, and is driven to the value of the signal on the rising edge.

The purpose of a combinatorial signal is to represent a signal that is subject to a finite range, and whose value does not change for a while after it is first changed.

### Combinational Logic Gates

To simulate a combinatorial logic design we will use combinational logic gates. Each combinational logic design is made up of a number of combinational logic gates, which are made up of logic gates.

The logic gates that we will use for combinational logic are:

• NOT
• AND
• OR
• X-OR
• NAND
• NOR
• XNOR

### Sign Extension

Suppose we have a 32-bit number. We can represent that number in 8 bits in a unsigned manner, like this:

```    11111111111111111111111111111111
```

We can represent that same number in 8 bits in a signed manner, like this:

```    11111111111111111111111111111111
```

Note that the 32-bit value represents a 8-bit signed value.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate. The output is just the same as the input value when the input is zero. If the input is a one, then the output of the NOT (XNOR) gate is the complement of the input value.

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

In this case, the output is a one when the input is a zero, and a zero otherwise.

### Sign Extension

We can sign extend a 32-bit unsigned value to a 8-bit signed value by using a NOT (XNOR) gate.

In this case, the output is a one when the input