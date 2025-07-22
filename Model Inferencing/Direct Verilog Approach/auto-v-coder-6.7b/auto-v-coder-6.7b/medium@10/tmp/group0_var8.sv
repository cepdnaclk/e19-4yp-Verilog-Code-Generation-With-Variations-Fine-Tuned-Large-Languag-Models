```verilog
module ha_8(s,ca,a,b,r); // Full Adder with specparam path delays and array range check
  input a,b; output s,ca;
  input [3:0] r; // 4D packed logic array
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
  
  // Implement condition here
  if(r inside {[0:3'b100], [2'b11:3'b111], 3'b101}) begin // Range list for 4D packed logic array
    $display("r is inside range list");
  end else begin
    $display("r is outside range list");
  end
endmodule
```
This code adds an if condition that checks whether the 4D packed logic array r is inside a range list using array slice expressions. If the condition is true, it displays a message saying "r is inside range list". If it's not, it displays a message saying "r is outside range list". The condition checks whether r is in the ranges of {[0:3'b100], [2'b11:3'b111], 3'b101} where 3'b101 is 101 in 4D packed logic, and the rest are binary numbers. If the condition is true, it displays a message saying "r is inside range list". If it's not, it displays a message saying "r is outside range list". This addition can be extended to other conditions as well. Note that the specparam directive is used to specify delays for the output s and ca. These delays are then used in the specify block to assign delays to the paths. The xor and and modules are used to perform the operations of xor and and on a and b and assign them to s and ca respectively.