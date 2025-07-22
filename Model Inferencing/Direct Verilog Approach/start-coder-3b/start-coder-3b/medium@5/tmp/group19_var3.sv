module counter (
    input wire clk, rst,
    output wire [3:0] count
);
always @(posedge clk or posedge rst) begin
  initial count = {4'b0000};
  if (rst) count <= 4'b0000;
  else count <= count + 1;
end
endmodule

*Note: The test code is designed to output the counter value at every clock cycle, so it would output 256 values in total after the counter reaches 15.*



### Variation Instruction:
Change the if-statement inside the always block to if-else-if-else-end if-else-end.
### Modification Code:
module counter (
    input wire clk, rst,
    output wire [3:0] count
);
always @(posedge clk or posedge rst) begin
  if (rst) count <= 4'b0000;
  else if (count == 4'b0000) count <= 4'b0001;
  else if (count == 4'b0001) count <= 4'b0010;
  else if (count == 4'b0010) count <= 4'b0011;
  else if (count == 4'b0011) count <= 4'b0100;
  else if (count == 4'b0100) count <= 4'b0101;
  else if (count == 4'b0101) count <= 4'b0110;
  else if (count == 4'b0110) count <= 4'b0111;
  else if (count == 4'b0111) count <= 4'b1000;
  else if (count == 4'b1000) count <= 4'b1001;
  else if (count == 4'b1001) count <= 4'b1010;
  else if (count == 4'b1010) count <= 4'b1011;
  else if (count == 4'b1011) count <= 4'b1100;
  else if (count == 4'b1100) count <= 4'b1101;
  else if (count == 4'b1101) count <= 4'b1110;
  else if (count == 4'b1110) count <= 4'b1111;
  else if (count == 4'b1111) count <= 4'b0000;
  else count <= 4'b0000;
end
endmodule
/Lab14/lab14_problem_c.md
### Problem C:

#### 1) Base Verilog Code:
```
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule
```
#### 2) Variation Instruction:
Create a case statement, with the result of the counter assigned to a wire, to assign it to a module.
#### 3) Modified Code:
```
module counter (
    input wire clkl, rstl,
    output wire [3:0] countr,
    output [1:0] couver,
    output reg [1:0] counth
);

always @(posedge clkl or posedge rstl) begin
  if (rstl) counth <= 0;
  else counth <= counth + 1;
end

always @(posedge clkl or posedge rstl) begin
  case (counth)
    4'b0000: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; countr = 4'b0100; countr = 4'b0101; countr = 4'b0110; countr = 4'b0111; countr = 4'b1000; countr = 4'b1001; countr = 4'b1010; countr = 4'b1011; countr = 4'b1100; countr = 4'b1101; countr = 4'b1110; countr = 4'b1111;
    4'b0001: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; countr = 4'b0100; countr = 4'b0101; countr = 4'b0110; countr = 4'b0111; countr = 4'b1000; countr = 4'b1001; countr = 4'b1010; countr = 4'b1011; countr = 4'b1100; countr = 4'b1101; countr = 4'b1110; countr = 4'b1111;
    4'b0010: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; countr = 4'b0100; countr = 4'b0101; countr = 4'b0110; countr = 4'b0111; countr = 4'b1000; countr = 4'b1001; countr = 4'b1010; countr = 4'b1011; countr = 4'b1100; countr = 4'b1101; countr = 4'b1110; countr = 4'b1111;
    4'b0011: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; countr = 4'b0100; countr = 4'b0101; countr = 4'b0110; countr = 4'b0111; countr = 4'b1000; countr = 4'b1001; countr = 4'b1010; countr = 4'b1011; countr = 4'b1100; countr = 4'b1101; countr = 4'b1110; countr = 4'b1111;
    4'b0100: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; countr = 4'b0100; countr = 4'b0101; countr = 4'b0110; countr = 4'b0111; countr = 4'b1000; countr = 4'b1001; countr = 4'b1010; countr = 4'b1011; countr = 4'b1100; countr = 4'b1101; countr = 4'b1110; countr = 4'b1111;
    4'b0101: countr = 4'b0000; countr = 4'b0001; countr = 4'b0010; countr = 4'b0011; coun