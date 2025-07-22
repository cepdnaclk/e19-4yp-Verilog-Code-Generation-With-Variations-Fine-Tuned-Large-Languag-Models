```verilog
module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
endmodule

module aoi2_tb;
reg a,b,c,d;
wire g;

aoi2 UUT(g,a,b,c,d);

initial begin
// Initialize the inputs to 0
a = 0;
b = 0;
c = 0;
d = 0;

// Print initial state
$display("Initial State");
$display("a = %b, b = %b, c = %b, d = %b, g = %b", a, b, c, d, g);

// Test the combinational logic
a = 0; b = 0; c = 0; d = 0; #10;
$display("a = 0, b = 0, c = 0, d = 0, g = %b", g);

a = 0; b = 0; c = 1; d = 0; #10;
$display("a = 0, b = 0, c = 1, d = 0, g = %b", g);

a = 0; b = 1; c = 0; d = 0; #10;
$display("a = 0, b = 1, c = 0, d = 0, g = %b", g);

a = 1; b = 0; c = 0; d = 0; #10;
$display("a = 1, b = 0, c = 0, d = 0, g = %b", g);

a = 1; b = 1; c = 1; d = 1; #10;
$display("a = 1, b = 1, c = 1, d = 1, g = %b", g);

a = 1; b = 1; c = 1; d = 0; #10;
$display("a = 1, b =