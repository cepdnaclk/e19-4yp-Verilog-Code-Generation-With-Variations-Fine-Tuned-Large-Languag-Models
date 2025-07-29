module nil;
reg a, b;
integer i; // Added
integer j; // Added
integer x[3:0]; // Added
reg [3:0] y; // Added
always @* begin // Added
if (i==j) begin
$display("TRUE"); // Added
end else begin
$display("FALSE"); // Added
end // Added
end // Added
// $display ("t=%0t display: a = %b, b = %b", $time, a, b); // Removed
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added (time)
end
//initial
//$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b); // Removed
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
### Output:
t=1 display: a = 0, b = 0
t=3 display: a = 0, b = 0
t=5 display: a = 0, b = 0
TRUE
t=7 display: a = 0, b = 0
t=9 display: a = 0, b = 0
FALSE
t=11 display: a = 0, b = 0
TRUE
t=13 display: a = 0, b = 0
FALSE
t=15 display: a = 0, b = 0
FALSE
t=17 display: a = 0, b = 0
TRUE
t=19 display: a = 0, b = 0
FALSE
FALSE
t=21 display: a = 0, b = 0
TRUE
t=23 display: a = 0, b = 0
FALSE
t=25 display: a = 0, b = 0
FALSE
t=27 display: a = 0, b = 0
TRUE
t=29 display: a = 0, b = 0
FALSE
FALSE
t=31 display: a = 0, b = 0
TRUE
t=33 display: a = 0, b = 0
FALSE
t=35 display: a = 0, b = 0
FALSE
t=37 display: a = 0, b = 0
TRUE
t=39 display: a = 0, b = 0
FALSE
FALSE
t=41 display: a = 0, b = 0
TRUE
t=43 display: a = 0, b = 0
FALSE
t=45 display: a = 0, b = 0
FALSE
t=47 display: a = 0, b = 0
TRUE
t=49 display: a = 0, b = 0
FALSE
FALSE
t=51 display: a = 0, b = 0
TRUE
t=53 display: a = 0, b = 0
FALSE
t=55 display: a = 0, b = 0
FALSE
t=57 display: a = 0, b = 0
TRUE
t=59 display: a = 0, b = 0
FALSE
FALSE
t=61 display: a = 0, b = 0
TRUE
t=63 display: a = 0, b = 0
FALSE
t=65 display: a = 0, b = 0
FALSE
t=67 display: a = 0, b = 0
TRUE
t=69 display: a = 0, b = 0
FALSE
FALSE
t=71 display: a = 0, b = 0
TRUE
t=73 display: a = 0, b = 0
FALSE
t=75 display: a = 0, b = 0
FALSE
t=77 display: a = 0, b = 0
TRUE
t=79 display: a = 0, b = 0
FALSE
FALSE
t=81 display: a = 0, b = 0
TRUE
t=83 display: a = 0, b = 0
FALSE
t=85 display: a = 0, b = 0
FALSE
t=87 display: a = 0