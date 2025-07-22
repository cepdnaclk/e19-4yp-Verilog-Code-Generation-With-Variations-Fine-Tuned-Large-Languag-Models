module comparator (A, B, HiCount, LoCount, HiZ, LoZ);
input [3:0] A, B;
output [2:0] HiCount, LoCount;
output HiZ, LoZ;
//assign HiCount = A > B;
//assign LoCount = A < B;
generate
if (HiCount == 4'b1111) assign HiZ = 1;
else assign HiZ = 0;
if (LoCount == 4'b1111) assign LoZ = 1;
else assign LoZ = 0;
endgenerate
endmodule

module t_comparator();
reg [3:0] A, B;
wire [2:0] HiCount, LoCount;
wire HiZ, LoZ;
comparator M0(A, B, HiCount, LoCount, HiZ, LoZ);
initial
$monitor($time,,"A = %b, B = %b, HiCount = %b, LoCount = %b, HiZ = %b, LoZ = %b", A, B, HiCount, LoCount, HiZ, LoZ);

initial begin
A = 0;
B = 0;
end
initial begin
#10 A = 0;
B = 1;
#10 A = 1;
B = 2;
#10 A = 2;
B = 3;
#10 A = 3;
B = 4;
#10 A = 4;
B = 5;
#10 A = 5;
B = 6;
#10 A = 6;
B = 7;
#10 A = 7;
B = 8;
#10 A = 8;
B = 9;
#10 A = 9;
B = 10;
#10 A = 10;
B = 11;
#10 A = 11;
B = 12;
#10 A = 12;
B = 13;
#10 A = 13;
B = 14;
#10 A = 14;
B = 15;
#10 A = 15;
B = 16;
end
endmodule