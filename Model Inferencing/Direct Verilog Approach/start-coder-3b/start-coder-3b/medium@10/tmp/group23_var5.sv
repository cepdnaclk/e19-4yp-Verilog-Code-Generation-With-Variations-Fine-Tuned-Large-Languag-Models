reg[3:0] Adr;
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr[0]] <= Ibus;
else if (Adr[1]==1’b0)
    Storage[Adr[0]] <= Ibus;
else if (Adr[2]==1’b0)
    Storage[Adr[0]] <= Ibus;
else if (Adr[3]==1’b0)
    Storage[Adr[0]] <= Ibus;
else
    ObusReg <= Storage[Adr[0]];
endmodule
### Testbench:
- This is a modified testbench to test the modified code.
```

**Instructions:**

- Open the **Modified Code** file in Vivado.
- Run the **Simulation** to verify the output of the **RAM** module.
- Run the **Analysis** to see the **Synthesis** report.
- Run the **Optimization** to see the **Optimization** report.
- Run the **Static Timing Analysis** tool to see the **Static Timing Analysis** report.
- Run the **System Timing Analysis** tool to see the **System Timing Analysis** report.
- Run the **Power Analysis** to see the **Power Analysis** report.
- Download the **Synthesis** report, **Optimization** report, **Static Timing Analysis** report, **System Timing Analysis** report, and **Power Analysis** report for the code and save them in a folder named **Assignment 3**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 3** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Assignment 4

**Description:**

In this assignment, you are going to work on the hardware implementation of a **Viterbi Decoder** and **FPGA Implementation**. You are going to use the **Modified Code** from Assignment 3. You are also provided with a **Testbench** to verify your modified code.

**Instructions:**

- Open the **Modified Code** file in Vivado.
- Run the **Implementation** to see the **Implementation** report for the code.
- **Synthesize** your code.
- Create a **Project** in Vivado, **Open Project** using the **implementation.bit**.
- Run the **Simulation** to verify the output of the **Viterbi Decoder** module.
- Download the **Synthesis** report, **Implementation** report, and your **implementation.bit** for the code and save them in a folder named **Assignment 4**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 4** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Assignment 5

**Description:**

In this assignment, you are going to work on the hardware implementation of a **Decoder** and **FPGA Implementation**. In this assignment, instead of a **Testbench**, you are going to use the test vectors which are provided to you in the **Assignment 5** folder. You are also provided with the **Modified Code** from Assignment 4.

**Instructions:**

- Open the **Modified Code** file in Vivado.
- Run the **Implementation** to see the **Implementation** report for the code.
- **Synthesize** your code.
- Create a **Project** in Vivado, **Open Project** using the **implementation.bit**.
- Run the **Simulation** to verify the output of the **Decoder** module.
- Download the **Synthesis** report, **Implementation** report, and your **implementation.bit** for the code and save them in a folder named **Assignment 5**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 5** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Assignment 6

**Description:**

In this assignment, you are going to work on the hardware implementation of a **Decoder** using **Vivado HLS** and **FPGA Implementation**. In this assignment, instead of a **Testbench**, you are going to use the test vectors which are provided to you in the **Assignment 6** folder. You are also provided with the **Modified Code** from Assignment 4.

**Instructions:**

- Open the **Modified Code** file in Vivado.
- Create a **C++** file named **test_vit.cpp** in the **C++ Testbench** folder.
- Run the **HLS** tool to see the **HLS** report for the code.
- **Synthesize** your code.
- Download the **HLS** report, **Implementation** report, and your **implementation.bit** for the code and save them in a folder named **Assignment 6**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 6** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Assignment 7

**Description:**

In this assignment, you are going to work on the **FPGA Implementation** of the **Viterbi Decoder** and the **Decoder**. You are provided with the **Modified Code** from Assignment 4 in the **Modified Code** folder.

**Instructions:**

- Create a **Project** in Vivado, **Open Project** using the **implementation.bit**.
- Download the **Implementation** report for the code and save it in a folder named **Assignment 7**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 7** folder and provide us the report.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Assignment 8

**Description:**

In this assignment, you are going to work on the **FPGA Implementation** of the **Decoder** using **HLS**. You are provided with **Modified Code** and the **Testbench** from Assignment 6 in the **Modified Code** folder.

**Instructions:**

- Open the **Modified Code** file in Vivado.
- Create a **C++** file named **test_vit.cpp** in the **C++ Testbench** folder.
- Run the **HLS** tool to see the **HLS** report for the code.
- Download the **HLS** report, and your **implementation.bit** for the code and save them in a folder named **Assignment 8**.
- Make sure to keep the folder **Assignment 1-6** in the same directory.
- Check the **Assignment 8** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***

## Timing and Power Reports

**Description:**

In this assignment, you are going to generate the **Timing** and **Power** reports of the **Viterbi Decoder** module and the **Decoder** module.

**Instructions:**

- Download the **Timing** and **Power** reports for the code and save them in a folder named **Timing and Power Reports**.
- Make sure to keep the folder **Assignment 1-8** in the same directory.
- Check the **Timing and Power Reports** folder and provide us the reports.

**Sample Outputs:**

You can find the sample outputs for the above-mentioned testbenches in the **Sample Outputs** folder.

***
## Final Grade

- **A+** - 99-100
- **A** - 90-98
- **B** - 80-89
- **C** - 70-79
- **D** - 60-69
- **F** - 50-59
- **F** - less than 50
- **No Grade** - not able to pass the assignment

***

## References

1. [Vivado User Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_2/ug902-vivado-user-guide.pdf)
2. [Vivado HLS User Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_2/ug931-vivado-hls-user-guide.pdf)