```
module t_Clock_Prog ();

wire clock;

initial #100 $finish;
Clock_Prog M1 (clk,rst);
endmodule

module Clock_Prog (clk,rst);
input clk,rst;
reg [15:0] counter;
  initial
    counter = 0;
  always @(posedge clk or negedge rst)
  begin
    if(~rst)
      counter <= counter+1;
    else
      counter <= 0;
  end
endmodule
```

```
module t_Clock_Prog ();

wire clock;

initial #100 $finish;
Clock_Prog M1 (clk,rst);
endmodule

module Clock_Prog (clk,rst);
input clk,rst;
reg [15:0] counter;
  initial
    counter = 0;
  always @(posedge clk or negedge rst)
  begin
    if(~rst)
      counter <= counter+1;
    else
      counter <= 0;
  end
endmodule
```