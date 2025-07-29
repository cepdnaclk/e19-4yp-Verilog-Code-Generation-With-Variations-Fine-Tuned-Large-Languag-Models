```
module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] range_const[3:0] = '{4'b1111, 4'b0110, 4'b1111, 4'b1000};
always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = range_const[s];
    endcase
endmodule
```

### Violation Checking:
```
>> verilator -Wall --cc alu.v --exe --trace --coverage-line --coverage-line --coverage-line --coverage-line --coverage-line
>> make -j -C obj_dir/ -f Valu.mk Valu
>> python3 tests/testAlu.py
```

### Test Output
```
TESTS PASSED
```