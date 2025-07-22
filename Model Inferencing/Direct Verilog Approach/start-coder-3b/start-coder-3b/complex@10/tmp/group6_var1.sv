```verilog
module mux4to1 (w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
f = (S == 2'b00)? w0 : ((S == 2'b01)? w1 : ((S == 2'b10)? w2 : ((S == 2'b11)? w3 : 0)));
endmodule
```

### Base Verilog Code:
module mux4to1 (w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
f = (S == 2'b00)? w0 : (S == 2'b01)? w1 : (S == 2'b10)? w2 : (S == 2'b11)? w3 : 0;
endmodule
### Variation Instruction:
In the multiplexer, if-else statements can be used to simplify the logic of the multiplexer.
### Modified Code