module latch (input d, c, output q, q_b );
packed union u_q {
reg [7:0] i;
reg [7:0] j;
} q_packed;
q_packed q;
q_packed q_packed_b;
always begin
wait ( c );
q.i = d;
q_packed_b.i = d;
end
endmodule
### Testbench:
// Testing Latch //
module tb;
input clk;
input q_b, q;
reg d, c;

reg [7:0] q_b_out;
reg [7:0] q_out;

latch i_latch (.d(d),.c(c),.q(q),.q_b(q_b));

always begin
q_b_out = q_b;
q_out = q;
end
endmodule
### Simulation Results:
To test for a correct output, we must compare the output of our modified
design (q) and that of the base design (q_b). We also must be able to test
both output types, i, and j. We do this by comparing the output register (q)
to the second output variable (q_b).
The first output that is compared to the base output (q) is a regular output
register.
![](./images/11_1/image23.png)
We see that the two outputs (q and q_b) are identical, with the exception of
the data type. Notice that when data is written to the output register,
q_b also changes. This is because q is a regular output register and q_b
is an output variable.
![](./images/11_1/image24.png)
The second output that is compared to the base output (q) is a packed union.
![](./images/11_1/image25.png)
We see that the two outputs (q and q_b) are different, with the exception
of the type. Notice that when data is written to the output register,
q_b also changes. This is because q is a regular output register and q_b
is an output variable.
s:
The output of the first module is not the output of the second module.
![](./images/16_0/image48.png)
#### Testbench:
The testbench for this example has two inputs.

The testbench first writes a value to the first input register (a), and
then reads the output from the second input register (b).

![](./images/16_0/image49.png)

### Testbench Code:
module tb;

reg [15:0] a;
reg [15:0] b;
reg clk;
reg rstn;
reg done;

add3 i_add3 (.a(a),.b(b),.c(b),.done(done),.sum(b));

always #5 clk = ~clk;

always #5 rstn = ~rstn;

endmodule

### Simulation Results:
![](./images/16_0/image50.png)
#### Explanation:
The output of the first module is not the output of the second module. The
output of the first module is different from the output of the second.
# Chapter 16: Combinational Logic

### Module:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );
always begin
sum = a + b + c;
end
endmodule
### Combinational Module:
### Base Verilog Code:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

always @ ( a, b, c ) begin
sum = a + b + c;
end
endmodule
### Combinational Testbench:
// Test for Combinational Logic //
module tb;

reg [15:0] a;
reg [15:0] b;
reg [15:0] c;
reg done;

// instantiate the add3 module
add3 i_add3 ( a, b, c, b, done );

// write a value to input register a
assign a = 0x1234;

// wait until the done signal is
// high, then read the signal value from register b
always @ ( negedge done ) begin
$display ( "Output Sum = 0x%x", b );
end

endmodule
### Simulation Results:
![](./images/16_0/image12.png)
#### Explanation:
The output of the first module is not the output of the second module. The
output of the first module is different from the output of the second.
### Module:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

always begin
sum = a + b;
end

assign c = a + b;

always @ ( a, b ) begin
done = a + b + c;
end

endmodule
### Combinational Module:
### Base Verilog Code:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

assign c = a + b;

always @ ( a, b ) begin
done = a + b + c;
end

endmodule
### Combinational Testbench:
// Test for Combinational Logic //
module tb;

reg [15:0] a;
reg [15:0] b;
reg [15:0] c;
reg done;

// instantiate the add3 module
add3 i_add3 ( a, b, c, b, done );

// write a value to input register a
assign a = 0x1234;

// wait until the done signal is
// high, then read the signal value from register b
always @ ( negedge done ) begin
$display ( "Output Sum = 0x%x", b );
end

endmodule
### Simulation Results:
![](./images/16_0/image13.png)
#### Explanation:
The output of the first module is the same as the output of the second.
### Module:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

always begin
sum = a + b;
end

assign c = a + b;

always @ ( a, b, c ) begin
done = a + b + c;
end

endmodule
### Combinational Module:
### Base Verilog Code:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

assign c = a + b;

always @ ( a, b, c ) begin
done = a + b + c;
end

endmodule
### Combinational Testbench:
// Test for Combinational Logic //
module tb;

reg [15:0] a;
reg [15:0] b;
reg [15:0] c;
reg done;

// instantiate the add3 module
add3 i_add3 ( a, b, c, b, done );

// write a value to input register a
assign a = 0x1234;

// wait until the done signal is
// high, then read the signal value from register b
always @ ( negedge done ) begin
$display ( "Output Sum = 0x%x", b );
end

endmodule
### Simulation Results:
![](./images/16_0/image14.png)
### Module:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

assign c = a + b + 1;

always @ ( a, b, c ) begin
done = a + b + c;
end

endmodule
### Combinational Module:
### Base Verilog Code:
module add3 ( input [15:0] a, input [15:0] b, input [15:0] c,
output [15:0] sum, output done );

assign c = a + b +