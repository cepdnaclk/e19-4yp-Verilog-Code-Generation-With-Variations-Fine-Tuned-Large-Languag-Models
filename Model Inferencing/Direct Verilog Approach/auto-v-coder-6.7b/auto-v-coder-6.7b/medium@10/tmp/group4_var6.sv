```verilog
module nor3NMOS(in1,in2,in3,b); // 3-input NMOS NOR
  output b;
  input in1,in2,in3;
  supply0 a; // Ground
  wire b; // Output wire (should be just output b;)
  // Parallel NMOS transistors connect output to ground
  nmos (b, a, in1);
  nmos (b, a, in2);
  nmos (b, a, in3);
  pullup (b); // Pullup device on the output
  
  // Define the function
  function integer getCase(input integer func_in1, func_in2, func_in3);
    case(func_in1, func_in2, func_in3) inside
      [0:0, 0:0, 0:0]: getCase = 1;
      [0:0, 0:0, 1:1]: getCase = 2;
      [1:1, 0:0, 0:0]: getCase = 3;
      [1:1, 1:1, 0:0]: getCase = 4;
      [0:0, 1:1, 1:1]: getCase = 5;
      [1:1, 0:0, 1:1]: getCase = 6;
      [1:1, 1:1, 1:1]: getCase = 7;
    endcase
  endfunction
  
  // Call the function
  integer index;
  initial begin
    index = getCase(in1, in2, in3);
    $display("The case statement result is %d", index);
  end
endmodule
```
In the above code, the function 'getCase' takes three inputs and returns an index based on the case statement conditions. The 'initial' block is used to display the result of the function at the end. Please note that the case statement is based on the individual bit values.

The output 'index' is the value returned from the function 'getCase' based on the inputs. The $display function is used to display the result. The condition `[0:0, 0:0,