module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1;
initial
begin
e = a && b;
f = c && d;
g1 = e || f;
g = ~g1;
end
endmodule
### Performance Analysis:
Performance analysis of the modified code:
The performance of the code is 0 ns delay for 8ns clock input. The time delay of the code is 0 ns for 8ns clock input.

# Assignment 6: Parametric RTL Design
# Module 1: Parametric RTL Design
In this assignment, we are designing a module using three input and 2 output using a block diagram. The inputs are a,b,c and d, which are inputs to the module. The outputs are g,h.

## Design of Module 1
## Base Verilog Code:
module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1;
assign g = a || b;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c,d and the outputs g,h. The inputs are given using a block diagram and the outputs are given using a block diagram. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c,d);
output g, h;
input a,b,c,d;
wire e,f,g1;
assign g = a || b;
assign h = c && d;
endmodule

# Module 2: Parametric RTL Design
In this assignment, we are designing a module using 3 inputs and 1 output (g) using a block diagram. The inputs are a,b,c, which are inputs to the module. The output is given using a block diagram.

## Design of Module 2
## Base Verilog Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire d;
assign d = a && b && c;
assign g = d;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c and the output g. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire e,f,g1;
assign g = a || b || c;
endmodule

# Module 3: Parametric RTL Design
In this assignment, we are designing a module using 6 inputs and 2 outputs using a block diagram. The inputs are a,b,c,d,e,f and d is given using a block diagram and the outputs are g and h using a block diagram.

## Design of Module 3
## Base Verilog Code:
module aoi2(g,h,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1,k;
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign k = a || b || c || d;
assign g = g1 && k;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c,d,e,f and the outputs g and h. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,h,a,b,c,d);
output g, h;
input a,b,c,d;
wire e,f,g1,k;
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign k = a || b || c || d;
assign g = g1 && k;
endmodule

# Module 4: Parametric RTL Design
In this assignment, we are designing a module using 3 inputs and 1 output (g) using a block diagram. The inputs are a,b,c, which are inputs to the module. The output is given using a block diagram.

## Design of Module 4
## Base Verilog Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire d;
assign d = a && b && c;
assign g = d;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c and the output g. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire e,f,g1;
assign g = a || b || c;
endmodule

# Module 5: Parametric RTL Design
In this assignment, we are designing a module using 3 inputs and 1 output (g) using the inputs are given using a block diagram and the outputs are given using a block diagram.

## Design of Module 5
## Base Verilog Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire d;
assign d = a && b && c;
assign g = d;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c and the output g. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire e,f,g1;
assign g = a || b || c;
endmodule

# Module 6: Parametric RTL Design
In this assignment, we are designing a module using 2 inputs and 2 outputs using a block diagram. The inputs are a,b, which are inputs to the module. The outputs are given using a block diagram.

## Design of Module 6
## Base Verilog Code:
module aoi2(g,h,a,b);
output g;
input a,b;
wire c;
assign c = a && b;
assign g = c;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b and the outputs g and h. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,h,a,b);
output g, h;
input a,b;
wire c;
assign c = a && b;
assign g = c;
endmodule

# Module 7: Parametric RTL Design
In this assignment, we are designing a module using 3 inputs and 1 output using a block diagram. The inputs are a,b,c, which are inputs to the module. The output is given using a block diagram.

## Design of Module 7
## Base Verilog Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire d;
assign d = a && b && c;
assign g = d;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c and the output g. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire e,f,g1;
assign g = a || b || c;
endmodule

# Module 8: Parametric RTL Design
In this assignment, we are designing a module using 3 inputs and 1 output (g) using a block diagram. The inputs are a,b,c, which are inputs to the module. The output is given using a block diagram.

## Design of Module 8
## Base Verilog Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire d;
assign d = a && b && c;
assign g = d;
endmodule
## Variation Instruction:
A block diagram with the inputs a,b,c and the output g. The instance of the module is given using the same block diagram.
## Modified Code:
module aoi2(g,a,b,c);
output g;
input a,b,c;
wire e,f,g1;
assign g = a || b || c;
endmodule

# Module 9: Parametric RTL Design
In this assignment, we are designing a module using 5 inputs and 1 output using a block diagram. The inputs are a,b,c,d,e, which are inputs to the module. The output is given using a block diagram.
##