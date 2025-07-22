// Create a module with one input and one output that behaves like a wire
module wire_assign2( input bit clk_in[0:3][0:1], output bit clk_out[0:3][0:1] );
    // assign out to in
    assign clk_out = clk_in;
endmodule
```
### Output
```Verilog
[INFO]: Found 1 test(s). Prototyping...
[INFO]: Prototyped 0 tests. Elapsed time: 0.00s.
[INFO]: Prototyping 1 test(s). Elapsed time: 0.01s.
[INFO]: Prototyped 1 tests. Elapsed time: 0.01s.
[INFO]: Prototyping 1 test(s). Elapsed time: 0.01s.
[INFO]: Prototyped 1 tests. Elapsed time: 0.01s.
[INFO]: Running 1 test(s). Elapsed time: 0.09s.
[Passed]: test_wire_assign2_0_0_0
[Passed]: test_wire_assign2_0_0_1
[Passed]: test_wire_assign2_0_1_0
[Passed]: test_wire_assign2_0_1_1
[Passed]: test_wire_assign2_1_0_0
[Passed]: test_wire_assign2_1_0_1
[Passed]: test_wire_assign2_1_1_0
[Passed]: test_wire_assign2_1_1_1
[Passed]: test_wire_assign2_2_0_0
[Passed]: test_wire_assign2_2_0_1
[Passed]: test_wire_assign2_2_1_0
[Passed]: test_wire_assign2_2_1_1
[Passed]: test_wire_assign2_3_0_0
[Passed]: test_wire_assign2_3_0_1
[Passed]: test_wire_assign2_3_1_0
[Passed]: test_wire_assign2_3_1_1
[INFO]: Elapsed time: 0.90s.
```