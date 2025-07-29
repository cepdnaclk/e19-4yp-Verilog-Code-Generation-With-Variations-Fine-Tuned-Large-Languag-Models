module AND_Gate(
    input [1:0] A [0:3],
    output Y
);
    assign Y = A[1] & A[2];
endmodule
### Synthesized/Simulated Output:
![synthesized_output](https://github.com/dannynguyen/EECS149-2018W-Labs-Verilog/blob/master/Lab7/Lab7-Problem-05/images/problem-05-synthesized.jpg?raw=true)
![simulated_output](https://github.com/dannynguyen/EECS149-2018W-Labs-Verilog/blob/master/Lab7/Lab7-Problem-05/images/problem-05-simulated.jpg?raw=true)

## Problem 6: Use the Verilog standard operator "inside" to