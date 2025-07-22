module test_k;
wire clock;
wire q;
wire j, k, preset, clear;
reg j, k;
integer i;
array[0:3,0:3] jk_arr;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
jk_arr[0][0] = 1’b1;
jk_arr[0][1] = 1’b1;
jk_arr[0][2] = 1’b1;
jk_arr[1][0] = 1’b1;
jk_arr[1][1] = 1’b1;
jk_arr[1][2] = 1’b1;
jk_arr[2][0] = 1’b1;
jk_arr[2][1] = 1’b1;
jk_arr[2][2] = 1’b1;
jk_arr[3][0] = 1’b1;
jk_arr[3][1] = 1’b1;
jk_arr[3][2] = 1’b1;
m555 timer(clock);
endmodule
### Results:
The MDA is implemented with a procedural assignment inside a loop. The FF is tested with preset inputs that vary every 4 time cycles by 1 bit. The first 3 time cycles are not changed, so there is no preset in the first 3 time cycles. The 4th cycle has only the first preset bit reset, the 5th cycle has both reset bits set and the bit in the middle reset, the 6th cycle has all the edges set.

#### Simulation Results:
{{% figure src="test-k-mda/test-k-mda-sim-results-mda-array.png" width="100%" caption="Figure 13: Simulation Results" numbered=true %}}

[1]: https://www.edaplayground.com/x/V6j
[2]: https://www.edaplayground.com/x/W23
[3]: https://www.edaplayground.com/x/Y0i
[4]: https://www.edaplayground.com/x/Y0k
[5]: https://www.edaplayground.com/x/Y0m
[6]: https://www.edaplayground.com/x/Y0q
[7]: https://www.edaplayground.com/x/Y0u
[8]: https://www.edaplayground.com/x/W25
[9]: https://www.edaplayground.com/x/W27
[10]: https://www.edaplayground.com/x/W29
[11]: https://www.edaplayground.com/x/W2b
[12]: https://www.edaplayground.com/x/W2d
[13]: https://www.edaplayground.com/x/W2f
[14]: https://www.edaplayground.com/x/W2h
[15]: https://www.edaplay