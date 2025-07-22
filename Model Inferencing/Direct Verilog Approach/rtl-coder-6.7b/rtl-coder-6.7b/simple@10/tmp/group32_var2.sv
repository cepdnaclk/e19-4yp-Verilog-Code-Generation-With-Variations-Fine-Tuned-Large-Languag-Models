module t_Clock_Prog ();
  wire clock;
  reg [31:0] value;
  localparam [31:0] value1 = 32'h5;
  localparam [31:0] value2 = 32'h4;
  localparam [31:0] value3 = 32'h3;
  localparam [31:0] value4 = 32'h2;
  localparam [31:0] value5 = 32'h1;
  localparam [31:0] value6 = 32'h0;
  enum {
    none,
    non_default_1,
    non_default_2,
    non_default_3,
    non_default_4,
    non_default_5
  } enum_type;
  initial #100 $finish;
  Clock_Prog #(.WIDTH(4)) M1 (clk, resetn, value, value.value1, value.value2, value.value3, value.value4, value.value5, value.value6, enum_type.none, enum_type.non_default_1, enum_type.non_default_2, enum_type.non_default_3, enum_type.non_default_4, enum_type.non_default_5);
endmodule
### Expected Coverage:
![Coverage](./coverage.png)