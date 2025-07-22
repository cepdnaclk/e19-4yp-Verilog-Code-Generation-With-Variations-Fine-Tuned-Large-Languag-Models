module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule
I used the script that will compile/run the base code and the variation code.

The script will create the following files:
base.v
base_out.vcd
var.v
var_out.vcd
and compare the output signals with the following commands:
vcd comapre -f base_out.vcd -p xPart var_out.vcd
vcd comapre -f base_out.vcd -p yPart var_out.vcd
And the expected output is:
vcd comapre -f base_out.vcd -p yPart var_out.vcd
vcd comapre -f base_out.vcd -p xPart var_out.vcd

The expected output is:

The output is correct. Please see the attached screenshot.
/README.md
# Event_Control_and_Sequential_Logic_Lab
Labs on Event Control and Sequential Logic using VHDL

### Event Control and Sequential Logic - Lab
**Note:** The Lab is done on the 2017 version of the VHDL compiler. Also there are some minor bugs that needs to be fixed manually.
#### Lab 1 - Sequential Logic
##### 1. Implementing a NAND gate using sequential logic and the Nand gate verilog module.
> * In the sequential logic design the **Nand** gate is implemented using a 2-level **OR** gate.
> * The gate is implemented using **2-input AND gate** and **2-input OR gate**.
> * The gate has a clock input and 2-input data inputs.
> * The clock input of the sequential logic design changes the value of the output of the AND gate. 
> * The AND gate has a data input from either of the 2-input gates (a single clock edge can switch the data input) and the output of the OR gate as the data input.
> * Since the clock is the clock input of the sequential logic circuit, the output of the OR gate is determined by the status of the clock and the output of the data input of the AND gate.
> * The clock input of the sequential logic design is the clock input of the **Nand gate verilog module**
##### 2. Implementing a clocked flip-flop and a combinational flipflop using sequential logic design using the *DFF* module.
> * A **Clocked flip-flop** is implemented using sequential logic and the **DFF** module.
> * The clock input and data inputs of the DFF module are the clock input and the data input of the sequential logic design.
> * The sequential logic circuit is tested using the **Nand gates** implemented using the **Nand gate verilog module**
##### 3. Implementing a **Counter** using a flip-flop and the **DFF** module.
> * The input of the counter is from the data input of the **DFF** module.
> * The output of the counter is the count of the number of clock edges since the reset is triggered.
> * The **DFF** module is used in the sequential logic design to implement the flip-flop.
> * The sequential logic design is tested using the **Nand gates** implemented using the **Nand gate verilog module**
##### 4. Implementing a **Binary Adder** using sequential logic and **Nand gates** implemented using the **Nand gate verilog module**.
> * In the sequential logic design the **Binary Adder** is implemented using **3-input Nand gates**
> * The clock input and the data inputs of the Binary Adder are implemented using the sequential logic design.
> * The sequential logic design is tested using the **Nand gates** implemented using the **Nand gate verilog module**.
##### 5. Implementing a **Binary Subtractor** using sequential logic and **Nand gates** implemented using the **Nand gate verilog module**.
> * In the sequential logic design the **Binary Subtractor** is implemented using **3-input Nand gates**
> * The clock input and the data inputs of the Binary Subtractor are implemented using the sequential logic design.
> * The sequential logic design is tested using the **Nand gates** implemented using the **Nand gate verilog module**.
##### 6. Implementation of a **Register** using sequential logic and the **DFF** module.
> * To implement a **Register** all that is needed is to implement the sequential logic design that implements the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 7. Implementation of an **Adder 8 bit** using **sequential logic** and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 8. Implementation of a **Subtractor 8 bit** using **sequential logic** and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 9. Implementation of a **Multiplexer 3 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 10. Implementation of a **De-Multiplexer 3 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 11. Implementation of a **Comparator 3 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
> * The **Comparator 3 bit** is the same as the **Subtractor 3 bit** but subtracts instead of subtracting.
> * Since the result of the comparator is 1 if the comparator is true then the output is 0 else the output is 1. Therefore the comparator is implemented the same way as a subtractor is implemented.
##### 12. Implementation of a **Multiplier 4 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 13. Implementation of a **Multiplexer 8 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 14. Implementation of a **Counter with a reset 7 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 15. Implementation of a **Arithmetic Logic Unit (5 bit)** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 16. Implementation of a **Multiplexer Encoder 4 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 17. Implementation of a **Multiplexer Encoder 12 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 18. Implementation of an **Adder 16 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 19. Implementation of an **Adder 8 bit with carryin** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 20. Implementation of a **Subtractor 16 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 21. Implementation of a **Subtractor 8 bit** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **Nand gates** implemented using the **Nand gate verilog module**.
##### 22. Implementation of a **Subtractor 16 bit with borrow in** using sequential logic and the **DFF** module.
> * The sequential logic design is tested using **