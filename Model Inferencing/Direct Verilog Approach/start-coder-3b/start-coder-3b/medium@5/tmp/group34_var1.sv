module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
endmodule
### Results:
After the first instruction, the value of ld [1] is now the value of sw [3]. The value of ld [2] has
been preserved. The value of ld [0] is now the sum of the values of sw [2] and sw [1].
0
ld [3]
Case
2
2
2
2
0
1
2
3
ld [2]
Case
2
2
2
2
0
1
2
3
ld [1]
Case
2
2
2
2
0
1
2
3
sw [3]
Case
2
2
2
2
0
1
2
3
sw [2]
Case
2
2
2
2
0
1
2
3
sw [1]
Case
2
2
2
2
0
1
2
3
sw [0]
Case
2
2
2
2
0
1
2
3
0
1
2
3
sw [3]
Case
2
2
2
2
0
1
2
3
sw [2]
Case
2
2
2
2
0
1
2
3
sw [1]
Case
2
2
2
2
0
1
2
3
sw [0]
Case
2
2
2
2
0
1
2
3
Results
On the second instruction, the value of ld [1] remains the same as the value of sw [3]. The value of ld [0]
has been preserved. The value of ld [2] is now the logical and of the values of sw [2] and sw [1].
2
3
3
3
1
1
1
1
0
1
2
3
3
3
1
1
1
1
2
2
2
2
0
1
2
3
3
3
1
1
1
1
ld [3]
Case
2
2
2
2
0
1
2
3
ld [2]
Case
2
2
2
2
0
1
2
3
ld [1]
Case
2
2
2
2
0
1
2
3
ld [0]
Case
2
2
2
2
0
1
2
3
sw [3]
Case
2
2
2
2
0
1
2
3
sw [2]
Case
2
2
2
2
0
1
2
3
sw [1]
Case
2
2
2
2
0
1
2
3
sw [0]
Case
2
2
2
2
0
1
2
3
0
1
2
3
sw [3]