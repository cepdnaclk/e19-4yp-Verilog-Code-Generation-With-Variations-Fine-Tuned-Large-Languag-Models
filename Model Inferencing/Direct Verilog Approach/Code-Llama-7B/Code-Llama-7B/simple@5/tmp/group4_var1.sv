module testbench ();
struct {rand int data[$];} data;
data.data = new[3];
data.data[0] = 1;
data.data[1] = 2;
data.data[2] = 3;
foreach (data.data) begin
  rand_sequence temp;
  temp.randomize();
end
endmodule
### Variation Instruction: