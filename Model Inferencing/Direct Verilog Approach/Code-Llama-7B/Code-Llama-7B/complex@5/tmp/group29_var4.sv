```verilog
//Hex to 7-segment Decoder using inside and variables
//inside(x, y)
//inside(x, y) returns 1 (true) if x is within y. y should be declared
//with -1 for the default value, i.e. 00000000
module hex_to_7seg (output [6: 0] output_val, x);
reg [6: 0] output_val;
wire [3: 0] x;
reg [3: 0] y = 4'b0001;
initial
begin
output_val = 7'b1111111
;
end

always @ (*)
begin
case(x)
inside {2'b00, 2'b01