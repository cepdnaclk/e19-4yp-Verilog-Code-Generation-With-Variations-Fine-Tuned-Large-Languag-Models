module test;
`ifdef VERILATOR
  typedef struct packed {
    logic a;
    logic x, y, z;
  } T;
  T s;
  assign #25 s.a = 1;
  always begin
    s.x = #10 s.a;
  end
`endif
endmodule
### Expected Verilog Code:
module test;
wire a;
reg x, y, z;
assign #25 a = 1;
always begin
    x = #10 a;
end
endmodule
### Expected Verilog Code, Split Lines:
module test;
wire a;
reg x, y, z;
assign #25 a = 1;
always begin
    x = #10 a;
end
endmodule
### Expected Verilog Code:
module test;
`ifdef VERILATOR
  typedef struct packed {
    logic a;
    logic x, y, z;
  } T;
  T s;
  assign #25 s.a = 1;
  always begin
    s.x = #10 s.a;
  end
`endif
endmodule