module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
reg [2:0] S2;
reg [1:0] S4;

assign S2[0] = S==2'b00;
assign S2[1] = S==2'b01;
assign S2[2] = S==2'b11;
assign S4[0] = S==2'b00;
assign S4[1] = S==2'b10;

always @(w0 or w1 or w2 or w3 or S)
    if (S2[1:0])
        f = w1;
    else if (S2[2:1])
        f = w3;
    else if (S4[1:0])
        f = w2;
    else
        f = w0;
endmodule