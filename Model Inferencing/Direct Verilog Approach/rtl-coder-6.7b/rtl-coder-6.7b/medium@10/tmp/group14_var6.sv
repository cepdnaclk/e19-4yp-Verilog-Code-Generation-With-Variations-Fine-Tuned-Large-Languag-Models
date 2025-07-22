module mux41b (
input wire [3:0][1:0] a,
input wire [3:0] s,
output reg [1:0] y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
begin
for (int i = 0; i <4; i++)
begin
if(s[i])
begin
y <= a[i];
end
end
end
endmodule
### Base Verilog Code:
module mux41b (
input wire [3:0][1:0] a,
input wire [3:0] s,
output reg [1:0] y // Output must be reg for procedural assignment
);

always @(*) // Combinational sensitivity
begin
y = 2’bx; // Default to an X
case(s)

000:y = a[0];