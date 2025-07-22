```verilog
initial begin: Apply_Data /*... Figure 8.11... */
  for (indx = 0; indx < 3; indx++) begin
    mem1[indx] = $random; // Random fill of memory array
    mem2[indx] = $random; // Random fill of memory array
  end
  for (indx = 0; indx < 3; indx++) begin
    opnd1 = mem1[indx]; // Select operands from memory array
    opnd2 = mem2[indx]; // Select operands from memory array
    // Apply operands
    im_data = opnd1;
    #100;
    im_data = opnd2;
  end
end
```
This variation will test the Multiplier module with random data in the memory array. It performs 2 operations with the selected operands from the memory array. The `im_data` is driven onto the bus at the appropriate times. Note that the delay of 100ns is used to allow the Multiplier module to process the data, and the actual delay is dependent on the Multiplier implementation and test conditions.

Also, do note that the `$random` function is used to generate random values for opnd1 and opnd2. This function is a SystemVerilog built-in function which generates a random number within the range of 0 to 255.

This random data loading process can be repeated multiple times as per the test requirement. The logic of choosing `opnd1` and `opnd2` from the memory, and then applying these values onto data bus is the same as in the original code. The only change is the way the data is loaded into the memory array.

The purpose is to provide a randomized input for testing the Multiplier module. This is useful in a verification testbench environment where it is imperative to ensure that the Multiplier's output is correct. 

Remember to replace `Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );` with the actual instantiation of your Multiplier module. This will vary depending on your setup, but the general idea stays the same. This code will now test your Multiplier module with randomized inputs