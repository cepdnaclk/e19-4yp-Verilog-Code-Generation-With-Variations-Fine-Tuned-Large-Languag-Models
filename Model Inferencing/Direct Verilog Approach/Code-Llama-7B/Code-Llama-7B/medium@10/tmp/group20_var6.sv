module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
final Count[2:1] = 0;
endmodule
### Expected Result:
- Output:
![expected output](expected.png)
- Error message:
![error message](error.png)
- Source code:
![source code](source.png)

Reference: [[1]](https://stackoverl