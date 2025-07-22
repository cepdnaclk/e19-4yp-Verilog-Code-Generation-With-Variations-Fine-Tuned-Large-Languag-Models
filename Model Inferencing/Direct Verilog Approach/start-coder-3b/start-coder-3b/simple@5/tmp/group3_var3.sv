module adder(A, B, Cin, Sum, Cout);
input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Cout;
full_adder fa_A0(.i1(A[0]),.i2(B[0]),.cin(Cin),.sum(Sum[0]),.cout(Cout[0]) );
full_adder fa_A1(.i1(A[1]),.i2(B[1]),.cin(Cout[0]),.sum(Sum[1]),.cout(Cout[1]) );
full_adder fa_A2(.i1(A[2]),.i2(B[2]),.cin(Cout[1]),.sum(Sum[2]),.cout(Cout[2]) );
full_adder fa_A3(.i1(A[3]),.i2(B[3]),.cin(Cout[2]),.sum(Sum[3]),.cout(Cout[3]) );
endmodule
### Modified testbench code:
module adder_testbench();
// input/output wires
reg [3:0] A, B, Sum;
reg Cin;
reg [3:0] Cout;

// module instances
adder adder1(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
initial begin
A = 4'b0000;
B = 4'b0000;
Cin = 0;
end

initial begin
A = 4'b1111;
B = 4'b1111;
Cin = 0;
end

initial begin
A = 4'b0000;
B = 4'b1111;
Cin = 1;
end

initial begin
A = 4'b1010;
B = 4'b0011;
Cin = 1;
end

initial begin
A = 4'b1101;
B = 4'b1011;
Cin = 1;
end

initial begin
A = 4'b0011;
B = 4'b0101;
Cin = 1;
end

initial begin
A = 4'b0111;
B = 4'b1000;
Cin = 1;
end

initial begin
A = 4'b1001;
B = 4'b1110;
Cin = 1;
end

initial begin
A = 4'b1110;
B = 4'b1101;
Cin = 1;
end

initial begin
A = 4'b1100;
B = 4'b0110;
Cin = 1;
end

always begin
assert(Sum == 4'b0000);
assert(Cout == 0);
assert(A == 4'b1111);
assert(B == 4'b1111);
assert(Cin == 0);
assert(Sum == 4'b1111);
assert(Cout == 1);
assert(A == 4'b0000);
assert(B == 4'b1111);
assert(Cin == 1);
assert(Sum == 4'b1111);
assert(Cout == 1);
end
initial begin
A = 4'b1010;
B = 4'b0011;
Cin = 1;
end

always begin
assert(Sum == 4'b0011);
assert(Cout == 0);
assert(A == 4'b1010);
assert(B == 4'b0011);
assert(Cin == 1);
assert(Sum == 4'b1101);
assert(Cout == 1);
end
initial begin
A = 4'b1101;
B = 4'b1011;
Cin = 1;
end

always begin
assert(Sum == 4'b0110);
assert(Cout == 0);
assert(A == 4'b1101);
assert(B == 4'b1011);
assert(Cin == 1);
assert(Sum == 4'b1010);
assert(Cout == 1);
end
initial begin
A = 4'b0011;
B = 4'b0101;
Cin = 1;
end

always begin
assert(Sum == 4'b0110);
assert(Cout == 0);
assert(A == 4'b0011);
assert(B == 4'b0101);
assert(Cin == 1);
assert(Sum == 4'b1100);
assert(Cout == 1);
end
initial begin
A = 4'b0111;
B = 4'b1000;
Cin = 1;
end

always begin
assert(Sum == 4'b0000);
assert(Cout == 0);
assert(A == 4'b0111);
assert(B == 4'b1000);
assert(Cin == 1);
assert(Sum == 4'b1110);
assert(Cout == 1);
end
initial begin
A = 4'b1001;
B = 4'b1110;
Cin = 1;
end

always begin
assert(Sum == 4'b0100);
assert(Cout == 0);
assert(A == 4'b1001);
assert(B == 4'b1110);
assert(Cin == 1);
assert(Sum == 4'b1101);
assert(Cout == 1);
end
initial begin