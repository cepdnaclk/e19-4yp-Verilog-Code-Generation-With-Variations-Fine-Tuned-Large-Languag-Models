### Instruction to be applied:
use `inside` operator to index `data` and use packed array defined in module scope.
### Explanation:
We can get a bit of help from the automatic unpacking of the array of packed elements into an unpacked array in SystemVerilog.
### Output:
```
----------------------------------------------------------------------------
[TEST 1]
----------------------------------------------------------------------------
data[3]=11'b10101010101
index=2
data_out=11