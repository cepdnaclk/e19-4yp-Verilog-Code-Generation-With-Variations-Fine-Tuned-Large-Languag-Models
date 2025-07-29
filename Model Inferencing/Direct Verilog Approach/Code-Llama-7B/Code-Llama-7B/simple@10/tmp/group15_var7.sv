module alu (
input wire [11:0] A,
input wire [11:0] B,
input wire [3:0] FUNC,
output wire [11:0] OUT,
output wire OF,
output wire CARRY);
assign CARRY = (A[11] ^ B[11]) ^ FUNC[1];
assign OUT = (FUNC == 4'b0001)? A + B :
(FUNC == 4'b0010)? A - B :
(FUNC == 4'b0100)? A & B :
(FUNC == 4'b0101)? A | B :
(FUNC == 4'b0110)? A ^ B :
(FUNC == 4'b1000)? ~A :
(FUNC == 4'b1001)? 12'b000000000000 :
12'bZZZZZZZZZZZZ;
assign OF = (A[11] ^ B[11]) ^ (A[11] ^ OUT[11]);

endmodule

### Variation Instruction:
Modify the testbench for the ALU modified in the previous variation