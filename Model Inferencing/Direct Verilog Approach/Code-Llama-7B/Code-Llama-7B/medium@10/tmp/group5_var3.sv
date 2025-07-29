module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
logic a[2][3][4] [5:0];
logic a11 [4][5];
always_comb
begin
 a11 = a[2];
end
endmodule
### Expected Output:
### Compile-Time Failure:
### Runtime Semantic Checks:
Type Check: 
    - [x] PASS: a11 has type logic[4][5]
Value Check: 
    - [x] PASS: a11[2][3] == a[2][2][3]
    - [x] PASS: a11[2][1] == a[2][2][1]
    - [x] PASS: a11[2][0] == a[2][2][0]
    - [x] PASS: a11[1][3] == a[2][1][3]
    - [x] PASS: a11[1][2] == a[2][1][2]
    - [x] PASS: a11[1][1] == a[2][1][1]
    - [x] PASS: a11[1][0] == a[2][1][0]
    - [x] PASS: a11[0][3] == a[2][0][3]
    - [x] PASS: a11[0][2] == a[2][0][2]
    - [x] PASS: a11[0][1] == a[2][0][1]
    - [x] PASS: a11[0][0] == a[2][0][0]
    - [x] PASS: a11 has type logic[4][5]
Type Check: 
    - [x] PASS: a11[1][2][3] == a[2][1][2][3]
    - [x] PASS: a11[1][1][3] == a[2][1][1][3]
    - [x] PASS: a11[1][0][3] == a[2][1][0][3]
    - [x] PASS: a11[1][2][2] == a[2][1][2][2]
    - [x] PASS: a11[1][1][2] == a[2][1][1][2]
    - [x] PASS: a11[1][0][2] == a[2][1][0][2]
    - [x] PASS: a11[1][2][1] == a[2][1][2][1]
    - [x] PASS: a11[1][1][1] == a[2][1][1][1]
    - [x] PASS: a11[1][0][1] == a[2][1][0][1]
    - [x] PASS: a11[1][2][0] == a[2][1][2][0]
    - [x] PASS: a11[1][1][0] == a[2][1][1][0]
    - [x] PASS: a11[1][0][0] == a[2][1][0][0]
    - [x] PASS: a11[0][2][3] == a[2][0][2][3]
    - [x] PASS: a11[0][1][3] == a[2][0][1][3]
    - [x] PASS: a11[0][0][3] == a[2][0][0][3]
    - [x] PASS: a11[0][2][2] == a[2][0][2][2]
    - [x] PASS: a11[0][1][2] == a[2][0][1][2]
    - [x] PASS: a11[0][0][2] == a[2][