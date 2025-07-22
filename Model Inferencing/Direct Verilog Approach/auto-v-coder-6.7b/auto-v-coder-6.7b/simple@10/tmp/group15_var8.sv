```verilog
module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule

module ALU_testbench();
reg[7:0] A,B;
wire[7:0] S;

ALU A1(A,B,S);

initial begin
// Test Case for Unsigned Numbers
A=8'b10000000;
B=8'b01111111;
#10; // Delay to allow propagation
assert(S==8'b11111111)$display ("Unsigned Addition Passed");
else $display ("Unsigned Addition Failed");

A=8'b00000000;
B=8'b00000000;
#10; // Delay to allow propagation
assert(S==8'b00000000)$display ("Unsigned Addition Passed");
else $display ("Unsigned Addition Failed");

A=8'b11111111;
B=8'b11111111;
#10; // Delay to allow propagation
assert(S==8'b11111110)$display ("Unsigned Addition Passed");
else $display ("Unsigned Addition Failed");

// Test Case for Signed Numbers
A=8'b10000000;
B=8'b01111111;
#10; // Delay to allow propagation
assert(S==8'b11111111)$display ("Signed Addition Passed");
else $display ("Signed Addition Failed");

A=8'b10000000;
B=8'b10000000;
#10; // Delay to allow propagation
assert(S==8'b00000000)$display ("Signed Addition Passed");
else $display ("Signed Addition