module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
if( i[0])
reg[0] =1;
else
reg[0] =0;
if( i[1])
reg[1] =1;
else
reg[1] =0;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
### New output:

input i = 00
output o = 00
input i = 01
output o = 00
input i = 10
output o = 00
input i = 11
output o = 00
input i = 100
output o = 00
input i = 101
output o = 01
input i = 110
output o = 01
input i = 111
output o = 01
input i = 1000
output o = 01
input i = 1001
output o = 10
input i = 1010
output o = 10
input i = 1011
output o = 11
input i = 1100
output o = 11
input i = 1101
output o = 11
input i = 1110
output o = 11
input i = 1111
output o = 11
input i = 10000
output o = 11
input i = 10001
output o = 11
input i = 10010
output o = 11
input i = 10011
output o = 11
input i = 10100
output o = 11
input i = 10101
output o = 11
input i = 10110
output o = 11
input i = 10111
output o = 11
input i = 11000
output o = 11
input i = 11001
output o = 11
input i = 11010
output o = 11
input i = 11011
output o = 11
input i = 11100
output o = 11
input i = 11101
output o = 11
input i = 11110
output o = 11
input i = 11111
output o = 11
input i = 100000
output o = 11
input i = 100001
output o = 11
input i = 100010
output o = 11
input i = 100011
output o = 11
input i = 100100
output o = 11
input i = 100101
output o = 11
input i = 100110
output o = 11
input i = 100111
output o = 11
input i = 101000
output o = 11
input i = 101001
output o = 11
input i = 101010
output o = 11
input i = 101011
output o = 11
input i = 101100
output o = 11
input i = 101101
output o = 11
input i = 101110
output o = 11
input i = 101111
output o = 11
input i = 110000
output o = 11
input i = 110001
output o = 11
input i = 110010
output o = 11
input i = 110011
output o = 11
input i = 110100
output o = 11
input i = 110101
output o = 11
input i = 110110
output o = 11
input i = 110111
output o = 11
input i = 111000
output o = 11
input i = 111001
output o = 11
input i = 111010
output o = 11
input i = 111011
output o = 11
input i = 111100
output o = 11
input i = 111101
output o = 11
input i = 111110
output o = 11
input i = 111111
output o = 11
`