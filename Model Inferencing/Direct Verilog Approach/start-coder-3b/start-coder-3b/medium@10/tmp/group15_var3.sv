```
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
wire [7:0] ALU_result;
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase

    ALU_result = {right,left}[(mode==0)?0:1]; 
end
endmodule
```
##### 2. How to synthesize the behavioral model using Verilog HDL?
To synthesize the behavioral model, click on the Generate Symbol Table button. Then, you can select to synthesize the code.
##### 3. How to show the resulting design and report in the GUI?
To show the resulting design, click on the Design Explorer button. You can see the resulting design of the design in the Design Explorer GUI.

![1.PNG](img/1.PNG)

To show the report of the design, click on the Report Explorer button. You can see the report of the design in the Report Explorer.

![2.PNG](img/2.PNG)

### How to verify the functional correctness of the design?
#### 1. How to synthesize the behavioral model using Verilog HDL?
To synthesize the behavioral model, click on the Generate Symbol Table button. Then, you can select to synthesize the code.  

#### 2. How to show the resulting design and report in the GUI?
To show the resulting design, click on the Design Explorer button. You can see the resulting design of the design in the Design Explorer GUI.

![3.PNG](img/3.PNG)

To show the report of the design, click on the Report Explorer button. You can see the report of the design in the Report Explorer.

![4.PNG](img/4.PNG)

#### 3. How to use the Verification Assistant?
To use the Verification Assistant, click on the Verification Assistant button. You can see the Verification Assistant of the resulting design in the Verification Assistant GUI.

![5.PNG](img/5.PNG)

To open the Verification Assistant of the design, click on the Open Verification Assistant button.

![6.PNG](img/6.PNG)

To start and stop the Verification Assistant, click on Start/Stop button. The design will be verified and the report will be showed in the Verification results tab. The verification may take a bit.

![7.PNG](img/7.PNG)

### How to find and design unit-level tests to verify your behavioral models?
#### 1. Introduction
To design test benches for functional correctness of the design, we need to use the Behavioral Test Library in the Verification Assistant.

#### 2. How to design test benches?
To design test benches for functional correctness, select the Test Symbols tab of the Verification Assistant, and click on the Test Bench Generator button.

![8.PNG](img/8.PNG)

To design test benches, click on the Design Test Benches button. You can design test benches for functional correctness in the Test Symbols tab.

![9.PNG](img/9.PNG)

To generate test benches for functional correctness, click on the Generate Test Bench button.

![10.PNG](img/10.PNG)

To open the Design Test Benches, click on the Open Test Bench button. Then, you can see the Test Bench for functional correctness in the Design Test Benches tab.

![11.PNG](img/11.PNG)

#### 3. How to run the test benches?
To run the test benches for functional correctness, click on the Run Tests button. Then, you can run the test benches for functional correctness. You can see the test results for the design in the Test Results tab.

![12.PNG](img/12.PNG)

### How to find and design model-level tests to verify your behavioral models?
#### 1. Introduction
An example for model-level test is shown below. To design test benches for behavioral models, we need to use the Behavioral Test Library in the Verification Assistant.

![13.PNG](img/13.PNG)

#### 2. How to design test benches?
To design test benches for behavioral models, select the Test Symbols tab of the Verification Assistant, and click on the Test Bench Generator button.

![14.PNG](img/14.PNG)

To design test benches for behavioral models, click on the Design Test Benches button. You can design test benches for behavioral models in the Test Symbols tab.

![15.PNG](img/15.PNG)

To generate test benches for behavioral models, click on the Generate Test Bench button.

![16.PNG](img/16.PNG)

To open the Design Test Benches, click on the Open Test Bench button. Then, you can see the Test Bench for behavioral models in the Design Test Benches tab.

![17.PNG](img/17.PNG)

#### 3. How to run the test benches?
To run the test benches for behavioral models, click on the Run Tests button. Then, you can run the test benches for behavioral models. You can see the test results for the design in the Test Results tab.

![18.PNG](img/18.PNG)

/Lab4/README.md
# Lab 4

##### Student Name: 
##### Student ID: 151160003

# 1. The Results

#### Verilog code for the circuit:

```verilog
module ALU8 (
    input [7:0] left,
    input [7:0] right,
    input [1:0] mode,
    output [7:0] ALUout
);
wire [7:0] ALU_result;
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase

    ALU_result = {right,left}[(mode==0)?0:1];
end
endmodule
```

#### Simulation Results:

![1.PNG](img/1.PNG)
![2.PNG](img/2.PNG)

# 2. The Verification

#### 1. How to find and design unit-level tests to verify your behavioral models?

To design test benches for functional correctness, select the Test Symbols tab of the Verification Assistant, and click on the Test Bench Generator button.

![1.PNG](img/1.PNG)

To design test benches, click on the Design Test Benches button. You can design test benches for functional correctness in the Test Symbols tab.

![2.PNG](img/2.PNG)

To generate test benches for functional correctness, click on the Generate Test Bench button.

![3.PNG](img/3.PNG)

To open the Design Test Benches, click on the Open Test Bench button. Then, you can see the Test Bench for functional correctness in the Design Test Benches tab.

![4.PNG](img/4.PNG)

#### 2. How to run the test benches?

To run the test benches for functional correctness, click on the Run Tests button. Then, you can run the test benches for functional correctness. You can see the test results for the design in the Test Results tab.

![5.PNG](img/5.PNG)

#### 3. Did the test benches work as expected?

Yes, the test benches work as expected. All test results pass the simulation test.

![6.PNG](img/6.PNG)

#### 4. How to find and design model-level tests to verify your behavioral models?

An example for model-level test is shown below. To design test benches for behavioral models, we need to use the Behavioral Test Library in the Verification Assistant.

![7.PNG](img/7.PNG)

#### 4. How to design test benches?

To design test benches for behavioral models, select the Test Symbols tab of the Verification Assistant, and click on the Test Bench Generator button.

![8.PNG](img/8.PNG)

To design test benches for behavioral models, click on the Design Test Benches button. You can design test benches for behavioral models in the