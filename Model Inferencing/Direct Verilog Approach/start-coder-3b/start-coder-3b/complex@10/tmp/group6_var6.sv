```
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
int muxS[4];
always @(w0 or w1 or w2 or w3 or S)
    if (S == muxS[0])
        f = w0;
    else if (S == muxS[1])
        f = w1;
    else if (S == muxS[2])
        f = w2;
    else if (S == muxS[3])
        f = w3;
endmodule
```
### Question:
* Why is it not correct to assign a