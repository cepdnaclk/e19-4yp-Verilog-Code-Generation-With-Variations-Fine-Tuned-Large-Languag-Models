module par(in, parity, all_ones);
input [7:0] in;
output one, all_ones;
assign parity   = ~in;
assign all_ones = in;
endmodule
### Output:
![image](https://github.com/KarthikG10/Structural-Design/blob/main/Images/5/output.png)
# Exercise5: Structural Design
### Task: 05
Implement the following primitive logic functions:

• AND

• NAND

• OR

• NOR

• XOR

• NXOR

• NOT

• NAND16, NAND32, NAND64, NAND128, NAND256, and NAND512

• OR16, OR32, OR64, OR128, OR256, and OR512

• XOR16, XOR32, XOR64, XOR128, XOR256, and XOR512

• NOT16, NOT32, NOT64, NOT128, NOT256, and NOT512

• NAND8, NAND12, NAND24, NAND48, NAND96, and NAND256

• OR8, OR12, OR24, OR48, OR96, and OR256

• XOR8, XOR12, XOR24, XOR48, XOR96, and XOR256

• NOT8, NOT12, NOT24, NOT48, NOT96, and NOT256

• NAND8, NAND16, NAND32, NAND64, NAND128, and NAND256

• OR8, OR16, OR32, OR64, OR128, and OR256

• XOR8, XOR16, XOR32, XOR64, XOR128, and XOR256

• NOT8, NOT16, NOT32, NOT64, NOT128, and NOT256

• AND8, AND16, AND32, AND64, AND128, and AND256

• OR8, OR16, OR32, OR64, OR128, and OR256

• XOR8, XOR16, XOR32, XOR64, XOR128, and XOR256

• NOT8, NOT16, NOT32, NOT64, NOT128, and NOT256

• NAND16, NAND256

• OR16, OR256

• XOR16, XOR256

• NOT16, NOT256

• AND16, AND256

• OR16, OR256

• XOR16, XOR256

• NOT16, NOT256

• AND32, AND64, AND128

• OR32, OR64, OR128

• XOR32, XOR64, XOR128

• NOT32, NOT64, NOT128

• AND64, AND128

• OR64, OR128

• XOR64, XOR128

• NOT64, NOT128

• NAND64, NAND128

• OR64, OR128

• XOR64, XOR128

• NOT64, NOT128

• AND128

• OR128

• XOR128

• NOT128

• NAND128

• OR128

• XOR128

• NOT128

• AND16, AND32, AND64, AND128, AND256

• OR16, OR32, OR64, OR128, OR256

• XOR16, XOR32, XOR64, XOR128, XOR256

• NOT16, NOT32, NOT64, NOT128, NOT256

To check that the circuit works correctly, input 0 or 1 to each port and check the output. The input to AND/NAND, OR/NOR, XOR/NXOR, NOT and the input to the 16-to-8 decoders should be 0 and the 8-to-1 decoder input should be 0.

### Code:

`module AND(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = A & B;`
`endmodule`

`module NAND(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = ~(A & B);`
`endmodule`

`module OR(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = A | B;`
`endmodule`

`module NOR(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = ~(A | B);`
`endmodule`

`module XOR(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = ~(A ^ B);`
`endmodule`

`module NXOR(A,B,Y);`
`input A,B;`
`output Y;`
`assign Y = ~(A ^ B);`
`endmodule`

`module NOT(A,Y);`
`input  A;`
`output  Y;`
`assign  Y = ~A;`
`endmodule`

`module NAND16(A,B,C,D,E,F,G,H,Y);`
`input A,B,C,D,E,F,G,H;`
`output Y;`
`assign Y = ~((A & B) | (C & D) | (E & F) | (G & H));`
`endmodule`

`module NAND32(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Y);`
`input A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;`
`output Y;`
`assign Y = ~((A & B) | (C & D) | (E & F) | (G & H) | (I & J) | (K & L) | (M & N) | (O & P));`
`endmodule`

`module NAND64(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y);`
`input A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X;`
`output Y;`
`assign Y = ~((A & B) | (C & D) | (E & F) | (G & H) | (I & J) | (K & L) | (M & N) | (O & P) | (Q & R) | (S & T) | (U & V) | (W & X));`
`endmodule`

`module NAND128(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB,Y);`
`input A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB;`
`output Y;`
`assign Y = ~((A & B) | (C & D) | (E & F) | (G & H) | (I & J) | (K & L) | (M & N) | (O & P) | (Q & R) | (S & T) | (U & V) | (W & X) | (Y & Z) | (AA & AB));`
`endmodule`

`module NAND256(A,B,C,D,E,F,G,H,I,J,