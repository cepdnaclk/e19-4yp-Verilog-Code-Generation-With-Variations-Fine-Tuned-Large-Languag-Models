```
module test_enum_logic_default(input logic ao, ai,
                           input logic signed [7:0] bi);
  logic a, b;
  logic a_enum, b_enum;
  logic signed [7:0] b_enum_signed;
  show_aa a0(a, ai);
  show_aa b0(b, bi);
  show_aa a1(a_enum, a_enum);
  show_aa b1(b_enum, b_enum);
  show_aa b2(b_enum_signed, b_enum_signed);
  initial begin
  //$monitor("time=%0d, a=%b, a=%h, a=%h, a_enum=%b, a_enum=%h, a_enum=%h, b=%b, b=%b, b=%b, b_enum_signed=%d, b_enum_signed=%h, b_enum_signed=%h", $time, a, a, a_enum, a_enum, a_enum, b, b, b_enum_signed, b_enum_signed, b_enum_signed);
    #10 $display("a=%b, a=%h, a=%h, a_enum=%b, a_enum=%h, a_enum=%h, b=%b, b=%h, b=%b, b_enum_signed=%d, b_enum_signed=%h, b_enum_signed=%h", a, a, a_enum, a_enum, a_enum, b, b, b, b_enum_signed, b_enum_signed, b_enum_signed);
    $finish;
  end
endmodule
```
### Run Command:
```
iverilog test_enum_logic_default.v show_aa.v && iverilog -o test_enum_logic_default test_enum_logic_default.v show_aa.v && vvp test_enum_logic_default
```
### Output:
```
aa.v:14:1: