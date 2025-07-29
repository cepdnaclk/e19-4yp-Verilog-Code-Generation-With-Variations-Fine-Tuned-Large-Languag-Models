module example7_6_1(x1, x2, x3, Clock, f, g, h);
input x1, x2, x3, Clock;
output f, g, h;
reg f, g, h;
reg [2:0] arr1, arr2;
always @(posedge Clock)
begin
  case({x1,x2})
      3'b000 : arr1 = 0;
      3'b001 : arr1 = 1;
      3'b010 : arr1 = 2;
      3'b011 : arr1 = 3;
      3'b100 : arr1 = 4;
      3'b101 : arr1 = 5;
      3'b110 : arr1 = 6;
      3'b111 : arr1 = 7;
  endcase;
  case(arr1)
      0 : arr2 = 0;
      1 : arr2 = 1;
      2 : arr2 = 2;
      3 : arr2 = 3;
      4 : arr2 = 4;
      5 : arr2 = 5;
      6 : arr2 = 6;
      7 : arr2 = 7;
  endcase;
  case(3'b001 + arr2)
      0 : f = 0;
      1 : f = 0;
      2 : f = 0;
      3 : f = 1;
      4 : f = 1;
      5 : f = 1;
      6 : f = 1;
      7 : f = 1;
  endcase;
  g = f | x3;
  h = x1 ^ x2;
end
endmodule

### Verification Instructions:
** Expected Results:
If an array element is selected by an index expression involving two arrays and a constant, the element must have been assigned a value previously in the same procedural block.
### Simulation:
![alt text](example7_6.PNG "Simulation")

### Base Ver