module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case ({s,a,b}) inside
[3'b100:3'b101] // s=0, a=0, b=1
y = 1'b0; // Select 0
[3'b000:3'b010] // s=0, a=1, b=0
y = 1'b1; // Select 1
default // No match
y = 1'bx; // Error
endcase
endmodule