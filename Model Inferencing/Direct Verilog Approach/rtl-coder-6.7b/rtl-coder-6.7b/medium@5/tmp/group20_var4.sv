module Chap1FullAdder (A, B, Sum, COUT);
input      A, B;
output reg Sum;
output reg COUT;

always @(*) begin
    Sum = A xor B;
    COUT = A & B;
end
endmodule

module Chap1Multiplier (A, B, Product);
input      A, B;
output reg [3:0] Product;
reg [3:0] A_reg;
reg [3:0] B_reg;
reg [3:0] Product_reg;

Chap1FullAdder adder1 (A_reg[3], B_reg[3], Product_reg[3],