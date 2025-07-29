module ha_9(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if ( (a, b) inside {[0:1] [6:7], [4:5] [8:9]} ) begin
      (a, b *> s) = dl1;
      (a, b *> ca) = dl2;
    end
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### What does this do?
1. This adds an if condition checking whether the element is inside the range list [0:1] [6:7] or [4:5] [8:9].
2. If it is inside the range list, then we apply the path delays for the output.

### Sample Testbench Code:
module ha_test;
  wire ca, s;
  reg [3:0] a,b;
  ha_9 dut(.s(s),.ca(ca),.a(a),.b(b));
  initial begin
    $dumpfile("ha_viz.vcd"); $dumpvars(1);
    #(10);