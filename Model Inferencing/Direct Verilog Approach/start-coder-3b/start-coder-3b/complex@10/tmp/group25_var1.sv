[code ]
module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
wire [7:0] HiCount = { 219, 220, 221, 222, 223, 224, 225, 226 };

generate
if (HiCount[Excess_3_out] == 219)
$display("*** ERROR: BCD_in = %b, Excess_3_out = %b ***", BCD_in, Excess_3_out);
end
endgenerate

encoder M0(BCD_in, Excess_3_out);

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
$display("*** 1st Test Pattern ***");
$display("BCD = 0b0000, Excess-3 Code = 0b001");
BCD_in = 0;

$display("*** 2nd Test Pattern ***");
$display("BCD = 0b0001, Excess-3 Code = 0b010");
BCD_in = 1;

$display("*** 3rd Test Pattern ***");
$display("BCD = 0b0010, Excess-3 Code = 0b001");
BCD_in = 2;

$display("*** 4th Test Pattern ***");
$display("BCD = 0b0011, Excess-3 Code = 0b010");
BCD_in = 3;

$display("*** 5th Test Pattern ***");
$display("BCD = 0b0100, Excess-3 Code = 0b001");
BCD_in = 4;

$display("*** 6th Test Pattern ***");
$display("BCD = 0b0101, Excess-3 Code = 0b010");
BCD_in = 5;

$display("*** 7th Test Pattern ***");
$display("BCD = 0b0110, Excess-3 Code = 0b001");
BCD_in = 6;

$display("*** 8th Test Pattern ***");
$display("BCD = 0b0111, Excess-3 Code = 0b010");
BCD_in = 7;

$display("*** 9th Test Pattern ***");
$display("BCD = 0b1000, Excess-3 Code = 0b001");
BCD_in = 8;

$display("*** 10th Test Pattern ***");
$display("BCD = 0b1001, Excess-3 Code = 0b010");
BCD_in = 9;

$display("*** 11th Test Pattern ***");
$display("BCD = 0b1010, Excess-3 Code = 0b001");
BCD_in = 10;

$display("*** 12th Test Pattern ***");
$display("BCD = 0b1011, Excess-3 Code = 0b010");
BCD_in = 11;

$display("*** 13th Test Pattern ***");
$display("BCD = 0b1100, Excess-3 Code = 0b001");
BCD_in = 12;

$display("*** 14th Test Pattern ***");
$display("BCD = 0b1101, Excess-3 Code = 0b010");
BCD_in = 13;

$display("*** 15th Test Pattern ***");
$display("BCD = 0b1110, Excess-3 Code = 0b001");
BCD_in = 14;

$display("*** 16th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 15;

$display("*** 17th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 16;

$display("*** 18th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 17;

$display("*** 19th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 18;

$display("*** 20th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 19;

$display("*** 21st Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 20;

$display("*** 22nd Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 21;

$display("*** 23rd Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 22;

$display("*** 24th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 23;

$display("*** 25th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 24;

$display("*** 26th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 25;

$display("*** 27th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 26;

$display("*** 28th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 27;

$display("*** 29th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 28;

$display("*** 30th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 29;

$display("*** 31st Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 30;

$display("*** 32nd Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 31;

$display("*** 33rd Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 32;

$display("*** 34th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 33;

$display("*** 35th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 34;

$display("*** 36th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 35;

$display("*** 37th Test Pattern ***");
$display("BCD = 0b1111, Excess-3 Code = 0b010");
BCD_in = 36;

$display("*** 38th