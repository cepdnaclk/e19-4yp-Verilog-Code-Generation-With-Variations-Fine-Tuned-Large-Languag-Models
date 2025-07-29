module testbench;
struct packed rand struct {
  rand logic x;
} data;
endmodule

### Pass Criteria:
Verilog compiler must report a fatal error if rand cannot be used inside a struct.
### Error Log:
**Error (suppressible): (vlog-2169) near "struct": $randomize is not supported on this type.
      (test_rand_in_struct.v