module testbench ();
generate struct data begin
rand struct data_member begin
rand data_mem[data_size] begin
rand [31:0] rand_member;
end
end
end
endmodule
### Trace:
- RTL view
  - The code is changed with a struct inside a struct.
  - The value of the rand member is not shown.
- Waveform
  - The output waveform shows the same value for the random member.
  - The value of the rand member is not random.
- Coverage