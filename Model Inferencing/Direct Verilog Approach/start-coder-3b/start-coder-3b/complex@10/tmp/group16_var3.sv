#### package
```verilog
package comp_pkg;
  reg [1:0] test_cases;
  assign test_cases[0] = 0;
  assign test_cases[1] = 1;
  assign test_cases[2] = 2;
  assign test_cases[3] = 3;
  assign test_cases[4] = 4;
  assign test_cases[5] = 5;
  assign test_cases[6] = 6;
  assign test_cases[7] = 7;
  assign test_cases[8] = 8;
  assign test_cases[9] = 9;
endpackage
```
#### module
```verilog
module TOP1(output reg OUT, input CLK, input RST_X);
  reg [32-1:0] x;
  wire [32-1:0] data_out;
  reg [32-1:0] y;
  reg [3-1:0] i;

  comp_pkg uut(.test_cases(test_cases));
  assign x = uut.x;
  assign y = uut.y;
  wire [32-1:0] data_in = uut.data_out;
  assign OUT = data_in;

  initial begin
    x = 0;
    y = 0;
    i = 0;
  end

  always @(posedge CLK) begin
    if(!RST_X) begin
      x <= 0;
      y <= 0;
      i <= 0;
    end else begin
      if((i == 10)) begin
        x <= 0;
        y <= 0;
        i <= 0;
      end else if(i <= 9) begin
        x <= test_cases[i];
        y <= 10;
        i <= i + 1;
      end else begin
        x <= x;
        y <= y;
        i <= 0;
      end
    end
  end
endmodule
```
#### Assertion Command:
```verilog
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9]
```
#### Command:
```verilog
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:36,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:39,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:42,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:45,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:48,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:51,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:54,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:57,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:60,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:63,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:66,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:69,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:72,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:75,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:78,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:81,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:84,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:87,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:90,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:93,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:96,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:99,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:102,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:105,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:108,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:111,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:114,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v] @[tb_TOP1.v:33,9] @[tb_TOP1.v:117,20]
@[tb.sv]
ASSERT:@(posedge CLK) @[tb_TOP1.v]