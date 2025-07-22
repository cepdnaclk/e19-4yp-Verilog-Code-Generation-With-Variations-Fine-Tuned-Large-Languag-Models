module mltp_b(a1,a0,b1,b0,c1,c2,c3,c4);
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  reg[1:4] mand[1:9]; reg[1:9] mor[1:4]; reg p1,p2,p3,p4,p5,p6,p7,p8,p9; reg c1,c2,c3,c4;
  initial begin
    $and(mand, {b1,b0,a1,a0}, {{4{1'b1}},{9{1'b0}}}, {{4{1'b0}},{9{1'b1}}});
    $or(mor, {{9{1'b1}},{9{1'b0}}}, {{1{1'b1}},{9{1'b0}}}, {{1{1'b0}},{9{1'b1}}});
  end
  function[4:0] getand(input[1:4] x);
    $return$(x & 4'b1111); // Corrected input order?
  endfunction
  function[9:0] getor(input[1:9] x);
    $return$(x | 9'b111111111); // Corrected output order?
  endfunction
endmodule
### Results:
```
[18-04-2010] Time: 0.03 ps (on chip in cell mltp_b)
[18-04-2010] Time: 0.08 ps (off chip in cell mltp_a)
```