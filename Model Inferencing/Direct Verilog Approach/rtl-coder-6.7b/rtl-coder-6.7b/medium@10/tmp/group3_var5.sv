```
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule
```
#### Command:
```
add -inst_pairs (fa0.o, fa0.a) -part_select
```
#### Verification :
```
assertion should fail and report an error.
```
#### Test cases:
```
```