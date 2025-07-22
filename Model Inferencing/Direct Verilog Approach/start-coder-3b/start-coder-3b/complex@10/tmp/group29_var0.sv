module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
case (state)
S_idle: if (En && inside(Ld,{"0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010"})) begin
next_state = S_1;
Ld_P1 = 1;
Ld_P0 = 1;
end
else flush_P0_P1 = 1;

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
end
else next_state = S_wait;
S_wait: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
end
else next_state = S_wait;
endcase
end
endmodule

2.3

### Base Verilog Code:
module alu_unit(S_out, S_out1, S_out2, S_out3, S_out4, S_out5, S_out6, S_out7, S_out8,
S_out9, S_out10, S_out11, S_out12, S_out13, S_out14, S_out15,
S_out16, S_out17, S_out18, S_out19, S_out20, S_out21, S_out22, S_out23, S_out24,
S_out25, S_out26, S_out27, S_out28,S_out29,S_out30,S_out31,
S_out32,S_out33, S_out34, S_out35, S_out36, S_out37, S_out38, S_out39, S_out40,
S_out41, S_out42, S_out43, S_out44, S_out45, S_out46, S_out47, S_out48, S_out49,
S_out50, S_out51, S_out52, S_out53, S_out54, S_out55, S_out56, S_out57, S_out58,
S_out59, S_out60, S_out61, S_out62, S_out63,
Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8,
Q9, Q10, Q11, Q12, Q13, Q14, Q15,
Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24,
Q25, Q26, Q27, Q28, Q29, Q30, Q31,
Q32, Q33, Q34, Q35, Q36, Q37, Q38, Q39, Q40,
Q41, Q42, Q43, Q44, Q45, Q46, Q47, Q48, Q49,
Q50, Q51, Q52, Q53, Q54, Q55, Q56, Q57, Q58,
Q59, Q60, Q61, Q62, Q63,
op0, op1, op2, op3, op4, op5, op6, op7, op8,
op9, op10, op11, op12, op13, op14, op15,
op16, op17, op18, op19, op20, op21, op22, op23, op24,
op25, op26, op27, op28, op29, op30, op31,
op32, op33, op34, op35, op36, op37, op38, op39, op40,
op41, op42, op43, op44, op45, op46, op47, op48, op49,
op50, op51, op52, op53, op54, op55, op56, op57, op58,
op59, op60, op61, op62, op63,
y0, y1, y2, y3, y4, y5, y6, y7, y8,
y9, y10, y11, y12, y13, y14, y15,
y16, y17, y18, y19, y20, y21, y22, y23, y24,
y25, y26, y27, y28, y29, y30, y31,
y32, y33, y34, y35, y36, y37, y38, y39, y40,
y41, y42, y43, y44, y45, y46, y47, y48, y49,
y50, y51, y52, y53, y54, y55, y56, y57, y58,
y59, y60, y61, y62, y63,

clock, rst);
input clock, rst;
output [63:0] S_out, S_out1, S_out2, S_out3, S_out4, S_out5, S_out6, S_out7, S_out8,
S_out9, S_out10, S_out11, S_out12, S_out13, S_out14, S_out15,
S_out16, S_out17, S_out18, S_out19, S_out20, S_out21, S_out22, S_out23, S_out24,
S_out25, S_out26, S_out27, S_out28, S_out29, S_out30, S_out31,
S_out32, S_out33, S_out34, S_out35, S_out36, S_out37, S_out38, S_out39, S_out40,
S_out41, S_out42, S_out43, S_out44, S_out45, S_out46, S_out47, S_out48, S_out49,
S_out50, S_out51, S_