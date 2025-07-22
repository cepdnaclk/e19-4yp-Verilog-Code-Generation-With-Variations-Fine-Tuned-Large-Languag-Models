#### Variant 1
module aoi2_1a(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
initial begin
wire a3,b3,c3,d3,e3;
a3=a1 && b1;
b3=c1 && d1;
c3=a2 && b2;
d3=c2 && d2;
assign e3=a3 || b3;
assign g=e3 && a3 || c3 || d3;
end
endmodule
#### Variant 2
module aoi2_1a(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
assign a3=a1 && b1;
assign b3=c1 && d1;
assign c3=a2 && b2;
assign d3=c2 && d2;
assign e3=a3 || b3;
assign g=e3 && a3 || c3 || d3;
endmodule

### Simulation and Observation:
The simulation results shows that the variation instruction can successfully generate the waveform as the following illustrated.

## 2.5.3. Example 4: AOI2_1B

### Source Verilog Code:
module aoi2_1b(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 || b1;
assign b3=c1 || d1;
assign c3=a2 || b2;
assign d3=c2 || d2;
assign e3=a3 && b3;
assign g=e3 && c3 || d3;
endmodule
### Base Verilog Code:
module aoi2_1b(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 || b1;
assign b3=c1 || d1;
assign c3=a2 || b2;
assign d3=c2 || d2;
assign e3=a3 && b3;
assign g=e3 && c3 || d3;
endmodule
### Variant Instruction:
Use initial block variable initialization with an inside expression using a function call in the index.

### Testbench Code:

### Simulation and Observation:
The simulation results shows that the variation instruction can successfully generate the waveform as the following illustrated.

## 2.5.4. Example 5: AOI2_2

### Source Verilog Code:
module aoi2_2(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 && b1;
assign b3=c1 || d1;
assign c3=a2 && b2;
assign d3=c2 || d2;
assign e3=a3 || b3;
assign g=e3 && c3 || d3;
endmodule
### Base Verilog Code:
module aoi2_2(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 && b1;
assign b3=c1 || d1;
assign c3=a2 && b2;
assign d3=c2 || d2;
assign e3=a3 || b3;
assign g=e3 && c3 || d3;
endmodule
### Variant Instruction:
Use initial block variable initialization with an inside expression using a function call in the index.

### Testbench Code:

### Simulation and Observation:
The simulation results shows that the variation instruction can successfully generate the waveform as the following illustrated.

## 2.5.5. Example 6: AOI2_3

### Source Verilog Code:
module aoi2_3(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 && b1;
assign b3=c1 && d1;
assign c3=a2 && b2;
assign d3=c2 && d2;
assign e3=a3 || b3;
assign g=e3 && c3 || d3;
endmodule
### Base Verilog Code:
module aoi2_3(a1,b1,c1,d1,a2,b2,c2,d2,g);
input a1,b1,c1,d1;
input a2,b2,c2,d2;
output g;
wire a3,b3,c3,d3,e3;
assign a3=a1 && b1;
assign b3=c1 && d1;
assign c3=a2 && b2;
assign d3=c2 && d2;
assign e3=a3 || b3;
assign g=e3 && c3 || d3;
endmodule
### Variation Instruction:
Use initial block variable initialization with an inside expression using a function call in the index.

### Testbench Code: