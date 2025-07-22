module alu_4 (d,co,a,b,f,cci);
input [3:0]a,b;
input [1:0] f;
input cci;
output[3:0]d;
output co;
wire n1,n2,n3,n4,n5,n6,