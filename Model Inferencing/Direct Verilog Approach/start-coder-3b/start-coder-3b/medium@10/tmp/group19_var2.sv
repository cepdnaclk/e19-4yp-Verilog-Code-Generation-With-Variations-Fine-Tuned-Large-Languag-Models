module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule
```
## **Results**

**Table 1: Number of lines of code**

| Algorithm | Total Lines of Code |
| ------ | ------ |
| Base | 3 |
| Variation | 8 |

**Table 2: Number of synthesis tools**

| Algorithm | Number of Synthesis Tools |
| ------ | ------ |
| Base | 2 |
| Variation | 3 |

**Table 3: Time taken by synthesis tools**

| Algorithm | Total Time (in Seconds) |
| ------ | ------ |
| Base | 31.5 |
| Variation | 26.2 |

**Table 4: Number of wires**

| Algorithm | Total Number of wires |
| ------ | ------ |
| Base | 4 |
| Variation | 3 |

**Table 5: Number of registers**

| Algorithm | Total Number of registers |
| ------ | ------ |
| Base | 1 |
| Variation | 0 |

**Table 6: Number of flip flops**

| Algorithm | Total Number of flip flops |
| ------ | ------ |
| Base | 0 |
| Variation | 0 |

**Table 7: Flip-flop vs. register**

| Algorithm | Total Number of flip flops |
| ------ | ------ |
| Base | 0 |
| Variation | 0 |

**Table 8: Number of LUTs**

| Algorithm | Total Number of LUTs |
| ------ | ------ |
| Base | 3 |
| Variation | 2 |

**Table 9: Number of combinational blocks**

| Algorithm | Number of combinational blocks |
| ------ | ------ |
| Base | 1 |
| Variation | 1 |

**Table 10: Number of sequential blocks**

| Algorithm | Number of sequential blocks |
| ------ | ------ |
| Base | 0 |
| Variation | 1 |

**Table 11: Combinational blocks vs. sequential blocks**

| Algorithm | Number of combinational blocks |
| ------ | ------ |
| Base | 1 |
| Variation | 1 |

**Table 12: Latches vs. registers**

| Algorithm | Number of latches |
| ------ | ------ |
| Base | 0 |
| Variation | 1 |

**Table 13: Number of sequential blocks vs. combinational blocks**

| Algorithm | Number of combinational blocks |
| ------ | ------ |
| Base | 1 |
| Variation | 1 |

**Table 14: Number of sequential blocks vs. registers**

| Algorithm | Number of registers |
| ------ | ------ |
| Base | 0 |
| Variation | 1 |

**Table 15: Total number of wires vs. registers**

| Algorithm | Total number of wires |
| ------ | ------ |
| Base | 4 |
| Variation | 3 |

**Table 16: Total number of flip-flops vs. registers**

| Algorithm | Total number of flip-flops |
| ------ | ------ |
| Base | 0 |
| Variation | 0 |

**Table 17: Number of LUTs vs. registers**

| Algorithm | Total