```
module D_latch (input en, d, output reg q, qb);
reg s;
always @(en or posedge clk)
if (en)
begin
s = d;
q = s;
qb =!s;
end
endmodule
```
### Synthesis Results:
![4](https://user-images.githubusercontent.com/67792145/111881872-9096d800-89c5-11eb-9054-51d91f93ee56.PNG)