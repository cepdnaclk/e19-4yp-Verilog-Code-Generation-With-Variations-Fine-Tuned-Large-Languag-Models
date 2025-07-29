module Problem9(input [3:0] a, b, output [3:0] diff);
      reg [3:0] x;
      reg [3:0] y;
      reg [3:0] z;
   function [3:0] foo;
     input [3:0] a;
     input [3:0] b;
     begin
     if (a > b)
       foo = a;
     else
       foo = b;
     end
   endfunction
    always @(*) begin
       x = a;
       y = b;
       z = foo(x,y);
       diff = z;
    end
endmodule

### Simulation Output:
![Simulation 9](https://github.com/aamir-bd/Digital-Logic/blob/main/Simulation%209.JPG?raw=true)

### Base Verilog Code:
module Problem10(input [3:0] a, b, output [3:0] diff);
  assign diff = a - b;
endmodule
### Variation Instruction:
Replace the reg declarations with a packed structure that includes