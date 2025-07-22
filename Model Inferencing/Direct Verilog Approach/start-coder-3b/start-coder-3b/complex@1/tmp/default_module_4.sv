module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
### Testing Results:

![Vivado HLS](../img/HLS-07.png)

![Vivado Block Diagram](../img/HLS-08.png)# 2.4.1. Vivado High Level Synthesis (HLS)

## 2.4.1.1. Introduction

In this lab, you will practice creating Vivado High Level Synthesis (HLS) designs.

## 2.4.1.2. Vivado High Level Synthesis (HLS) Environment Setup

The environment setup is mostly the same as that of previous labs.

### 2.4.1.2.1. Get the source codes

For this lab, you will need the following files for creating the `Vivado_HLS` project.  You can download these files by right-clicking on the following links and selecting `Save Link As...` from the pop-up menu and saving the files to a directory of your choice.


- [test.cpp](../src/test_code/2.4.1/test.cpp)
- [test.h](../src/test_code/2.4.1/test.h)

### 2.4.1.2.2. Create Vivado HLS Project

We will be working with `Vivado HLS` project in this lab.  The first step in creating the project is to create the project.  To create the project, in the `File Manager` window, click on the `New Project` button.  In the pop-up menu that appears, navigate to `Vivado_HLS` and click on the `Next` Button.  In the next window that appears, in the `Project Name` and `Project Directory` fields, enter the following:

```
Project Name:  my_hls_project
Project Directory:  <your_project_directory> (leave this empty)
```

![Create Vivado HLS Project](../img/HLS-01.png)

Click on `Finish` to create the project.

### 2.4.1.2.3. Add Sources to the Vivado HLS Project

In the `File Manager` window, navigate to the directory that contains the `test.cpp` and `test.h` files from the previous lab.  Drag the `test.cpp` and `test.h` files to the `Source Sources` tab.

![Add Source Files to the Vivado HLS Project](../img/HLS-02.png)

### 2.4.1.2.4. Add System-Level Header File to the Vivado HLS Project

Next, we will add a header file that contains the definitions of all the functions that we will be using in our testbench.  To add your header file, click on the `Add Files` drop-down menu in the `Source Sources` tab and select `Add Files`.  In the pop-up window that opens, navigate to the directory that contains the `test.h` file and add the `test.h` file to the `Source Sources` tab.

![Add Header File to the Vivado H