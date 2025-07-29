module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case(s) // Case has priority!
0: if(a == 0) y = 0; else y = 1; // Select 0 if a==0 (else clause)
1: if(b == 1) y = 1; else y = 0; // Select 1 if b==1 (else clause)
default: y = 0; // Defaults to 0
endcase
endmodule
### Simulator: ### Verilog Logic Simulator
##### Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case(s) // Case has priority!
0: if(a == 0) y = 0; else y = 1; // Select 0 if a==0 (else clause)
1: if(b == 1) y = 1; else y = 0; // Select 1 if b==1 (else clause)
default: y = 0; // Defaults to