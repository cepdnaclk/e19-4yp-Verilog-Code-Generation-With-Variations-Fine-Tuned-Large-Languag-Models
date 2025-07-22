module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule
### Verilog Testbench Code:
module tb_dff_with_reset;
input clk;
reg dff_reset_in, dff_data_in, dff_output;
dff_with_reset dff
(
.data (dff_data_in),
.clock (clk),
.r(dff_reset_in),
.out (dff_output)
);
initial clk = 0;
initial dff_data_in = 1;
initial dff_reset_in = 0;
always #5 clk = ~clk;
initial $dumpfile("dff_with_reset.vcd"); initial$dumpvars(0,tb_dff_with_reset);
initial begin
$dumpvars(0,dff_with_reset); end endmodule ### Resultant Image: The above resultant image is shown with the help of a waveform viewer generated through the use of 'vcd' file. • In the above image, the blue and green arrows are clock. And the red arrow is the reset input. • The red arrows represent the data, reset and clock inputs. • The blue arrows represent the output. • The green arrows represent the data and the reset. • The black arrows represent the data and the clock. ### Conclusion: It is quite a simple circuit that does not need much of explanation. However, the problem is to understand with the use of a working demo, which is quite a good thing to do, it is quite easy to understand. ### References: 1. Digital Logic Design by  1.0# The Output of Half-Adder: In the previous article, we discussed the working of the 1-Bit adder. Half adders are also used in the 1-bit adder. Now, we will discuss how the half adder is built using a gate. ### Theory: Half-Adder: • A half-adder is a 1-bit adder without the carry output. • It adds two bits and gives the sum output. • It has two inputs (A,B). • It has two outputs (S,C) • Carry output: 1 if the sum is greater than 1 and 0 otherwise • Sum output: Only the least significant bit • The outputs can be written as: $$S = A \oplus B$$ $$C = A \cdot B$$ Where A and B are the two inputs, S is the sum output and C is the carry output. ### Schematic Diagram: It can be written in the following form: ### Code: module half_adder(a, b, sum, carry); input a, b; output sum, carry; wire sum; wire carry; assign sum = a ^ b; assign carry = a & b; endmodule ### Testbench Code: module tb_half_adder; input clock; wire sum_o, carry_o; half_adder half_adder1
(
.a (clock),
.b (clock),
.carry (carry_o),
.sum (sum_o)
);
initial clock = 1;
initial begin $dumpvars(0, tb_half_adder); end initial begin$finish;
endmodule

### Resultant Image:

The above resultant image is shown with the help of a waveform viewer generated through the use of 'vcd' file.

• In the above image, the blue arrows are clock.
• The red arrows represent the data, carry and the sum inputs.
• The blue arrows represent the output.
• The green arrows represent the data and the carry.
• The black arrows represent the data and the sum.

### Conclusion: It is quite a simple circuit that does not need much of explanation. However, the problem is to understand with the use of a working demo, which is quite a good thing to do.

### References:

1. Digital Logic Design by 

1.1# The Output of Full Adder: In the previous article, we discussed the working of the 1-Bit adder. Now, we will discuss how the half adder is built using a gate.

### Theory: Full-Adder:

• A full adder is a 2-bit adder without the carry output.
• It adds three bits and gives the sum output.
• It has three inputs (A,B,Cin).
• It has two outputs (S,Cout).
• Carry output: 1 if the sum is greater than 1 and 0 otherwise
• Sum output: Only the least significant bit
• The outputs can be written as: $$S = A \oplus B$$

$$C = A \cdot B$$

Where A and B are the two inputs, S is the sum output and C is the carry output.

### Schematic Diagram: It can be written in the following form:

### Code:

module full_adder(a, b, cin, sum, carry);
input a, b, cin;
output sum, carry;
wire cin_gate, sum_gate;
assign sum = a ^ b;
assign carry = a & b;
assign cin_gate = a | b | cin;
assign sum_gate = sum | carry;
endmodule

### Testbench Code:

module tb_full_adder;
input clk;
reg clock;
wire sum_o, carry_o;
full_adder full_adder1
(
.a (clk),
.b (clock),
.cin (clock),
.sum (sum_o),
.carry (carry_o)
);
initial clk = 1;
initial begin $dumpvars(0, tb_full_adder); end initial begin$finish;
endmodule

### Resultant Image:

The above resultant image is shown with the help of a waveform viewer generated through the use of 'vcd' file.

• In the above image, the blue arrows are clock.
• The red arrows represent the data, carry and the sum inputs.
• The blue arrows represent the output.
• The green arrows represent the data and the carry.
• The black arrows represent the data and the sum.

### Conclusion: It is quite a simple circuit that does not need much of explanation. However, the problem is to understand with the use of a working demo, which is quite a good thing to do.

### References:

1. Digital Logic Design by 

1.2# The Output of 4 bit Binary To BCD Converter: In the previous article, we discussed the working of the 4 bit Binary to BCD converter. Now, we will discuss how the 4-bit BCD to binary converter is built using a gate.

### Theory: 4-bit Binary to BCD Converter:

• It is a 4-bit binary to BCD converter.
• It can convert binary of 0000 to 9999 to 0000 to 9999 in a cycle.
• It takes in 4-bit binary input.
• It has 4 outputs (BCD1,BCD2,BCD3,BCD4)
• It has one input (Binary)
• The outputs can be calculated using the following equation:

BCD = Binary/1000

### Schematic Diagram: It can be written in the following form:

### Code:

module bcd_to_bin(binary[3:0],BCD1[3:0],BCD2[3:0],BCD3[3:0],BCD4[3:0]);
input [3:0]binary;
output [3:0]BCD1,BCD2,BCD3,BCD4;

bcd_to_bin bcd_to_bin_1
(
.binary (binary),
.BCD1 (BCD1),
.BCD2 (BCD2),
.BCD3 (BCD3),
.BCD4 (BCD4)
);
endmodule

### Testbench Code:

module tb_bcd_to_bin;
reg [3:0]bin;
bcd_to_bin bcd_to_bin_1
(
.binary (bin),
.BCD1 (bin),
.BCD2 (bin),
.BCD3 (bin),
.BCD4 (bin)
);
initial bin = 0;
initial begin $dumpvars(0, tb__bcd_to_bin); end initial begin$finish;
endmodule

### Resultant Image:

The above resultant image is shown with the help of a waveform viewer generated through the use of 'vcd' file.

• In the above image, the blue arrows are clock.
• The red arrows represent the data, BCD1,BCD2,BCD3 and BCD4.
• The blue arrows represent the output.
• The green arrows represent the data and the BCD1.
• The black arrows represent the data and the BCD2.
• The yellow arrows represent the data and the B