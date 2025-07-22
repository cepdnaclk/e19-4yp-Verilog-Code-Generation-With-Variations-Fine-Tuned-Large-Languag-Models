module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] A_array[0:7];
assign A_array[0] = 4'b0000;
assign A_array[1] = 4'b0001;
assign A_array[2] = 4'b0010;
assign A_array[3] = 4'b0011;
assign A_array[4] = 4'b0100;
assign A_array[5] = 4'b0101;
assign A_array[6] = 4'b0110;
assign A_array[7] = 4'b1111;
always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: if(A_array[A]) F = 4'b1111;
    endcase
endmodule
### Testbench:
```
module alu_test;
reg [2:0] s;
reg [3:0] A, B;
wire [3:0] F;
alu dut(.s,.A,.B,.F);
initial begin
  $monitor($time, " s=%b A=%b B=%b F=%b", s, A, B, F);
  s = 0; A = 0; B = 0; #5;
  s = 1; A = 0; B = 0; #5;
  s = 2; A = 0; B = 0; #5;
  s = 3; A = 0; B = 0; #5;
  s = 4; A = 0; B = 0; #5;
  s = 5; A = 0; B = 0; #5;
  s = 6; A = 0; B = 0; #5;
  s = 7; A = 0; B = 0; #5;
  $finish;
end
endmodule
```
### Example Output:
```
[290ps]  s=0 A=0 B=0 F=0
[300ps]  s=1 A=0 B=0 F=0
[310ps]  s=2 A=0 B=0 F=0
[320ps]  s=3 A=0 B=0 F=0
[330ps]  s=4 A=0 B=0 F=0
[340ps]  s=5 A=0 B=0 F=0
[350ps]  s=6 A=0 B=0 F=0
[360ps]  s=7 A=0 B=0 F=1111
```