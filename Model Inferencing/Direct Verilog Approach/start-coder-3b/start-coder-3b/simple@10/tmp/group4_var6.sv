module testbench ();
generate data;
process data;
endmodule
### Proposed Solution:
To solve this issue, the data should be put in a struct with a rand member. 
### Relevant Files:
1. [data_struct.txt](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/data_struct.txt)
2. [testbench_with_data_struct.txt](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/testbench_with_data_struct.txt)
/Advanced_Topics_in_Verilog/Advanced_Topics_in_Verilog_11/Advanced_Topics_in_Verilog_11.md
# Advanced Topics in Verilog: 11 - Verilog for Computer Architectures and Performance Analysis

## Overview

* The course content includes a presentation and a set of assignments. The presentation gives an introduction to Verilog and covers some of the concepts discussed in the lecture; the assignments provide practice with Verilog.

* The course has been split into 2 parts.

  Part 1 covers the Vivado HLS tool and performance analysis using the DSE flow.

  Part 2 covers FPGAs, and gives an introduction to synthesis, mapping, and a brief introduction to Vitis.

* In the first part, you will use Vivado HLS to port a C program to the x86 FPGA platform, and then use the DSE flow to generate RTL for the program.

* In the second part, you will synthesize the RTL to an FPGA and then perform a mapping and timing analysis.

* The assignments included in Part 1 have been divided into 5 sections, and each section is marked with a code snippet at the top of the file. The name of the section corresponds to the Vivado HLS tool command used to execute the command. Each section contains a Verilog code snippet, and there is a set of assignments to complete. The files with the assignment names are listed in the table below. 

|  Section ID | Section Name        | Code Snippet         | File           |
| ----------- | ------------------- | ------------------- | -------------- |
| 1           | 1_add               | "add"                | "adder.v"      |
| 2           | 1_sub               | "sub"                | "sub.v"        |
| 3           | 2_add_sub           | "add_sub"            | "add_sub.v"    |
| 4           | 3_add_sub_multiply  | "add_sub_multiply"  | "add_sub_mult.v" |
| 5           | 4_mult_div          | "mult_div"           | "mult_div.v"   |

## Assignment 1

In this assignment, you will use the Vivado HLS tool to port a simple C program to the x86 FPGA platform. The C program performs simple arithmetic operations, and generates a 32 bit fixed point result. The fixed point result is stored in a 32 bit integer. The fixed point format is 15 bits integer and 16 bits fractional. The program also prints out the result of the computation in text format. The program source can be found in the file [adder.c](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/adder.c).

Port the program to the x86 FPGA platform. You will need to add a file to the folder [hls](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/tree/main/Advanced_Topics_in_Verilog_11/hls). This file will be the C source file to port to x86.

```bash
sudo hls -f./adder.c -s add -o./hls -D x86_sim
```

To generate the RTL for the adder, you will use the Vivado HLS tool. In the command below, you will need to replace the <ADD_SUB_MUL_MULT_DIV> with the name of the folder where your generated files will be placed. The <ADDER.H> file will also need to be replaced with the name of the header file for the generated code.

```bash
sudo vivado_hls -f <ADD_SUB_MUL_MULT_DIV>.tcl
```

The tcl file will be placed in the [hls/syn](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/tree/main/Advanced_Topics_in_Verilog_11/hls/syn). The file is called [adder.tcl](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/adder.tcl).

You should now have the following files in the [hls/syn/verilog](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/tree/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog). The files are: [adder.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder.v), [multiplier.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/multiplier.v), [adder.h](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder.h), [adder_tb.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder_tb.v), and a [project.runs](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder_tb.v).

In the file [adder.h](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder.h), you can see the function prototype for the function add.

```verilog
int add(int, int);
```

You can see the function call to the add function in [adder_tb.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder_tb.v).

```verilog
initial begin
    $dumpfile("adder_tb.vcd");
    $dumpvars(0,adder_tb,#0);
    main_add_sub_mul_mult_div();
    $finish;
end
```

The function main_add_sub_mul_mult_div() can be found in [adder_tb.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder_tb.v).

```verilog
void main_add_sub_mul_mult_div()
{
    int a = 1;
    int b = 2;
    int result = add(a, b);
    print_result(a, b, result);
}
```

The function print_result() can be found in [adder_tb.v](https://github.com/Vitis-Tutorials/Advanced_Topics_in_Verilog/blob/main/Advanced_Topics_in_Verilog_11/hls/syn/verilog/adder_tb.v).

```verilog
void print_result(int a, int b, int result)
{
    $display("%d + %d = %d", $signed(a), $signed(b), $signed(result));
    $display("\n");
}
```

## Assignment 2

In this assignment, you will use the Vivado HLS tool to port a simple C program to the x86 FPGA platform. The C program performs simple arithmetic operations, and generates a 32 bit fixed point result. The fixed point result is stored in a 32 bit integer. The fixed point format is 15 bits integer and 16 bits fractional. The program also prints out the result of the computation in text format. The program source can be found in