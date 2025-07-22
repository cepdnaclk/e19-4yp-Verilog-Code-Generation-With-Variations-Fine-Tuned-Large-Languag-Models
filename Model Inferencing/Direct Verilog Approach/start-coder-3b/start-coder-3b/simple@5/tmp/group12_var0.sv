module Problem1(input [3:0]  a, b, output [3:0] sum);
  logic [3:0]   di, clk,  sum;
endmodule
### Simulation Results:

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b1010;
    b = 4'b1010;
    #1;
    a = 4'b1111;
    b = 4'b1111;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1a.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'd0;
    b = 4'd1;
    #1;
    a = 4'd3;
    b = 4'd2;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1b.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0001;
    b = 4'b1010;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1c.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0001;
    b = 4'b1010;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1d.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0001;
    b = 4'b1010;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1e.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0001;
    b = 4'b1010;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1f.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0000;
    b = 4'b0000;
    #1;
    a = 4'b0001;
    b = 4'b1010;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1g.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0010;
    b = 4'b1100;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1h.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0010;
    b = 4'b1100;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1i.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0010;
    b = 4'b1100;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1j.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0010;
    b = 4'b1100;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1k.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b0001;
    b = 4'b1010;
    #1;
    a = 4'b0010;
    b = 4'b1100;
    #1;
    $finish;
  end
endmodule
### Results:

![alt text](images/Problem_1l.png "Results")

##### Testbench Code:
module tb;
  reg [3:0] a, b, sum;
  Problem1 DUT(.a(a),.b(b),.sum(sum));
  initial begin
    a = 4'b1111;
    b = 4'b1111;
    #1;
    a = 4'b1111;
    b = 4'b1111;
    #1;
    a = 4'b1111;
    b = 4'b1111;
    #1;
    a = 4'b0001