`timescale 1ns/100ps
module ALU8(input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
`
### Description:
Based on the instruction, the ALUout value depends on the mode.
### Procedural Assignment:
- ALUout = left + right
- ALUout = left - right
- ALUout = left & right
- ALUout = left | right
### Array Part-Select:
- left + right
- left - right
- left & right
- left | right
- default (when mode is not 0,1,2,3)
- left is the operand 1
- right is the operand 2
### Reasoning:
This is a good example where to implement the array part-select. This is because the ALUout value is dependant on left + right value, left - right, etc. So, the output value depends on the parts of left and right.
### Pros:
- The array part-select is a better choice here than the concatenation.
### Cons:
- The array part-select requires 4 bits of memory (4 registers) as compared to the concatenation method which required only 1 bit of memory.
- The array-part-select has a longer verification time. This is due to the four case statements and the four always_comb blocks.
- The array-part-select requires more resources (4 registers vs. 1 register).
### Design Changes:
- The concatenation is converted to the array part-select method.
### Other:
- The input part (8 bits) and the output part (8 bits) are not specified.
- The default case is not commented.
### Benchmark:
| No. | Method | Benchmark Value |
| -- | :---: | --- |
| 1 | Concatenation | 1482 |
| 2 | Array Part-Select | 1461 |
| 3 | Array Part-Select (1-3) | 1447 |
| 4 | Array Part-Select (0) | 1445 |

### Experiment Summary:
![experiment_1](https://user-images.githubusercontent.com/83311280/139595409-0a173f75-eb72-4502-b5be-c0149d449376.png)

### Experiment Results:
![results_1](https://user-images.githubusercontent.com/83311280/139595411-70656a8d-0121-4f21-b419-3f05c2b1b086.png)

### Reflection:
- The array-part-select is a better choice for the memory usage point of view.
- The array-part-select is better for the verification-time point of view especially when the number of cases exceeds 4.
- The array-part-select is better for the memory usage point of view.

### Reflection:
- The concatenation is a better choice for the verification-time point of view.
- The concatenation is better for the memory usage point of view.
- The array-part-select is better for the verification-time point of view especially when the number of cases exceeds 4.

### Final Thoughts:
- A case statement is a better choice when the number of conditions is not more than 4.
- The concatenation is a better choice when the number of cases is more than 4.
- The best way to design a circuit is to consider the memory use, the verification-time, the logic use, the resource use, and the port use.
### Summary:
- The concatenation is a better choice when the number of cases is more than 4.
- A case statement is a better choice when the number