```verilog
module pulses; // Correctly generated pulse attempt
  reg [8:0] I;
  reg [8:0] b;
  initial begin
    while (I<100) begin // Loop based on integer I
      b = I[8:1]; // Assign bit 1 of I to b 
      I = I + 1; // Increment I
    end
  end
  initial I=0; // Initialize I
  initial #100 $stop; // Stop simulation
endmodule
```
In this code, instead of using a single bit (`b = I[1]`) we now use a range of bits (`b = I[8:1]`), this would give us an 8-bit array with the last bit (bit 1 of the 9 bit number) copied into each bit of `b`. This will result in `b` being filled with the same bit values as the last bit of `I`.

Please note that in Verilog, the indices of an array are 0-based, so if you want to index from right to left (as is common in binary representations), you'll want to subtract from the end index to get the correct result. We're starting from the end because in binary, the last bit is at the left, and the integer representation of it would be at the left of the 9 bit vector.

Also, you should know that simulation always starts from the initial block. The initial block is a block that is to be executed when the design is loaded into the simulator. In this case, the initial block will start the simulation after the design is loaded. The same initial block will be executed each time the design is loaded in the simulation, this is why there is no need to reset the I register or manually set it to zero. 

Also, note that there is no need to use an actual hardware design to verify the correctness of your Verilog code. You can use the VCS simulator or ModelSim-Altera Starter Edition for free to verify the correctness of your code.

In the end, the correctness of your code is not due to the logic but the correct syntax and semantics. The logic of your code is correct and is intended to generate a pulse with a bit-width of 8 bits.