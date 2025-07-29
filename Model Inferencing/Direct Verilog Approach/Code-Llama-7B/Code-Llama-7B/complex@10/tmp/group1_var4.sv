module nor3NMOS(in1,in2,in3,out);
  input in1,in2,in3; output out;
  genvar i;
  generate
  for(i = 0; i < 3; i = i + 1) begin : gen_block1
  nor nor_block1(in1[i],in2[i],in3[i],out[i]);
  end
  endgenerate
endmodule
### Simulation Output:
| Time    | in1 | in2 | in3 |  out |
|:--------|:----|:----|:----|:-----|
| 0       | X   | X   | X   | X    |
| 2       | X   | X   | X   | X    |
| 3       | X   | X   | X   | X    |
| 4       | X   | X   | X   | X    |
| 5       | X   | X   | X   | X    |
| 6       | X   | X   | X   | X    |
| 7       | X   | X   | X   | X    |
| 8       | X   | X   | X   | X    |
| 9       | X   | X   | X   | X    |
| 10      | X   | X   | X   | X    |
| 11      | X   | X   | X   | X    |
| 12      | X   | X   | X   | X    |
| 13      | X   | X   | X   | X    |
| 14      | X   | X   | X   | X    |
| 15      | X   | X   | X   | X    |
| 16      | X   | X   | X   | X    |
| 17      | X   | X   | X   | X    |
| 18      | X   | X   | X   | X    |
| 19      | X   | X   | X   | X    |
| 20      | X   | X   | X   | X    |
| 21      | X   | X   | X   | X    |
| 22      | X   | X   | X   | X    |
| 23      | X   | X   | X   | X    |
| 24      | X   | X   | X   | X    |
### Verification Report:
| Section    | Rule           | Status |
|:-----------|:---------------|:-------|
| Timing     | TIM55_NOR_OUTPUTS | Pass   |
| Parameter  | PAR1          | Pass   |
| Parameter  | PAR5          | Pass   |
|