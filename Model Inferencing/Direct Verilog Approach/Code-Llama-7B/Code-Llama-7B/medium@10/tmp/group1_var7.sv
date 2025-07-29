`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= {ParOut, parin[m-3]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule
```
### What are the differences between vector concatenation versus the inside operator?
- Concatenation involves concatenating two or more vectors to produce a single vector that is wider than the input vectors.
- Inside operator on the other hand involves assigning specific bit positions of the input vector to the output vector.

### Assigning values to specific bits of a packed array:
```
parout = {parin[0:1], parin[7:3]};
```
- A concatenated selection of the input vector is then assigned to the output vector.

### Shift Register:
```
module ShiftRegister8( input clk, input [7:0] ParIn, output [7:0] ParOut );
reg [7:0] ParOut;
always begin
    ParOut = { ParOut[6:0], ParIn[7] };
end
endmodule
```
- A shift register is a sequential circuit that shifts the contents of the shift register in a specific direction.
- Since the output value is an eight bit vector, the contents can be shifted left one position (the shift is to the left).

### Synchronous Sequential:
```
module SynchronousSequential( input clk, input [7:0] ParIn, output [7:0] ParOut );
reg [7:0] ParOut;
always @( posedge clk ) begin
    ParOut = { ParOut[6:0], ParIn[7] };
end
endmodule
```
- Since the synchronous sequential model does not specify any edge, the simulation result is same as a combinational model.

### Asynchronous Sequential:
```
module AsynchronousSequential( input clk, input [7:0] ParIn, output [7:0] ParOut );
reg [7:0] ParOut;
always @ ( posedge clk ) begin
    ParOut = { ParOut[6:0], ParIn[7] };
end
endmodule
```
- An asynchronous sequential model specifies that the combinational output would be valid at a **positive edge** of the clock.

### Truth Table:
![Truth Table](https://i.imgur.com/LqGxbHr.png)
- The truth table is used to generate a VHDL or Verilog model for a combinational circuit.
- It is also used to synthesize a circuit.
- A clock value associated with the input values is assigned to a clock signal.
- The clock value is used to synchronize the computation of the output values.


### Testbench for Synchronous Sequential Circuit:
```
module tb_ss_circuit;
reg [7:0] ParIn;
wire [7:0] ParOut;
wire [7:0] SyncParOut;
reg clk;
integer i;

SynchronousSequential ss_circuit ( clk, ParIn, SyncParOut );

initial begin
    i=0;
    ParIn = 8'b0_0000_0000;
    clk = 0;
    #1    
    while(i<8) begin
        ParIn = 8'd1<<i;
        clk = 0;
        #60
        clk = 1;
        #60
        i = i + 1;
    end
end

initial begin
#100        
$finish;
end

endmodule

```
- There are two outputs associated with this circuit.
- The first output is synchronous and uses a clock signal.
- The second output is asynchronous and does not use a clock signal.
- The difference between the two outputs is that the synchronous output is at the same frequency as the