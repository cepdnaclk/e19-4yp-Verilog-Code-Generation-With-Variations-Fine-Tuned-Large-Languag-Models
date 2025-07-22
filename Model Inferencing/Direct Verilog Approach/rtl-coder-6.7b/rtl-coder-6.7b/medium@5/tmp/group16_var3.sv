module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
input  [0:1] s2,
output reg [3:0] y
);
wire [2:0] sa3;
always @(*);
if(s == 0)
y = a;
else if(s[1:0] == 00)
y = a;
else if(s[1:0] == 01)
y = b;
else if(s[1:0] == 10)
y = b;
endmodule
### Hierarchy:

// Module structure of the design
### Hierarchy:

// Module structure of the modified design
### Simulation result:

## 17.2.4.3 Exercise 3 - Add 2D array to the module

### Base Verilog Code:

module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else
y = b;
endmodule
### Variation Instruction:
Add 2D array to the module
### Modified Code: