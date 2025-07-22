module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0) {
  while (Adr < Storage.size()) {
    Storage[Adr] <= Ibus;
    Adr <= Adr+1;
  }
}

else {
    while (Adr < Storage.size()) {
      ObusReg <= Storage[Adr];
      Adr <= Adr+1;
  }
}
endmodule
### Simulation & Results:
Simulation Result:
![while2](https://user-images.githubusercontent.com/70331588/110304026-707a1e80-8033-11eb-8d5b-8d7668c21bc6.png)
Simulation Result (Adr-wise):
![while2_2](https://user-images.githubusercontent.com/70331588/110304101-8841a380-8033-11eb-8c21-7293a4a1259f.png)
### Conclusion:
Both the simulation gives the same result. Therefore, the given while loop is valid.
/README.md
# Verilog-Practice
The goal of this project is to implement all the basic verilog syntax. 
It also includes a few tasks on each of the major topics like data flow, control flow, arrays, loops, etc.
### 1. Data Flow
- [x] [Multiplexer](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/1_Multiplexer)
- [x] [Multiplexor](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/2_Mux)
- [x] [Decoder](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/3_Decoder)
- [x] [Demultiplexer](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/4_Demultiplexer)
- [x] [Demultiplexor](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/5_Demux)
- [x] [Register](https://github.com/sourav1510/Verilog-Practice/tree/master/Data-Flow/6_Register)
### 2. Control Flow
- [x] [If-Else-Statement](https://github.com/sourav1510/Verilog-Practice/tree/master/Control-Flow/1_If-Else-Statement)
- [x] [Switch](https://github.com/sourav1510/Verilog-Practice/tree/master/Control-Flow/2_Switch)
- [x] [If-Else If-Statement](https://github.com/sourav1510/Verilog-Practice/tree/master/Control-Flow/3_If-Else-If-Statement)
- [x] [Case](https://github.com/sourav1510/Verilog-Practice/tree/master/Control-Flow/4_Case)
- [x] [Case-Statement](https://github.com/sourav1510/Verilog-Practice/tree/master/Control-Flow/5_Case-Statement)
### 3. Loops
- [x] [For-Loop](https://github.com/sourav1510/Verilog-Practice/tree/master/Loops/1_For-Loop)
- [x] [Foreach-Loop](https://github.com/sourav1510/Verilog-Practice/tree/master/Loops/2_Foreach-Loop)
- [x] [While-Loop](https://github.com/sourav1510/Verilog-Practice/tree/master/Loops/3_While-Loop)
- [x] [Repeat-Loop](https://github.com/sourav1510/Verilog-Practice/tree/master/Loops/4_Repeat-Loop)
### 4. Arrays
- [x] [Array](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/1_Array)
- [x] [Array-Slice](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/2_Array-Slice)
- [x] [Array-Slice2](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/3_Ars/5_Array-Slice3)
- [x] [Array-Slice4](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/6_Array-Slice4)
- [x] [Array-Slice5](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/7_Array-Slice5)
- [x] [Array-Slice6](https://github.com/sourav1510/Verilog-Practice/tree/master/Arrays/8_Array-Slice6)
### 5. Tasks
- [x] [Memory-Latency](https://github.com/sourav1510/Verilog-Practice/tree/master/Memory-Latency)
- [x] [RAM](https://github.com/sourav1510/Verilog-Practice/tree/master/RAM)
- [x] [Multiplexer-Latency](https://github.com/sourav1510/Verilog-Practice/tree/master/Multiplexer-Latency)
- [x] [RAM-Latency](https://github.com/sourav1510/Verilog-Practice/tree/master/RAM-Latency)
- [x] [Bitwise-Operation](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation)
- [x] [Bitwise-Operation2](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation2)
- [x] [Bitwise-Operation3](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation3)
- [x] [Bitwise-Operation4](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation4)
- [x] [Bitwise-Operation5](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation5)
- [x] [Bitwise-Operation6](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation6)
- [x] [Bitwise-Operation7](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation7)
- [x] [Bitwise-Operation8](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation8)
- [x] [Bitwise-Operation9](https://github.com/sourav1510/Verilog-Practice/tree/master/Bitwise-Operation9)
ray-Slice2)
- [x] [Array-Slice3](https://github.com/sourav1510/Verilog-Practice/tree/master/Array