module ALU\_signed (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule
### Simulation:
![signed_arithmetic](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex4.PNG)

The simulation result is correct according to the specifications.

### Ex.5:
#### Specifications:
Modify the `ALU_signed` module so that it can support the following four operation functions:
* Addition
* Subtraction
* Multiplication
* Division (Divide by zero is undefined)

#### Design:
![design](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex5.PNG)

The following are the specifications about the ALU_signed module:
![ALU_signed_spec](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex5_spec.PNG)

The following are the specifications about the ALU_signed_test module:
![ALU_signed_test_spec](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex5_spec_test.PNG)

The generated Verilog code is as follows:
![ALU_signed_module_top](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex5_module_top.PNG)
![ALU_signed_module](https://github.com/F-Xuan/Digital-Logic-Lab/blob/main/Lab6/Lab6_2_ex5_module.PNG)

#### Testing:
The following is the test bench:
![Test_Bench](https://github