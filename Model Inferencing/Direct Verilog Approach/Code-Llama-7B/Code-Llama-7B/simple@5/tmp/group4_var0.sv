module testbench ();
struct a;
rand int z;
endstruct
a a1, a2;
initial begin
  a1 = new();
  a2 = new();
  repeat(10) begin
    randomize(a1);
    print_int(a1.z);