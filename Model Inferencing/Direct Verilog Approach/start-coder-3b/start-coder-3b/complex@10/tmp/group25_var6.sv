module test_wire (a, b);

initial begin
a = 3'b011;
b = 3'b101;
$monitor(a, b);
end

always@(posedge clk) begin
b = 3'b101;
end

endmodule

### Output:
0: a = 3'b011, b = 3'b101
1: a = 3'b011, b = 3'b101
2: a = 3'b011, b = 3'b101
3: a = 3'b011, b = 3'b101

## Task 7:
### Base Verilog Code:
module mux4way1(D0, D1, D2, D3, S, O);
input S;
input [3:0] D0;
input [3:0] D1;
input [3:0] D2;
input [3:0] D3;
output [3:0] O;
assign O = (S == 1)? D0 : (S == 2)? D1 : (S == 3)? D2 : (S == 4)? D3 : 4'bx;
endmodule

module mux8way1(S0, S1, D0, D1, D2, D3, D4, D5, D6, D7, O);
input S0, S1;
input [3:0] D0;
input [3:0] D1;
input [3:0] D2;
input [3:0] D3;
input [3:0] D4;
input [3:0] D5;
input [3:0] D6;
input [3:0] D7;
output [3:0] O;
assign O = (S0 == 0)? (S1 == 0)? D0 : D1 : (S1 == 1)? D2 : D3 :
(S0 == 1)? (S1 == 0)? D4 : D5 : (S1 == 1)? D6 : D7 : 8'bx;
endmodule

module mux4way1_enc(D0, D1, D2, D3, S, O);
wire [3:0] D_enc;
assign D_enc = D0 + D1 + D2 + D3;
assign O = (S == 1)? D_enc[3] : (S == 2)? D_enc[2] : (S == 3)? D_enc[1] : (S == 4)? D_enc[0] : 4'bx;
endmodule

module mux4way2_enc(D0, D1, D2, D3, S, O);
wire [3:0] D_enc;
assign D_enc = D0 + D1 + D2 + D3;
assign O = (S == 1)? D_enc[3] : (S == 2)? D_enc[2] : (S == 3)? D_enc[1] : (S == 4)? D_enc[0] : 4'bx;
endmodule

module mux8way2_enc(D0, D1, D2, D3, D4, D5, D6, D7, S, O);
wire [3:0] D_enc;
assign D_enc = D0 + D1 + D2 + D3 + D4 + D5 + D6 + D7;
assign O = (S == 0)? (S == 1)? D_enc[3] : D_enc[2] : (S == 2)? D_enc[1] : (S == 3)? D_enc[0] : 8'bx;
endmodule

module mux4way2(D0, D1, D2, D3, S, O);
wire [3:0] Ds;
assign Ds = S == 0? D0 : S == 1? D1 : S == 2? D2 : S == 3? D3 : 4'bx;
mux4way2_enc(Ds[3], Ds[2], Ds[1], Ds[0], S, O);
endmodule

module mux8way2(D0, D1, D2, D3, D4, D5, D6, D7, S, O);
wire