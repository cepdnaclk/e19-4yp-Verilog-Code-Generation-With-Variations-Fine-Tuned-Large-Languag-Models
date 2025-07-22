module example4(Data_0, Data_1, Clock, Reset, RegSum_0, RegSum_1, Sum_0, Sum_1);
input Clock, Reset;
input [15:0, 15:0] Data_0, Data_1, RegSum_0, RegSum_1;
output [15:0] Sum_0, Sum_1;
wire [15:0] Sum_0, Sum_1;
reg4 R_0 (Sum_0, Clock, Reset, RegSum_0);
reg4 R_1 (Sum_1, Clock, Reset, RegSum_1);
assign Sum_0 = Data_0 + RegSum_0;
assign Sum_1 = Data_1 + RegSum_1;
endmodule
### Expected output on simulation:
### Actual output on simulation:

/Test/testcase_2/testcase_2_1/readme.md
# Test Case 2_1

## Scenario:

In this case we are testing the functionality of the module in a simple circuit, with a single input and two output.



## Steps to run the Code:

- Open your terminal 
- Copy and paste the following command:

```
iverilog -o test_input_one.sim test_input_one.v
```

Here, -o indicates the output file name.

Now run the following command:

```
vvp test_input_one.sim
```





## Output:

![image-20201017105103585](images/image-20201017105103585.png)

![image-20201017105121366](images/image-20201017105121366.png)

![image-20201017105137673](images/image-20201017105137673.png)

![image-20201017105149307](images/image-20201017105149307.png)

/Test/testcase_1/testcase_1_2/readme.md
# Test Case 1_2

## Scenario:

In this case we are testing the functionality of the module in a simple circuit, with two input and two output.

## Steps to run the Code:

- Open your terminal 
- Copy and paste the following command:

```
iverilog -o test_input_two.sim test_input_two.v
```

Here, -o indicates the output file name.

Now run the following command:

```
vvp test_input_two.sim
```

## Output:

![image-20201013103229046](images/image-20201013103229046.png)

![image-20201013103317041](images/image-20201013103317041.png)

![image-20201013103324150](images/image-20201013103324150.png)

![image-20201013103331216](images/image-20201013103331216.png)



/README.md
# Verilog-Testbench

## Goal:

This project intends to develop a testbench for the DUT using Icarus Verilog.

## About Icarus Verilog:

* Icarus Verilog is an open source software written by. It's used to test Verilog modules.

* Icarus Verilog is a small, portable, powerful software.

## Tools/Technologies:

* Icarus Verilog
* Git
* Vastag
* Verilator
* Verilator Tools

## Structure:

### Test/

The "Test" folder contains all the test cases.

#### Test1:

In this test case we are testing the functionality of the module in a simple circuit, with a single input and two output.

#### Test2:

In this test case we are testing the functionality of the module in a simple circuit, with two input and two output.

#### Test3:

In this test case we are testing the functionality of the module in an example with a register, with three inputs and one output.

#### Test4:

In this test case we are testing the functionality of the module in an example with a register, with three inputs and two outputs.

#### Test5:

In this test case we are testing the functionality of the module in an example with a mux, with two inputs and one output.

#### Test6:

In this test case we are testing the functionality of the module in an example with a mux, with two inputs and two outputs.

#### Test7:

In this test case we are testing the functionality of the module in an example with a mux, with three inputs and one output.

#### Test8:

In this test case we are testing the functionality of the module in an example with a mux, with three inputs and two outputs.

#### Test9:

In this test case we are testing the functionality of the module in an example with two registers, with four inputs and one output.

#### Test10:

In this test case we are testing the functionality of the module in an example with two registers, with four inputs and two outputs.

## Authors:

Group:

| Name            | SRN          |
| --------------- | ------------ |
|  | 015316       |
|    | 015538       |
|  | 015560       |
|   | 015564       |
|    | 015570       |



/Test/testcase_9/testcase_9_2/readme.md
# Test Case 9_2

## Scenario:

In this case we are testing the functionality of the module in an example with two registers, with four inputs and two outputs.



## Steps to run the Code:

- Open your terminal 
- Copy and paste the following command:

```
iverilog -o test_input_two.sim test_input_two.v
```

Here, -o indicates the output file name.

Now run the following command:

```
vvp test_input_two.sim
```





## Output:

![image-20201017111353715](images/image-20201017111353715.png)

![image-20201017111400706](images/image-20201017111400706.png)

![image-20201017111415578](