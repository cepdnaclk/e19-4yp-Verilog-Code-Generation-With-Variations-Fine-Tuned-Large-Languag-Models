module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg [0:1] c;
always @(*)
begin
if(s == 0)
c = 2'b01;
else
c = 2'b10;
end
always @(*) // Combinational sensitivity
begin
case (c)
2'b01: y = a;
2'b10: y = b;
2'b11: y = b;
2'b00: y = a;
endcase
endmodule
### Testbench Code:
```
module mux21b_test;
reg a,b,s;
wire y;
mux21b mux(.a(a),.b(b),.s(s),.y(y));
initial begin
a = 1'b0;
b = 1'b1;
s = 1'b0;
$monitor($time, " mux21b(y=%b,s=%b,a=%b,b=%b)", y,s,a,b);
#10 s = 1'b1;
#10;
end
endmodule
```
### Simulation
![21b_sim3](https://github.com/dineshbandla/mips32_processor/blob/master/image/21B_sim3.png)
### Passing the test:
![21b_sim4](https://github.com/dineshbandla/mips32_processor/blob/master/image/21B_sim4.png)

### Test case 3:
### Base Verilog Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
if(s == 0)
y = a; // Select a if s=0
else
y = b; // Select b if s=1
endmodule
### Variation Instruction:
Add a priority case structure using inside with