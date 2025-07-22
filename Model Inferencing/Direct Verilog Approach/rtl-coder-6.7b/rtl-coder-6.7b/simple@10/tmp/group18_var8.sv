module show_aa(ao,ai); // NOT gate with delay 2
  enum {A,,B} {A=2,B=3} ao; enum {A,,B} {A=2,B=3} ai;
  not #2 (ao,ai);
endmodule
### Test Vector:
| ai | ao |
|----|----|
| A  | B  |
| B  | A  |
| A  | B  |
| B  | A  |
### Expected Output:
| ai | ao |
|----|----|
| A  | B  |
| B  | A  |
| A  | B  |
| B  | A  |