[Source Code](fa.v)

### Expected Result:
```
ERROR: [Synth 15-209] Part-select expression has an invalid number of bits.
```

# 9.0 Array Parameterized Modules

## 9.0.2.2 - Assignment

### Original Code:
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule
### Variation Instruction:
In the always block, test use of a part-select expression in the inside