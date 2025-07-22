module example6(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (4 <= x2 <= 14)
        f = x1;
    else
        f = x3;
endmodule
"""

# example1
src1 = """
module example1(x, y, f);
  input x, y;
  output f;

  assign f = x * y;
endmodule
"""

# example2
src2 = """
module example2(x, y, f);
  input x, y;
  output f;

  assign f = x + y;
endmodule
"""

# example3
src3 = """
module example3(x, y, f);
  input x, y;
  output f;

  assign f = x + y;
endmodule
"""

# example4
src4 = """
module example4(x1, x2, x3, f);
  input x1, x2, x3;
  output f;

  always @(x1 or x2 or x3) begin
    if (x2 == 1)
      f = x1;
    else
      f = x3;
  end
endmodule
"""

# example5
src5 = """
module example5(x1, x2, x3, f);
  input x1, x2, x3;
  output f;

  assign f = x1;
endmodule
"""

# example6
src6 = """
module example6(x1, x2, x3, f);
  input x1, x2, x3;
  output f;

  always @(x1 or x2 or x3) begin
    if (4 <= x2 <= 14)
      f = x1;
    else
      f = x3;
  end
endmodule
"""


if __name__ == '__main__':
    # print(str(diff_code(src1, src2, src3)))
    # print(str(diff_code(src1, src2)))
    # print(str(diff_code(src3, src4)))
    # print(str(diff_code(src4, src5)))
    print(str(diff_code(src5, src6)))