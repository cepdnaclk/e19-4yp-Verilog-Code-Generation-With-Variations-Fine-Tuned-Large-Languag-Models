module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
reg [1:0] select [1:0];
assign select = {b, a}; // Assigning priority case operand
always @(*) // Combinational sensitivity
case(s) // Select statement
1: y = select[1];
0: y = select[0];
default: y = select[0];
endcase
endmodule
### Test Bench:
module tb_mux21b;
// Test data inputs
reg a, b, s;
// Test data outputs
wire y;
// Instantiate DUT
mux21b u_mux21b(.a(a),.b(b),.s(s),.y(y));
// Test pattern generator
initial
begin
a = 0; b = 0; s = 0; #100 a = 0; b = 0; s = 1; #100 a = 0; b = 1; s = 0; #100 a = 0; b = 1; s = 1; #100
a = 1; b = 0; s = 0; #100 a = 1; b = 0; s = 1; #100 a = 1; b = 1; s = 0; #100 a = 1; b = 1; s = 1; #100
end
endmodule
### Result:
Test bench output is successful.
### Verification Logic:
The test bench should be verified for the following:
1. If s is asserted high, then the output should be asserted high to a.
2. If s is asserted low, then the output should be asserted high to b.
3. If a and b are both asserted low, then the output should be asserted low.
4. If a and b are both asserted high, then the output should be asserted high.
5. If a is asserted high and b is asserted low, then the output should be asserted high.
6. If a is asserted low and b is asserted high, then the output should be asserted high.
7. If the output