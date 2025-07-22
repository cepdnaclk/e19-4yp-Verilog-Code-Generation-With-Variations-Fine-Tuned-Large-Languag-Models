module example7_13(A, B, f);
input[1:0] A;
input[1:0] B;
output f;
wire f;
always @*
begin
    case(A)
        0: f = B;
        1: f = A;
        default: f = 1'b1;
    endcase
end
endmodule
### Output:
f = 10
```

```
### Base Verilog Code:
module example7_14(A, B, f);
input[1:0] A;
input[1:0] B;
output f;
wire f;
always @*
begin
    case(A)
        0: f = B;
        1: f = A;
        default: f = 1'b1;
    endcase
end
endmodule
### Variation Instruction:
Add inside