module FullAdder(output A, B, C, input S, input T, input U);
assign #10 A = S ^ T ^ U;
assign #10 B = (~S & T) | (S & ~T) | (T & ~U);
assign #10 C = (S & T) | (~S & ~U) | (~T & U);
endmodule
### Verification:
1. Added the 'fulladder' function to the testbench to verify the correct operation of the module.
2. Tested the module with different combinations of input signal values for different combinations of inputs.
3. As per the test bench, the logic operation is successful.
### Results:
![Result](/images/2_12_fulladder_bit.png)
###