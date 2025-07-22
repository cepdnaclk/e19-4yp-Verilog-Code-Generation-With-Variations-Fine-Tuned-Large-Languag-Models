module dec2_4beh(output reg [3:0] o, input [1:0] i);
always @(i)
begin
$display ("i [0]: %d i [1]: %d ", i[0], i[1]);
if (i [0] | i [1])
o [i [1]? 2'b11 : i [0]] <= 4'b1;
end
endmodule
### Results:
```
i [0]: 0 i [1]: 0
i [0]: 1 i [1]: 0
i [0]: 0 i [1]: 1
i [0]: 1 i [1]: 1
```