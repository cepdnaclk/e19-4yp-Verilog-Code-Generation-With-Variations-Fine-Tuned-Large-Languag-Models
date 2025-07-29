module Problem1(input [3:0] a, b, output logic [3:0] di, clk);
  assign di = a + b;
endmodule
### Testbench Code:
module Problem1_test();
  wire [3:0] result;
  reg [3:0] a, b;
  Problem1 p1(a, b, result);
  
  initial begin
    $monitor("Testing: a = %0d, b = %0d, result = %0d", a, b, result);
    #1;
    a = 5;
    b = 3;
    #1;
    a = 6;
    b = 3;
    #1;
    $finish();
  end
endmodule
### Output:
Testing: a = 0, b = 0, result = 0
Testing: a = 5, b = 3, result = 8
Testing: a = 6, b = 3, result = 9
Testing: a = 1, b = 1, result = 2
Testing: a = 2, b = 2, result = 4
Testing: a = 3, b = 3, result = 6
Testing: a = 4, b = 4, result = 8
Testing: a = 5, b = 5, result = 10
Testing: a = 6, b = 6, result = 12
Testing: a = 7, b = 7, result = 14
Testing: a = 8, b = 8, result = 16
Testing: a = 9, b = 9, result = 18
*/

/* Problem 2
### Testbench Code:
module Problem2_test();
  wire [3:0] result;
  reg [3:0] a, b;
  Problem2 p2(a, b, result);
  
  initial begin
    $monitor("Testing: a = %0d, b = %0d, result = %0d", a, b, result);
    #1;