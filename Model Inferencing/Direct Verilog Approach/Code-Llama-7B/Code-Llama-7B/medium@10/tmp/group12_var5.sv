```
module index_test (bypass, data_in, clk, reset, q);
input clk, reset;
input [3:0] data_in;
output [3:0] q;
output bypass;
wire bypass;
reg [3:0] q;
reg [3:0] data_in_buf;
reg clk_buf, reset_buf;
always @(posedge clk or posedge reset)
    begin
        clk_buf <= clk;
        reset_buf <= reset;
        if (reset_buf == 0)
            data_in_buf <= {4{1'b0}};
        else
            data_in_buf <= data_in;
    end
always @*
    begin
        q[data_in_buf[2:1]] <= data_in_buf[data_in_buf[2:1]];
        bypass <= 1'b1;
    end
```
### Verilog Simulation Code:
```
module index_test_tb ();
reg clk, reset;
reg [3:0] data_in;
wire [3:0] q;
wire bypass;
index_test dut (.clk(clk),.reset(reset),.data_in(data_in),.bypass(bypass),.q(q));
integer i;
initial begin
  reset = 1'b1;
  clk = 1'b0;
  #5
  reset = 1'b0;
  #5
  clk = 1'b1;
  data_in = 4'b1010;
  #5
  clk = 1'b0;
  #5
  clk = 1'b1;
  #5
  clk = 1'b0;
  #5
  clk = 1'b1;
  #5
  clk = 1'b0;
  #5
  clk = 1'b1;
  #5
  $finish;
end
always
  #5 clk = ~clk;
endmodule
```
### C++ Source Code:
```
#include<iostream>
#include<fstream>
#include<string>
using namespace std;

ifstream fin("index_test_tb.v");
char buff[256];

void print_indent(int indent)
{
  for (int i = 0; i < indent; i++)
    printf("  ");
}
int main(int argc, char **argv)
{
  fin.getline(buff, 256);
  while(!fin.eof())
  {
    string line(buff);
    if (line.find("#")!= string::npos)
      continue;
    if (buff[0] == '/')
    {
      int indent = 0;
      while (buff[indent] =='')
        indent++;
      print_indent(indent);
      printf("%s\n", buff);
    }
    else if (buff[0] == '.')
    {
      int indent = 0;
      while (buff[indent] =='')
        indent++;
      print_indent(indent);
      printf("// %s\n", buff);
    }
    else
    {
      int indent = 0;
      while (buff[indent] =='')
        indent++;
      print_indent(indent);
      printf("%s\n", buff);
    }
    fin.getline(buff, 256);
  }
  fin.close();
  return 0;
}

```
### Console Output:
```
$./index_test_tb.exe
  module index_test (
      bypass,
      data_in,
      clk,
      reset,
      q
);
input bypass;
input clk;
input data_in;
output q;
output reset;
reg bypass;
reg [3:0] q;
wire bypass;
reg clk;
reg [3:0] data_in;
reg reset;
reg [3:0] data_in_buf;
reg clk_buf, reset_buf;

module index_test (
    bypass,
    data_in,