module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Generated Verilog Code:
module func1 (
      input  logic [0:0] x1,
      input  logic [0:0] x2,
      input  logic [0:0] x3,
      output logic [1:0] f
  );
assign f = (x1 | x2 & ~x3) & (~x1 | ~x2 & x3) & (~x1 | x2 & ~x3);
endmodule
### Simulation Output:
Vcd file generated and can be viewed at: /home/rachel/Desktop/Lab/Lab6/Debug/func1_verilog.vcd
### Simulation Results:
```
$ gtkwave func1_verilog.vcd
```
### Simulation Details:
![sim_results](https://github.com/rachelholmes/Logic-Design-Lab-6/blob/master/Images/sim_results.png)
/Lab5/Instructions.md
## Lab 5 Instructions
This lab focuses on using **Logic Synthesis** and **Gate Counting** to measure resources used by logic circuits.
### 1. Create a.v file as follows:
```
module func1(x1,x2,x3,y1,y2,y3,y4,y5,z);
input x1,x2,x3;
output y1,y2,y3,y4,y5,z;

// first gate
assign y1 = x1;

// second gate
assign y2 = x1 & x2;

// third gate
assign y3 = ~x1 | x2;

// fourth gate
assign y4 = ~x3;

// fifth gate
assign y5 = x1 & ~x2 & ~y4;

// sixth gate
assign z = ~x1 | y3 & y5;
endmodule
```
### 2. Run **Logic Synthesis** and enter the circuit topology in the GUI.
![logic_synthesis](https://github.com/rachelholmes/Logic-Design-Lab-5/blob/master/Images/logic_synthesis.png)
### 3. Generate the synthesized circuit in Verilog.
### 4. Open the.v file and review the output.
### 5. Save the output.v file as func1_synthesized.v.
### 6. Calculate the number of gate instances in func1_synthesized.v.
### 7. Calculate the number of logic elements in func1_synthesized.v.
### 8. Calculate the number of latches in func1_synthesized.v.
### 9. Calculate the gate count for func1_synthesized.v.
### 10. Save your report.
```
$ make
```
### 11. Submit your lab report and your hand-in directory to Blackboard.
### 12. Delete the entire directory or zip the directory and submit the zipped directory.
### 13. Upload the.v file, your report, and the zipped directory to this repository.
/Lab6/Instructions.md
## Lab 6 Instructions
This lab focuses on **Gate Counting** and **Synthesis** of a function.
### 1. Create a.v file as follows:
```
module func1(x1,x2,x3,y1,y2,y3,y4,y5,z);
input x1, x2, x3;
output y1, y2, y3, y4, y5, z;

// first gate
assign y1 = x1;

// second gate
assign y2 = x1 & x2;

// third gate
assign y3 = ~x1 | x2;

// fourth gate
assign y4 = ~x3;

// fifth gate
assign y5 = x1 & ~x2 & ~y4;

// sixth gate
assign z = ~x1 | y3 & y5;
endmodule
```
### 2. Run **Logic Synthesis** and enter the circuit topology in the GUI.
### 3. Generate the synthesized circuit in Verilog.
### 4. Open the.v file and review the synthesized circuit.
### 5. Save the output.v file as func1_synthesized.v.
### 6. Calculate the gate count for func1_synthesized.v.
### 7. Save your report.
```
$ make
```
### 8. Submit your lab report and your hand-in directory to Blackboard.
### 9. Delete the entire directory or zip the directory and submit the zipped directory.
### 10. Upload the.v file, your report, and the zipped directory to this repository.
/Lab3/Instructions.md
## Lab 3 Instructions
This lab focuses on translating a **Boolean Expression** into VHDL.
### 1. Create a.v file as follows:
```
module func1(x1, x2, x3, f);
input x1, x2, x3;
output f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
```
### 2. Translate the Boolean expression:
```
f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3)
```
into VHDL.
### 3. Run **Logic Synthesis** and generate the synthesized circuit in VHDL.
### 4. Generate and run the testbench.
### 5. Save the output.v file as func1_synthesized.v.
### 6. Save your report.
```
$ make
```
### 7. Submit your lab report and the output.v file to Blackboard.
### 8. Delete the entire directory or zip the directory and submit the zipped directory.
### 9. Upload the.v file and your report to this repository.
/Lab8/Instructions.md
## Lab 8 Instructions
This lab focuses on **Simulation** of a function using **Verilog** and **Vivado HLS**.
### 1. Create a.v file as follows:
```
module func1(x1, x2, x3, f);
input x1, x2, x3;
output f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
```
### 2. Run the **Simulation** tool.
### 3. Create a testbench to test the **func1** function.
```
module tb;
reg [0:0] x1 [0:0];
reg [0:0] x2 [0:0];
reg [0:0] x3 [0:0];
reg [1:0] f [0:0];

// signal declarations
wire [1:0] f;

// function call
func1 func1_inst (.x1(x1),.x2(x2),.x3(x3),.f(f));

// initial block
always begin
begin
    $monitor("func1(%0, %1, %2) = %3", x1, x2, x3, f);
    x1 <= ~x1;
    x2 <= ~x2;
    x3 <= ~x3;
    wait for 5 ns;
end
end
endmodule
```
### 4. Run **Vivado HLS** to synthesize the testbench.
### 5. Create a **Makefile** as follows:
```
testbench: tb.cpp
    g++ -o tb.exe tb.cpp

clean:
    rm -rf tb.exe
```
### 6. Run **make**.
### 7. Generate test vectors and run the testbench.
### 8. Save the report.
```
$ make
```
### 9. Submit your lab report and your hand-in directory to Blackboard.
### 10. Delete the entire directory or zip the directory and submit the zipped directory.
### 11. Upload the.v file, your report, and the zipped directory to this repository.
/Lab10/Instructions.md