module comparator(
input [1:0] Adjr,
input [3:0] HiCount);
output [1:0] Adjf;
logic [1:0] Adjf;
//logic [1:0] Adjf;
reg [1:0] Adjf [0:15];
reg [15:0] Adjf;
reg [15:0] Adjf;

generate
begin
always @* begin
Adjf = HiCount < Adjr;
end
end
endgenerate

module t_comparator();
reg [1:0] Adjr;
wire [1:0] Adjf;
parameter bcdA = 0;
reg bcdA;
reg bcdA, bcdA, bcdA, bcdA, bcdA;
reg [15:0] bcdA, bcdA;
comparator M0(Adjr, HiCount);
initial begin
#1000;
$finish;
end
initial begin //Simulation Test Pattern

    bcdA = 0;
    Adjr = 0;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 1;
    Adjr = 0;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 2;
    Adjr = 0;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 2;
    Adjr = 1;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 2;
    Adjr = 2;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 2;
    Adjr = 3;

    $display ("%t Adjf = %b", $time, Adjf);

    bcdA = 2;
    Adjr = 4;

    $display ("%t Adjf = %b", $time