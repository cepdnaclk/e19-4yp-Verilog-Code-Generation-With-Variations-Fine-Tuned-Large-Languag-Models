enum { A=1, B=2, C=3, D=4 } state;
typedef union packed {
A, B, C, D
} T_out;
T_out out;
### Test Cases:
* D -> 7
* C -> 6
* B -> 5
* A -> 4
* W -> X
### Test Result:
| Test Case | Expected Result | Simulator Result |
|:------:|:------:|:------:|
| A | 4 |  4 |
| B | 5 |  5 |
| C | 6 |  6 |
| D | 7 |  7 |
| W | X | X |


### Base Verilog Code:
module latch (input d, c, output reg q, q_b