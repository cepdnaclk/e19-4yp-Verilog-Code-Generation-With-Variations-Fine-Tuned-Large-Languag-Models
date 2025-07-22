```
module mux4to1(w0, w1, w2, w3, S, f);
    input w0, w1, w2, w3;
    input [1:0] S;
    output f;
    reg f;
    wire [1:0] index;
    always @(w0 or w1 or w2 or w3 or S) begin
        index = S;
    end
    always @(index) begin
        f = index == 2'b00? w0 : index == 2'b01? w1 : index == 2'b10? w2 :