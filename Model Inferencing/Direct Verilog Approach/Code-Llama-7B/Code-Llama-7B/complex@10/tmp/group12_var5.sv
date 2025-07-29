```verilog
`ifdef VERILATOR
`else
  reg [1:0] di;
  assign di = {1'b0,dif};
`endif
```