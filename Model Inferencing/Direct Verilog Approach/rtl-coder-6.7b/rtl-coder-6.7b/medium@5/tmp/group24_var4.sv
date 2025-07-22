Verilog HDL Program

module dff_p(
output do,
input di,
input clk);
reg [3:0] d,q;
assign do = q; //assigning output signal
assign q = {d,di} ^ {d[3],di}; // assigning input signal to output signal
always @(posedge clk)
if (di) d <= 5'b000000;
else d <= {d[2:0],di};
endmodule

module tst_dff_p_b();
reg di,clk;
wire do;
dff_p d1(do,di,clk);
initial begin clk=0; di=1'b0; #35 $stop; end

initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule

### Description (modified file):
In the above modified code, we have added an if condition and an else condition in module dff_p. The if condition checks if the di is true, and in that case, the value of d is set to 5’b000000. While the else condition checks if the di is false and in that case, the value of d is set to the value of d before the di bit is added to the value. The procedural assign is used to assign the value of input signals to output signals.

### Output:

### Question 1:
What circuit elements are used in the given schematic?

### Answer:
The components used in the schematic are a transistor and a power supply.

### Question 2:
Analyze the circuit diagram and answer the following questions:

Which power supply is used in the circuit?

### Answer:
Vcc

### Question 3:
Why does it matter which power supply is used for the circuit, if the circuit works at any power supply?

### Answer:
When the circuit operates on a power supply other than the supply used for the circuit, it may not operate as intended.

### Question 4:
List all the elements that affect the operation of the circuit, and give an example for each item.

### Answer:
The circuit may malfunction if there is a defective transistor or a supply voltage that is too high or too low.

### Question 5:
The current in the two resistors is the same when the circuit is turned on. Why is this the case?

### Answer:
The equivalent resistance between the two points where the resistors are connected is the sum of the value of the resistors.

### Question 6:
The circuit operates correctly in the limit of small voltages. What is the reason for this?

### Answer:
The small-signal approximation is assumed in the analysis of circuits. The small-signal approximation is a simplified model that enables the analysis and design of linear circuits.

### Question 7:
Analyze the circuit. Does it work? If not, explain why. (Hint: What is the current in C?)

### Answer:
The circuit should work if the current in C is 0. Because the current in C is 0, the voltage across the resistor is also 0. According to Kirchhoff’s voltage law, the sum of all the voltages around a loop must be 0.

## Solution:

The circuit should work if the current in C is 0. Because the current in C is 0, the voltage across the resistor is also 0. According to Kirchhoff's voltage law, the sum of all the voltages around a loop must be 0.

## Verilog Code:

Verilog HDL Program
module v26(
input vdd,
input vss,
input en,
input clk10,
output signal_out
);
reg signal_in,clk100;
reg [11:0] signal_reg1;

always @ (posedge clk10) begin
clk100 <= ~clk100;
end
always @ (posedge clk10) begin
signal_reg1 <= {signal_reg1 [10:1], clk100};
end

assign signal_in = signal_reg1 [10];

always @ (posedge en or posedge vdd)
begin
if (en == 1'b1) begin
signal_out = signal_in;
end
end
endmodule

## Description (file):

In the above Verilog code, we have used a register array to represent the 100-bit signal. We have used the register array as a 2-bit shift register, which shifts the signal left after every clock edge. The signal is shifted left by 1 bit.

## Output:

## Verilog Code:

Verilog HDL Program
module v26(
input vdd,
input vss,
input en,
input clk10,
output signal_out
);
reg signal_in,clk100;
reg [11:0] signal_reg1;

always @ (posedge clk10) begin
clk100 <= ~clk100;
end
always @ (posedge clk10) begin
signal_reg1 <= {signal_reg1 [10:1], clk100};
end

assign signal_in = signal_reg1 [10];

always @ (posedge en or posedge vdd)
begin
if (en == 1'b1) begin
signal_out = signal_in;
end
end
endmodule

## Description (file):

In the above Verilog code, we have used a register array to represent the 100-bit signal. We have used the register array as a 2-bit shift register, which shifts the signal left after every clock edge. The signal is shifted left by 1 bit.

## Output:

## Verilog Code:

Verilog HDL Program
module v26(
input vdd,
input vss,
input en,
input clk10,
output signal_out
);
reg signal_in,clk100;
reg [11:0] signal_reg1;

always @ (posedge clk10) begin
clk100 <= ~clk100;
end
always @ (posedge clk10) begin
signal_reg1 <= {signal_reg1 [10:1], clk100};
end

assign signal_in = signal_reg1 [10];

always @ (posedge en or posedge vdd)
begin
if (en == 1'b1) begin
signal_out = signal_in;
end
end
endmodule

## Description (file):

In the above Verilog code, we have used a register array to represent the 100-bit signal. We have used the register array as a 2-bit shift register, which shifts the signal left after every clock edge. The signal is shifted left by 1 bit.

## Output:

## Conclusion:

The above Verilog code demonstrates how a shift register can be implemented in Verilog HDL using registers. The shift register is a circuit that shifts the signal on it to the left after every clock edge.

## Question:

Verilog code for the first circuit-based project that uses the multiplier-4 module in the above Verilog code.

### Verilog Code:

module multiplier4(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Solution:

Verilog HDL Program
module v20(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Conclusion:

The Verilog code for the multiplier-4 module is given above.

## Question:

Verilog code for the second circuit-based project that uses the multiplier-16 module.

### Verilog Code:

module multiplier16(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Solution:

Verilog HDL Program
module v21(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Conclusion:

The Verilog code for the multiplier-16 module is given above.

## Question:

Verilog code for the third circuit-based project that uses the multiplier-1K module.

### Verilog Code:

module multiplier1k(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Solution:

Verilog HDL Program
module v22(
input a,
input b,
output sum
);
assign sum = a*b;
endmodule

## Conclusion:

The Verilog code for the multiplier-