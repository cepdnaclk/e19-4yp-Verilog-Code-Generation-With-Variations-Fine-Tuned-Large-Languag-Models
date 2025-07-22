module ha_2(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = 1;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Execution:
[user@host]$ vvp -n -M. -m ha_2 test.v -lxt2
### Run Results:
[user@host]$ vvp -M. -m ha_2 test.v -lxt2
### Expected Results:
[user@host]$ vvp -M. -m ha_2 test.v -lxt2
#!/usr/bin/env python3

import sys
from random import randint

NUM_TESTS = 100
NUM_ITERATIONS = 5

for i in range(NUM_TESTS):
  print("/*")
  print("## Base Verilog Code:")
  print("module ha_2(s,ca,a,b); // Half Adder with specparam path delays")
  print("  input a,b; output s,ca;")
  print("  specify")
  print("    specparam dl1 = 1; // Define specify parameter for s delay")
  print("    specparam dl2 = 1 + 1; // Define specify parameter for ca delay")
  print("    // Assign path delays using specparams")
  print("    (a, b *> s) = dl1;")
  print("    (a, b *> ca) = dl2;")
  print("  endspecify")
  print("  xor (s,a,b);")
  print("  and (ca,a,b);")
  print("endmodule")
  print("### Variation Instruction:")
  print("Replace the constant value delay assigned to ca with a specparam.")
  print("### Modified Code:")
  print("module ha_2(s,ca,a,b); // Half Adder with specparam path delays")
  print("  input a,b; output s,ca;")
  print("  specify")
  print("    specparam dl1 = 1; // Define specify parameter for s delay")
  print("    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay")
  print("    // Assign path delays using specparams")
  print("    (a, b *> s) = dl1;")
  print("    (a, b *> ca) = 1;")
  print("  endspecify")
  print("  xor (s,a,b);")
  print("  and (ca,a,b);")
  print("endmodule")
  print("### Execution:")
  print("[user@host]$ vvp -n -M. -m ha_2 test.v -lxt2")
  print("### Run Results:")
  print("[user@host]$ vvp -M. -m ha_2 test.v -lxt2")
  print("###