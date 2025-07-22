#### module tst_alu1();
####   reg [3:0]a,b; reg[1:0] f; reg cci;
####   wire[7:0] d; wire co;
####   alu_1 aa(d,co,a,b,f,cci);
####
####   initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end
####
####   always begin
####   end
####
####   initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co);
#### endmodule
####
#### module alu_1(d,co,a,b,f,cci);
####   input[3:0] a,b; input[1:0] f;
####   output co; output[3:0] d;
####   wire[3:0] tmp1,tmp2,tmp1_r,tmp2_r;
####   reg[3:0] tmp1_r_1,tmp1_r_2,tmp1_r_3,tmp2_r_1,tmp2_r_2,tmp2_r_3;
####
####   assign tmp1 = cat(b[3:1], a[3:1]);
####   assign tmp2 = (a[3:1]);
####   assign tmp1_r = $ite(cci, tmp2, tmp1);
####
####   assign tmp2_r = $ite(f[1:0] > 0, tmp1_r, tmp2);
####
####   assign d = cat(b[3:0], tmp2_r[3:0]);
####   assign co = (f[1:0]==0 && a[3:0]==b[3:0]) || (f[1:0]==0 && a[3:0]!=b[3:0]) || (f[1:0]==1 && a[3:0]!=b[3:0]) || (f[1:0]==2 && a[3:0]!=b[3:0]);
####
####   always @(a,b,f) begin // Implement combinational logic for ALU1
####     if (f[1:0] == 0) begin
####       case (a[3:0], b[3:0])
####         4'b0000, 4'b0000, d <= tmp1_r[3:0];
####         4'b0000, 4'b0001, d <= tmp2_r[3:0];
####         4'b0001, 4'b0000, d <= tmp1_r[3:0];
####         4'b0001, 4'b0001, d <= tmp2_r[3:0];
####         4'b0010, 4'b0000, d <= tmp1_r[3:0];
####         4'b0010, 4'b0001, d <= tmp2_r[3:0];
####         4'b0011, 4'b0000, tmp1_r_1 <= a[3:0]; tmp1_r_2 <= a[3:0]; tmp1_r_3 <= a[3:0];
####         4'b0011, 4'b0001, d <= tmp1_r_3[3:0];
####         4'b0100, 4'b0000, d <= tmp2_r[3:0];
####         4'b0100, 4'b0001, d <= tmp1_r[3:0];
####         4'b0101, 4'b0000, d <= tmp2_r[3:0];
####         4'b0101, 4'b0001, d <= tmp1_r[3:0];
####         4'b0110, 4'b0000, d <= tmp1_r[3:0];
####         4'b0110, 4'b0001, d <= tmp2_r[3:0];
####         4'b0111, 4'b0000, d <= tmp1_r[3:0];
####         4'b0111, 4'b0001, d <= tmp2_r[3:0];
####         4'b1000, 4'b0000, d <= tmp2_r[3:0];
####         4'b1000, 4'b0001, d <= tmp1_r[3:0];
####         4'b1001, 4'b0000, d <= tmp1_r[3:0];
####         4'b1001, 4'b0001, d <= tmp2_r[3:0];
####         4'b1010, 4'b0000, d <= tmp2_r[3:0];
####         4'b1010, 4'b0001, d <= tmp1_r[3:0];
####         4'b1011, 4'b0000, d <= tmp1_r[3:0];
####         4'b1011, 4'b0001, d <= tmp2_r[3:0];
####         4'b1100, 4'b0000, d <= tmp2_r[3:0];
####         4'b1100, 4'b0001, d <= tmp1_r[3:0];
####         4'b1101, 4'b0000, d <= tmp1_r[3:0];
####         4'b1101, 4'b0001, d <= tmp2_r[3:0];
####         4'b1110, 4'b0000, d <= tmp2_r[3:0];
####         4'b1110, 4'b0001, d <= tmp1_r[3:0];
####         4'b1111, 4'b0000, d <= tmp1_r[3:0];
####         4'b1111, 4'b0001, d <= tmp2_r[3:0];
####        endcase
####      end
####    end
#### ```

## **Testbench**

### **Simple Testbench**

```verilog

`timescale 1ns / 1ps
module alu_tb;

  reg [3:0]a,b;
  reg[1:0] f;
  reg cci;

  wire co_1;
  wire[7:0] d_1;

  wire co_2;
  wire[7:0] d_2;

  wire[7:0] alu_tb_co;
  wire[7:0] alu_tb_d;

  alu_1 tb_tb1(.d_1(d_1),.co(co_1),.a(a),.b(b),.f(f),.cci(cci));

  alu_2 tb_tb2(.d_2(d_2),.co(co_2),.a(a),.b(b),.cci(cci));

  always begin;
  case(f[1:0])
  2'b00:
   case(a[3:0],b[3:0])
   4'b0000: 4'b0000, 4'b0000;
   4'b0000: d_1 <= a[3:0] + b[3:0];
   4'b0001: d_1 <= a[3:0] + b[3:0];
   4'b0010: 4'b0000, 4'b0000;
   4'b0010: d_1 <= a[3:0] + b[3:0];
   4'b0011: d_1 <= a[3:0] + b[3:0];
   4'b0100: 4'b000