module `tst_seq_ff`();
  reg ff_s_i;
  reg ff_s_q;
  reg ff_s_d;
  `gen_block1` seq_ff sff(ff_s_i,ff_s_d,ff_s_q) inside {
    // Nor gate implementation inside block.
    always@(posedge ff_s_i) begin
      ff_s_q <= ff_s_i;
    end
    assign ff_s_d = ff_s_q ^ ff_s_i;
  }
endmodule
### Results:
```
# 1. 000000000000000000000000 # 2. 01000000000000000000000000000000000000000000000000000000000000000 # 3. 01010000000000000000000000000000000000000000000000000000000000000 # 4. 010110000000000000000000000000000000000000000000000000000000