module ALU ( input [7:0] A, input [7:0] B, input [1:0] fx, output [7:0] out );
// ALU (A+B, A-B, A*, B*).
always @( * ) begin
case ( fx )
00 : out <= A & B ; // A & B
01 : out <= A | B ; // A | B
10 : out <= A ^ B ; // A ^ B
11 : out <= A % B ; // A % B
default : out <= 4'b0000;
endcase
end
endmodule