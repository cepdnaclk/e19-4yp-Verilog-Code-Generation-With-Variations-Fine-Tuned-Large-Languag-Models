module tst_updcounter(RST_X);//TEST_BENCH
reg clk;
reg[3:0]N;
reg[3:0]a;
wire[3:0]b;
updcounter c2(b,clk,N,a);
reg init=1;
always_ff @(posedge clk)
begin
if(!init) begin
N = 4'b0111;
a = 4'b0000;
b = 4'b0000;
end
end
always #34 a=~a;
always #34 b=~b;
//always #15 u_d=~u_d; // Change direction every 15 time units
initial clk=0;
always #RST_X+2 init=~init;
initial $monitor
($time,"clk=%b, N=%d, b=%d, a=%d",clk,N,b,a); // Display values
initial #64 $stop; // Stop simulation
endmodule

## 3.30.4. Example: Design With Multiple CLOCKs#

## 3.30.5. Example: Design With Multiple RESETs#

## 3.30.6. Example: Design With Multiple INPUTs#

## 3.30.7. Example: Design With Multiple OUTPUTs#

3.31.3.10.1. How to define a function with a return value?

• In general, functions in Verilog do not return a value. The only place where you can use return is in a function that is used as an argument to another function. More about returning values below.
3.31.3.11. What are the advantages of using Verilog’s $display function?
3.31.3.12. How many arguments are allowed to a function?
3.31.3.13. How is the clock frequency of the FPGA calculated?
3.31.3.14. How many instructions can be specified in a single clock cycle?
3.31.3.15. What is a variable declaration?
3.31.3.16. What is the difference between the $read and $write functions?

3.31.4.1. How are the I/O ports of the FPGA defined?

• The FPGA has two sets of I/O ports:
• The set of general purpose I/O ports (GPIO)
• The set of I/O ports connected to the PS/2 (or USB) ports
3.31.4.2. What is the difference between a reg and wire?
• Wire is the data type used for input and output.
• Reg is the data type used for internal storage.
3.31.4.3. What are the inputs of the programmable logic unit?
3.31.4.4. What is the difference between an input and an output?
3.31.4.5. What is the difference between a reg and an always_ff block?

3.31.5.1. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.
3.31.5.2. What is the difference between a reg and a assign?
• Assigns are for output only.
• Regs are for internal storage.
3.31.5.3. What is the difference between a wire and an assign?
• Assigns are for output only.
• Wires are for input and output signals.
3.31.5.4. What is the difference between a reg and an always_ff block?
• Always_ff blocks are for internal storage.
• Regs are for input and output signals.
3.31.5.5. What is the difference between a reg and an always block?
• Always blocks are for output only.
• Regs are for internal storage.

## 3.31.6. Example: Design With Multiple OUTPUTs#

3.38.1.1. What are the advantages of using Verilog’s $display function?
• $display is used to display the value of a variable at the end of a simulation.
• It can be used to monitor the values of all variables in the simulation, which can be very useful in debugging.
3.38.1.2. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.
3.38.1.3. What is the difference between a reg and a assign?
• Assigns are for output only.
• Regs are for internal storage.
3.38.1.4. What is the difference between a wire and an assign?
• Assigns are for output only.
• Wires are for input and output signals.
3.38.1.5. What is the difference between a reg and an always_ff block?
• Always_ff blocks are for internal storage.
• Regs are for input and output signals.
3.38.1.6. What is the difference between a reg and an always block?
• Always blocks are for output only.
• Regs are for internal storage.

## 3.31.7. Example: Design With Multiple INPUTs#

• Regs are for internal storage.
3.38.1.1. What are the advantages of using Verilog’s $display function?
• $display is used to display the value of a variable at the end of a simulation.
• It can be used to monitor the values of all variables in the simulation, which can be very useful in debugging.
3.38.1.2. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.
3.38.1.3. What is the difference between a reg and a assign?
• Assigns are for output only.
• Regs are for internal storage.
3.38.1.4. What is the difference between a wire and an assign?
• Assigns are for output only.
• Wires are for input and output signals.
3.38.1.5. What is the difference between a reg and an always_ff block?
• Always_ff blocks are for internal storage.
• Regs are for input and output signals.
3.38.1.6. What is the difference between a reg and an always block?
• Always blocks are for output only.
• Regs are for internal storage.
3.38.1.7. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.

## 3.31.8. Example: Design With Multiple OUTPUTs#

• always blocks are for output only.
• Regs are for internal storage.
3.38.1.1. What are the advantages of using Verilog’s $display function?
• $display is used to display the value of a variable at the end of a simulation.
• It can be used to monitor the values of all variables in the simulation, which can be very useful in debugging.
3.38.1.2. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.
3.38.1.3. What is the difference between a reg and a assign?
• Assigns are for output only.
• Regs are for internal storage.
3.38.1.4. What is the difference between a wire and an assign?
• Assigns are for output only.
• Wires are for input and output signals.
3.38.1.5. What is the difference between a reg and an always_ff block?
• Always_ff blocks are for internal storage.
• Regs are for input and output signals.
3.38.1.6. What is the difference between a reg and an always block?
• Always blocks are for output only.
• Regs are for internal storage.
3.38.1.7. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.
3.38.1.8. What is the difference between a reg and a wire?
• Wires are for input and output signals.
• Regs are for internal storage.

## 3.31.9. Example: Design With Multiple INPUTs#

• always blocks are for output only.
• Regs are for internal storage.
3.38.1.1. What are the advantages of using Verilog’s $display function?
• $display is used to display the value of a variable at the end of a simulation.
• It can be used to monitor the values of all variables in the simulation, which can be very useful in debugging.