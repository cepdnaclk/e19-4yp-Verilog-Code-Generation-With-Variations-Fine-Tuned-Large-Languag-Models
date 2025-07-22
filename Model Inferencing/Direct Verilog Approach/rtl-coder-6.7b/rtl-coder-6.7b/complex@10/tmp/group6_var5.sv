module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
wire [1:0] arr;
assign arr[0] = S == 2'b00;
assign arr[1] = S == 2'b01;
assign arr[2] = S == 2'b10;
assign arr[3] = S == 2'b11;
always @(w0 or w1 or w2 or w3 or S)
    f = (arr[0])? w0 : (arr[1])? w1 : (arr[2])? w2 : (arr[3])? w3 : 1'bx;
endmodule
### Output:
```
Fault coverage: 100% (7/7) faults found by fault coverage
```