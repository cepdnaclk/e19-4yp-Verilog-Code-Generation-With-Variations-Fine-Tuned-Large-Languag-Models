module alu_1(d,co,f,a,b,cci);  // Inputs
  output wire[3:0]d;  // Outputs
  output wire[1:0] f; // Function Code
  input a,b;
  input cci;
  assign d = a+ b; // Addition
  assign f = 2'b00; // ALU function code
  assign co = d[3]; // Complement output bit
  assign f = 2'b01; // ALU function code
  assign d = a* b; // Multiplication
  assign co = d[3]; // Complement output bit
  assign f = 2'b11; // ALU function code
  assign d = a^ b; // XOR
endmodule
### Simulation Result:
![image](https://github.com/tianhema/verilog-examples/blob/master/alu_1/alu_1.png)
/alu_1/sim.sh
#!/bin/bash
vvp -m alu_1 alu_1 -l alu_1.log