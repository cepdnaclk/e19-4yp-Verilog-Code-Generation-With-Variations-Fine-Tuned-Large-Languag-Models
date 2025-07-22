module Nand3 (A, B, C, D);
input A;
input B;
input C;
output D;

Nand2 NAND_A1 (.X1(A),.X2(D));
Nand2 NAND_A2 (.X1(B),.X2(D));
Nand2 NAND_A3 (.X1(C),.X2(D));

Nand2 NAND_A4 (.X1(A),.X2(B),.