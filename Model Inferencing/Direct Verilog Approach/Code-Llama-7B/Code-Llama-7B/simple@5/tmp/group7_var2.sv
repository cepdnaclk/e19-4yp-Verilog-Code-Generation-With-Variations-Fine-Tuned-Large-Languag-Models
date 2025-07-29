module AndOr (output X, Y, input A, B, C);
assign X = A & B;
assign Y = B | C;
endmodule
### Expected Output:
No differences should be observed when comparing the output of this code.
### Simulation Output:
![simulation](https://github.com/BrianAstorga/Verilog_To_SystemVerilog/blob/master/Simulation%20Outputs/16.%20SystemVerilog%20Type%20BitInference.PNG)
### Simulation Input:
![simulation](https://github.com/BrianAstorga/Verilog_To_SystemVerilog/blob/master/Simulation%20Outputs/16.%