module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
casez({s, ~~s}) // ~~x = 0 for x = 1 and =1 for x = 0
1: y = a;
2: y = b;
endcase
endmodule
### Modified Test Bench:
module mux21b_tb ();
wire y;
wire [15:0] a;
wire [15:0] b;
reg [1:0] s;
reg [1:0] s2;
reg [1:0] s3;
reg [1:0] s4;
reg [1:0] s5;
reg [1:0] s6;
reg [1:0] s7;
reg [1:0] s8;
reg [1:0] s9;
reg [1:0] s10;
reg [1:0] s11;
reg [1:0] s12;
reg [1:0] s13;
reg [1:0] s14;
reg [1:0] s15;
reg [1:0] s16;
reg [1:0] s17;
reg [1:0] s18;
reg [1:0] s19;
reg [1:0] s20;
initial
begin
// Set all the switches to OFF initially
s = 0;
s2 = 0;
s3 = 0;
s4 = 0;
s5 = 0;
s6 = 0;
s7 = 0;
s8 = 0;
s9 = 0;
s10 = 0;
s11 = 0;
s12 = 0;
s13 = 0;
s14 = 0;
s15 = 0;
s16 = 0;
s17 = 0;
s18 = 0;
s19 = 0;
s20 = 0;
$monitor ("%d", y);
end
// Always block for switching OFF/ON the switches
always @(s, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20)
begin
if (s == 0)
s2 = 1;
else
s2 = 0;
if (s2 == 0)
s3 = 1;
else
s3 = 0;
if (s3 == 0)
s4 = 1;
else
s4 = 0;
if (s4 == 0)
s5 = 1;
else
s5 = 0;
if (s5 == 0)
s6 = 1;
else
s6 = 0;
if (s6 == 0)
s7 = 1;
else
s7 = 0;
if (s7 == 0)
s8 = 1;
else
s8 = 0;
if (s8 == 0)
s9 = 1;
else
s9 = 0;
if (s9 == 0)
s10 = 1;
else
s10 = 0;
if (s10 == 0)
s11 = 1;
else
s11 = 0;
if (s11 == 0)
s12 = 1;
else
s12 = 0;
if (s12 == 0)
s13 = 1;
else
s13 = 0;
if (s13 == 0)
s14 = 1;
else
s14 = 0;
if (s14 == 0)
s15 = 1;
else
s15 = 0;
if (s15 == 0)
s16 = 1;
else
s16 = 0;
if (s16 == 0)
s17