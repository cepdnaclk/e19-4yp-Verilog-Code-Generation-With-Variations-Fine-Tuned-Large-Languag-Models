module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  wire aa,bb,cc;
  wire [7:0] d;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
  if((d==4'b0010)||(d==4'b0011)) begin
    // Add an if condition that checks whether the array variable d is inside a 4 bit slice range
    // Add a statement that sets two wire variables aa and bb to 1'b1 if d is inside the range list inside the if statement
    aa = 1'b1;
    bb = 1'b1;
  end
endmodule