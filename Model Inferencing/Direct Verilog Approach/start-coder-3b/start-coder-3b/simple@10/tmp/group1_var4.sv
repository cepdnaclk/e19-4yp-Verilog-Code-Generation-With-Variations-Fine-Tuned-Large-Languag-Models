// Verilog code for Problem 3
module Not_Gate(
    input A [0:3],
    output Y
);
    assign Y = ~A[0:3];
endmodule
### Verilog Testbench:
// Verilog testbench code for Problem 3
module Not_tb;
    logic A [0:3];
    assign A = {A[1:0]};
    Not_Gate not_gate(A);
    initial begin
        forever A = {A[1:0]};
        #10;
    end
endmodule
### Result:
// Problem 3: Verilog Testbench Result
![alt text](../results/Not_tb.png "Not tb")
### Comments:
The above test bench shows that the output Y is the NOT of the input A.