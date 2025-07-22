```verilog
initial begin
	// Define AND plane connections (input -> product term)
	mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
	mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
	mand[9]=4'b1111;
	// Define OR plane connections (product term -> output)
	// Format: 9 bits for p1-p9 connections for each output c1-c4
	mor[1]=9'b101000101; // Connections for c1
	mor[2]=9'b011101110; // Connections for c2
	mor[3]=9'b000011010; // Connections for c3
	mor[4]=9'b000000001; // Connections for c4
	// Instantiate PLA using system tasks
	$async$and$array(mand, {b1,b0,a1,a0}, {p1,p2,p3,p4,p5,p6,p7,p8,p9}); // Corrected input order?
	$async$or$array(mor, {p1,p2,p3,p4,p5,p6,p7,p8,p9}, {c4,c3,c2,c1}); // Corrected output order?
end
```
### Results:
![Array-based (modified)](./images/1x2-PLA-array-based-modified.png)
/projects/10/README.md
# Project 10: Dynamic Timing Analysis

## Introduction

Dynamic Timing Analysis is a method of synthesizing a design in a specified timing closure. Timing closure is defined as the relationship between the worst-case and average worst-case response times of the resulting design. This is a vital step in design verification as it is indispensable to have a method to ensure that the design will meet the timing requirements.

There are multiple methods of Dynamic Timing Analysis including the Timing Loop-up Table method, and the Timing Stitcher method.

## Timing Loop-up Table

The Timing Loop-up Table (TLUT) is one of the most commonly used Dynamic Timing Analysis (DTA) method. TLUT takes advantage of the fact that the delay of a flip-flop in a given clock period can be modeled with a pre-defined table. By using this pre-defined table, the synthesizer can infer the timing of the resulting circuit directly without performing synthesizability checks.

![TLUT](./images/tlut.png)

## Timing Stitcher

The Timing Stitcher (TS) method is an improvement to the TLUT method. In the TLUT method, the synthesizer assumes that the flip-flop has a constant delay. However, this method allows the synthesizer to analyze the flip-flop itself to determine its delay. This allows the synthesizer to get the exact delay of the flip-flop in the design.

![TS](./images/ts.png)

## Implementation

The following steps are used to make a RTL design synthesisable with TLUT and TS methods:

1. Design the RTL circuit

2. Add TLUT constraints to the design

3. Synthesize the RTL design with the TLUT method

4. Synthesize the RTL design with the TS method

5. Compare the synthesis results

## Step 1: Design the RTL circuit

This step is to design a basic RTL circuit and use a pre-defined delay model to check if the synthesis with TLUT and TS methods can yield the same design.

The RTL circuit design is as follows with the following delay model:

| Flop          | Delay (ns) |
| ------------- | ---------: |
| DFF           |      1.2   |
| NOT GATE      |      0.2   |
| AND GATE      |      0.8   |
| NAND GATE     |      1.0   |
| NOR GATE     |      1.0   |
| OR GATE      |      0.6   |
| OR-INV GATE  |      1.0   |
| DFF-INV GATE |      1.4   |
| XOR GATE     |      0.4   |
| XNOR GATE    |      0.6   |

## Step 2: Add TLUT constraints to the design

This is to add TLUT constraints to the design. The RTL circuit design is as follows:

![RTL](./images/rtl.png)

The following is the TLUT constraints design:

![TLUT](./images/tlut.png)

## Step 3: Synthesize the RTL design with the TLUT method

This is to synthesize the RTL design with the TLUT method:

![Synthesis Table with TLUT](./images/tlut-synthesis-results.png)

## Step 4: Synthesize the RTL design with the TS method

This is to synthesize the RTL design with the TS method:

![Synthesis Table with TS](./images/ts-synthesis-results.png)

## Step 5: Compare the synthesis results

This is to compare the synthesis results of both methods:

![Synthesis Results Comparison](./images/synthesis-results-comparison.png)

The comparison result shows that the synthesis results are as identical as possible.

## Conclusion

In this project, we learned how to implement Dynamic Timing Analysis with TLUT and TS methods.

## Appendix

### Base Verilog Code:
```verilog
module dff_test(clk, d, q);
 input clk;
 input d;
 output q;
  reg[1:1] q;
 initial begin
  clk = 1; #200
  d = 1; #200
  clk = 0; #200
  d = 0; #200
 end
 always @(posedge clk) begin
  q <= d;
 end
endmodule

module not_test(a, b);
 input [1:1] a;
 output [1:1] b;
 always @* begin
  b = ~a;
 end
endmodule
```
### TLUT Constraints:
```verilog
module tlut_constraints(clk, dff, not, a, b, c, d);
 input clk;
 input dff;
 input not;
 input a, b;
 output c, d;
  assign c = dff;
  assign d = not;
 endmodule
```
### TLUT Constraints (modified):
```verilog
module tlut_constraints_modified(clk, dff, not, a, b, c, d);
 input clk;
 input dff;
 input not;
 input a, b;
 output c, d;
  assign c = dff;
  assign d = dff;
 endmodule
```
### TLUT Constraints (modified 2):
```verilog
module tlut_constraints_modified_2(clk, dff, not, a, b, dff2, c, d);
 input clk;
 input dff;
 input not;
 input a, b;
 input dff2;
 output c, d;
  reg[1:1] dff_value;
  assign c = dff;
  assign d = dff2;
 endmodule
```
### TLUT Constraints (modified 3):
```verilog
module tlut_constraints_modified_3(clk, dff_1, dff_2, not_1, not_2, a, b, c, d);
 input clk;
 input dff_1;
 input dff_2;
 input not_1;
 input not_2;
 input a, b;
 output c, d;
  assign c = dff_2;
  assign d = not_2;
 endmodule
```
### TLUT Constraints (modified 4):
```verilog
module tlut_constraints_modified_4(clk, dff, not, a, b, c, d);
 input clk;
 input dff;
 input not;
 input a, b;
 output c, d;
  assign c = dff;
  assign d = dff;
 endmodule
```
### TLUT Constraints (modified 5):
```verilog
module tlut_constraints_modified_5(clk, dff, not, a, b, c, d);
 input clk;
 input dff;
 input not;
 input a, b;
 output c, d;
  assign c = dff;
  assign d = dff;
 endmodule
```
###