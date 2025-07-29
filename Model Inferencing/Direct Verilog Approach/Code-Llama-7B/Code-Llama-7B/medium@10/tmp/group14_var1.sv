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
if(s == 1)
y = b; // Select b if s=1
else
if(s == 2)
y = 0; // Select 0 if s=2
else
if(s == 3)
y = 0; // Select 0 if s=3
else
y = 0; // Select 0 if s=4
endmodule

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
if(s == 1