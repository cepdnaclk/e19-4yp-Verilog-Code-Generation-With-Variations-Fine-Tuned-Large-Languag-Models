module adders_8x8(sum, carry,  data, carryin);
parameter N = 32;
parameter M = 16;
reg [32:0] data;
input	[15:0]	data[31:0];
input [15:0]	data[31:0];
input carryin;
output [32:0] sum;
output [32:0] sum;
output	carry;
output	carry;
reg [32:0] sum;
reg [32:0] sum;
reg carry;
reg carry;
reg [16:0] data0, data1;
reg [16:0] data2, data3;
reg [16:0] data4, data5;
reg [16:0] data6, data7;
reg sum0, sum1;
reg sum2, sum3;
reg sum4, sum5;
reg sum6, sum7;
reg carry0, carry1;
reg carry2, carry3;
reg carry4, carry5;
reg carry6, carry7;
always @(*)
begin
	carry0 = (data[0] & data[1] & carryin) | (data[0] & carryin & data[1]) | (carryin & data[0] & data[1]);
    sum0 = data[0] ^ data[1] ^ carryin;
    carry1 = (data[1] & data[2] & carryin) | (data[1] & carryin & data[2]) | (carryin & data[1] & data[2]);
    sum1 = data[1] ^ data[2] ^ carryin;
    carry2 = (data[2] & data[3] & carryin) | (data[2] & carryin & data[3]) | (carryin &