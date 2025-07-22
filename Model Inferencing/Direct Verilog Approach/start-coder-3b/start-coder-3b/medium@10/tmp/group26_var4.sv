module example9(x, y, f);
input [4:0] x;
input y;
output reg f;
always @(x or y)
begin
    case (x[2:0] * 16 + x[0:1] * 4 + x[1:0])
        x[1] * 16 + x[0]: f = 1;
        x[2] * 16 + x[1]: f = 2;
        x[3] * 16 + x[2]: f = 3;
        x[2] * 16 + x[3]: f = 4;
        default: f = 1;
    endcase
endmodule
```

##### 5.10.4.7 Multiple `case` Statements with Multiple Expressions:
```
### Base Verilog Code:
module example10(x, f, y);
input [4:0] x;
output reg f;
input [5:0] y;
always @(x or y)
begin
    case (x)
        x == 4'b0000: f = 1;
        x == 4'b0001: f = 2;
        x == 4'b0010: f = 3;
        x == 4'b0011: f = 4;
        x == 4'b0100: f = 5;
        x == 4'b0110: f = 6;
        x == 4'b1000: f = 7;
        x == 4'b1010: f = 8;
        x == 4'b1100: f = 9;
        x == 4'b1101: f = 10;
        x == 4'b1110: f = 1