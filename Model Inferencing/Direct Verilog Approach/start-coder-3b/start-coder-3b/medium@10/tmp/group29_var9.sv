module full_adder(Cin,A,B,S,Cout);
input Cin;
input A;
input B;
output S;
output Cout;
reg S;
reg Cout;
always @(A or B or Cin)