`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule

### Resulting Code:
I am currently working on improving the code. I will continue to research how to dynamically map these arrays and vectors in Verilog.

This project was an exercise in understanding how to use arrays and vectors in Verilog. It is a great opportunity to learn how to use Verilog in a practical way.
/4_Shift_Register_16/main.cpp
#include <stdio.h>

int ShiftRegister16(bool sl, bool sr, bool clk, int ParIn, int m)
{
  static int ParOut = 0;

  if (clk)
  {
    ParOut = ParOut;
    if (m == 1)
    {
      ParOut = ParOut << 1;
      ParOut = ParOut | sl;
    }
    else if (m == 2)
    {
      ParOut = ParOut << 1;
      ParOut = ParOut | sr;
    }
    else if (m == 3)
    {
      ParOut = ParIn;
    }
  }

  return ParOut;
}

int main()
{
  int ParIn = -1;
  int ParOut = -1;

  for (int i = 0; i < 8; i++)
  {
    ParIn = -1;
    ParOut = -1;
    ParOut = ShiftRegister16(1, 0, 1, ParIn, 1);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 1;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = -1;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 0;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 1;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 2;
    ParOut = ParIn;
    ParIn = 1;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 3;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 4;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 5;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 6;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 7;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 8;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 9;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 10;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 11;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 12;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 13;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 14;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 15;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);

    printf("%d\n", ParOut);
  }

  for (int i = 0; i < 8; i++)
  {
    ParIn = -1;
    ParOut = -1;
    ParOut = ShiftRegister16(1, 0, 1, ParIn, 1);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 2);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = 1;
    ParOut = ParIn;
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 3);
    ParOut = ShiftRegister16(1, 0, 1, ParOut, 1);
    ParIn = -1