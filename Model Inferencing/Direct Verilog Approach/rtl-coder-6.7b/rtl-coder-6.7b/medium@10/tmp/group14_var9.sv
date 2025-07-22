module mux21b (
input wire a_in[1:0], // 2-bit a operand
input wire b_in[1:0], // 2-bit b operand
input wire s,
output reg [1:0] y // 2-bit output
);
always @(*) // Combinational sensitivity
case(s)
0 : y = a_in; // Select a_in if s=0
1 : y = b_in; // Select b_in if s=1
endcase
endmodule
### Testbench Code:
module mux21b_testbench ();
reg wire [1:0] a_in; // 2-bit a
reg wire [1:0] b_in; // 2-bit b
reg wire s; // Select (0 = a, 1 = b)
wire [1:0] y; // 2-bit output
integer i;
mux21b dut (.a_in,.b_in,.s,.y); // Instantiate the mux21b module
initial begin // Test inputs
a_in = 2'b11;
b_in = 2'b10;
for(i = 0; i < 2; i++)
begin
s = i; #10; // Delay of 10 ns
end
end
// Display outputs
always @(*) $display ("a_in=%b, b_in=%b, s=%b, y=%b", a_in, b_in, s, y);
endmodule
### Simulation Outputs:
a_in=11, b_in=10, s=0, y=11
a_in=11, b_in=10, s=1, y=10