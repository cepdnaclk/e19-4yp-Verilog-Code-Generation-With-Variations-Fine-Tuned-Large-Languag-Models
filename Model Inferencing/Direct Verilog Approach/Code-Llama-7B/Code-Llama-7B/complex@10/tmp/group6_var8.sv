```
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S inside {2'b00, 2'b01, 2'b10, 2'b11})
        f = w0;
    else if (S inside {2'b00, 2'b01, 2'b10, 2'b11})
        f = w1;
    else if (S inside {2'b00, 2'b01, 2'b10, 2'b11})
        f = w2;
    else if (S inside {2'b00, 2'b01, 2'b10, 2'b11})
        f = w3;
endmodule
```
<details>
<summary>Click here to see the output of the verilog code.</summary>
<img src="./Code Variation 2 Code-output.png" alt="">
</details>