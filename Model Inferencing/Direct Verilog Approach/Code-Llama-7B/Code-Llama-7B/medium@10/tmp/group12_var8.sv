module maj3 (a, b, c, y);
  input a, b, c;
  output y;
  wire [1:0] im1, im2, im3;

  and #(2, 4)
    (.im1(im1[1]),.a(a),.b(b)),
    (.im2(im1[0]),.b(b),.c(c)),
    (.im3(im1[2]),.c(c),.a(a));

  or #(3, 5) (y, im1[1], im1[0], im1[2]);

  initial begin
    $display("%b %b %b %b", a, b, c, y);
  end
endmodule
### Test Bench:
module test;
  reg a, b, c;
  wire y;
  maj3 uut (.a(a),.b(b),.c(c),.y(y));

  initial begin
    a=1'b1; b=1'b0; c=1'b1; #1;
    a=1'b1; b=1'b1; c=1'b1; #1;
    b=1'b1; c=1'b1; a=1'b0; #1;
    c=1'b1; a=1'b1; b=1'b1; #1;
    a=1'b1; c=1'b1; b=1'b0; #1;

  end
endmodule
### Expected Results:
- 111 100 101 0 -> 110
- 110 111 101 1 -> 111
- 111 000 101 0 -> 110
- 101 111 110 1 -> 111
- 111 101 000 0 -> 110
### Simulation Logic:
![image](https://user-images.githubusercontent.com/87344540/122666054-5f950100-d158-11eb-983b-32a5939867d6.png)
### Simulation Result:
![image](https://user-images.githubusercontent.com/87344540/122821564-66fc7a00-d218-11eb-94b1-8709823afdd8.png)
### Conclusion
This variation successfully replaces the packed array method with constant ranges.
### Difficulty Level
Medium
### References Used
- [Packed Arrays](https://www.ece.cmu.edu/~ee760/760docs/Verilog%20Notes%20-%20Packed%20Arrays.pdf)
- [SystemVerilog Packed Arrays](https://www.verilogpro.com/systemverilog/systemverilog-tutorial-packed-arrays/)
- [Verilog Arrays](https://www.instructables.com/id/Verilog-Arrays/)
### Suggested Readings
- [Packed Arrays](https://www.ece.cmu.edu/~ee760/760docs/Verilog%20Notes%20-%20Packed%20Arrays.pdf)
- [SystemVerilog Packed Arrays](https://www.verilogpro.com/systemverilog/systemverilog-tutorial-packed-arrays/)
- [Verilog Arrays](https://www.instructables.com/id/Verilog-Arrays/)
### Suggested Videos
- [Arrays in Verilog](https://www.youtube