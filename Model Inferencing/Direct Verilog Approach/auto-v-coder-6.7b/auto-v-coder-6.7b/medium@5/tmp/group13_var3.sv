```verilog
module test;
  wire [3:0] a = 'b1010;
  wire [2:0] b;
  logic [1:0] c;
  
  initial
    begin
      c = 2'h2;
      b = a[c:c-1];
      #1;
      $display("%b", b);
    end
endmodule
```
This code should display the bit-wise value '10'. In this case, the variable 'c' is set to '2' (base 10), and it is used to index the array 'a'. Since 'c' is '2', the part-select range of 'a' is '2:1', and it selects the '2' and '1' bits of the array 'a'.

The resulting value of the part-select range 'b' is then displayed. The part-select range is selected starting from the left-most bit (index 3) of the array 'a' and moving to the left, so the selected bits are '1' and '0', in order. The concatenation of these bits gives the result '10' in binary.

Please, replace the module name and the corresponding testbench to work within your project.
### Variation Explanation:
The code snippet above demonstrates how to use a part-select to manipulate an array. The `if` statement in the testbench is replaced by the `initial` block. This ensures that the block runs only once, when the module is initialized.

Note: This code assumes that the `$display` function is available in your Verilog code and that the `$display` function is used to write the results to the console. If you are using a different environment or software, the display method may need to be changed accordingly.

This code also assumes that the bit sizes of the arrays and variables used in this testbench are correct, and that the indexing of the array is handled correctly. If the array or the size of the array is mismatched with the variable 'c', the code will not behave as expected. In this case, the solution would involve adjusting the variable 'c' or the array 'a' as needed.

Please, test the code thoroughly before integrating into your existing code.

Finally, this code