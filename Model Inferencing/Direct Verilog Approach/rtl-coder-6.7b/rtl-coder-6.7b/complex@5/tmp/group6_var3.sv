```verilog
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S) begin
    case(S)
        2'b00: f = w0;
        2'b01: f = w1;
        2'b10: f = w2;
        2'b11: f = w3;
        default: f = 0;
    endcase
end
endmodule
```
### Modified Testbench:
```verilog
reg w0, w1, w2, w3;
reg [1:0] S;
wire f;
mux4to1 m0(w0, w1, w2, w3, S, f);
initial begin
    w0 = 0;
    w1 = 1;
    w2 = 0;
    w3 = 1;
    S  = 2'b00; #10;
    S  = 2'b01; #10;
    S  = 2'b10; #10;
    S  = 2'b11; #10;
end
endmodule
```
### Variation Result:
| S  | w0  | w1  | w2  | w3 | f |
|:--:|:---:|:---:|:---:|:--:|:-:|
| 00 | 0   | 1   | 0   | 1  | 0 |
| 01 | 0   | 1   | 0   | 1  | 1 |
| 10 | 0   | 1   | 0   | 1  | 0 |
| 11 | 0   | 1   | 0   | 1  | 1 |