module D_Latch (q, di, clk, reset);
// D-latch with active-high reset
output reg q;
input di, clk, reset;
dff dff1 (.q (q),.di (di),.clk (clk) );
//D-Latch:
```

module D_Latch (q, di, clk, reset);
// D-latch with active-high reset
output reg q;
input di, clk, reset;
dff dff1 (.q (q),.di (di),.clk (clk) );
wire [2:0] d_const = $bits({1'b1,1'b0,1'b1});
dff dff2 (.q (q),.di (di),.clk (clk) );
always @ (posedge di) if (di inside {d_const}) q <= ~q;
endmodule

```
### Variation Description:
Since `di` is a `reg`, `inside` operator is used to check against the fixed array slice of the `d_const` dollar unit constant.

### Verilog Code for simulation:
```
module D_Latch (q, di, clk, reset);

output reg q;
input di, clk, reset;
dff dff1 (.q (q),.di (di),.clk (clk) );

wire [2:0] d_const = $bits({1'b1,1'b0,1'b1});

always @ (posedge clk)
begin
  if (di inside {d_const}) q <= ~q;
end

endmodule
```