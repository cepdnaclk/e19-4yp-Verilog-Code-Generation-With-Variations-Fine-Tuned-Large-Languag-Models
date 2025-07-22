module AndingUnion (unpacked input a, b, output y);
and (y, a, b);
endmodule
### Expected Output:
- Testbench failure.
- Expected to detect errors in packed union as input to module ports.