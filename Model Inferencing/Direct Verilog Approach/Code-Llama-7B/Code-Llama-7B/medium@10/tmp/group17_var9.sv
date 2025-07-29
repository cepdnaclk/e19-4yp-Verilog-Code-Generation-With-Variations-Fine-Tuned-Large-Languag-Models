```vhdl
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
always @ (*) begin
case (s)
1'b0: z <= c[0]; 
1'b1: z <= c[1];
2'b10: z <= c[2];
2'b11: z <= c[3];
endcase
end
endmodule
```
### Combined Code:
```vhdl
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
always @ (*) begin
case (s)
1'b0: z <= c[0]; 
1'b1: z <= c[1];
2'b10: z <= c[2];
2'b11: z <= c[3];
endcase
end
endmodule
```
### Test bench: