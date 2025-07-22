module mux41b (
input wire [3:0] a, 
input wire [3:0] b,
input wire [1:0] sel,
output wire c
);
assign c = a;
always @(*) begin
case (sel)
3'b000: c = a;
3'b001: c = b;
3'b010: c = a+b;
3'b011: c = a|b;
3'b100: c = a&b;
3'b101: c = ~a&~b;
3'b110: c = ~a|~b;
3'b111: c = ~a&b|~a&~b;
default: c = c;
endcase
end
endmodule

# Multiplexer

A multiplexer is a device that selects among multiple inputs and outputs depending on the control wires. The control wires determine which input to select and how to combine the outputs. In a 4-to-1 multiplexer, four inputs are combined in an AND, an OR, or a NOT operation and the output is sent to one of four outputs.

The truth table for a 4-to-1 multiplexer may look like this:

Multiplexer Truth Table
Input a Output c
0 0 c
0 1 c
1 0 c
1 1 c

Notice that the table consists of a function of two inputs, and a single output. The 1-to-1 multiplexer is simply one of many possible multiplexers.

## Multiplexer Circuit

Here you can see a simple 4-to-1 multiplexer (a 4-input to 1-output switch) with a simplified schematics.

Here is a table of truth table of a 4-to-1 multiplexer

Multiplexer Truth Table
Input a Output c
0 0 c
0 1 c
1 0 c
1 1 c

Note that the table consists of a function of two inputs, and a single output.

## Multiplexer Verilog Code

Here is a Verilog code that implements a 4-to-1 multiplexer:

module mux41(
input wire a,
input wire b,
input wire c,
input wire d,
input wire sel,
output reg dout
);
always @(*)
begin
case (sel)
2'b00:
dout = a;
2'b01:
dout = b;
2'b10:
dout = c;
2'b11:
dout = d;
default:
dout=dout;
endcase
end
endmodule

In this code we have a module called mux41 that has four inputs: a,b,c,d. This module has one output, dout. Finally, there is one input, sel.

Now, we can use this module with a tester named tester_41b to test it.

module tester_41b;
reg a,b,c,d,sel;
reg dout;
mux41 mux41(a,b,c,d,sel,dout);

always #5 a = 1'b0;
always #5 b = 1'b0;
always #4 c = 1'b1;
always #7 d = 1'b0;
always #3 sel = 2'b00;
endmodule

In the code above, we generate the truth table for each of the input values. These values can be altered after each test is completed. The tester outputs a value for the output dout whenever a test is completed.

Run the tester, and see the output values of dout for the given input values sel=2'b00, 2'b01, 2'b10, and 2'b11.

# D Flip-Flop with JK

A D flip-flop is an electronic circuit that has state and output. It has one input, the D (data) input, which stores a value. It has two inputs, the J and K inputs, which control the value of the data input. The J input is enabled by default (1), and is used to set the value of the data input to a high value (1).

In the truth table below, a D flip-flop has one input, the data input (D), which stores a value. It has two inputs, the J and K inputs, which control the value of the data input. The J input is enabled by default (1), and is used to set the value of the data input to a high value (1).

D Flip-Flop JK Truth Table
D J K Output
0 0 0 0
0 0 1 0
0 1 0 1
0 1 1 1
1 0 0 1
1 0 1 0
1 1 0 0
1 1 1 0

When the J input is high (J=1), the D input is used to set the output (Q=1). When the K input is high (K=1), the D input is used to reset the output (Q=0). When both the J and K inputs are high together (J=K=1), the output is unchanged (Q=Q). When the J and K inputs are low together (J=K=0), the data input is ignored (Q=D).

So, if you have a D flip-flop with a data input (D), and an enable input (E=1), then there is a J input (J=1) for setting the output (Q=1), and K input (K=1) for resetting the output (Q=0).

## D Flip-Flop with JK Output

Here is a 4-bit D flip-flop with JK output.

Here is a 1-bit D flip-flop with JK output.

## D Flip-Flop Verilog Code

Here is a D flip-flop with JK verilog code:

module dffjk(
input wire d,
input wire e,
input wire j,
input wire k,
output reg q
);

always@*  begin
if (e==1)
q <= d;
end

always@* begin
if (e==1)
if (j==1)
q <= 1'b1;
else if (k==1)
q <= 1'b0;
end
end

endmodule`

Notice that the D flip-flop with JK has two outputs, the enable (E), which is set by the default enable (E=1), and the data (D).

When you want to use the D flip-flop with JK, you must pass the enable input (E=1) and enable the output (Q=1).

# D Flip-Flop with T

A D flip-flop is an electronic circuit that has state and output. It has one input, the D (data) input, which stores a value. It has one input, the T input, which controls the value of the data input. The T input is enabled by default (1), and is used to set the value of the data input to a high value (1).

In the truth table below, a D flip-flop has one input, the data input (D), which stores a value. It has one input, the T input, which controls the value of the data input. The T input is enabled by default (1), and is used to set the value of the data input to a high value (1).

D Flip-Flop T Truth Table
D T Output
0 0 0
0 1 1
1 0 0
1 1 1

When the T input is high (T=1), the D input is used to set the output (Q=1). When the T input is low (T=0), the D input is ignored (Q=D). The D flip-flop with T has the same inputs as the D flip-flop with JK, but it has a different output.

## D Flip-Flop with T Output

Here is a 4-bit D flip-flop with T output.

Here is a 1-bit D flip-flop with T output.

## D Flip-Flop with T Verilog Code

Here is a D flip-flop with T verilog code:

module dfft(
input wire d,
input wire t,
output reg q
);
always@*  begin
if (t==1)
q <= d;
end
endmodule

Notice that the D flip-flop with T has one output, the enable (E), which is set by the default enable (T=1), and the data (D).

When you want to use the D flip-flop with T, you must pass the enable