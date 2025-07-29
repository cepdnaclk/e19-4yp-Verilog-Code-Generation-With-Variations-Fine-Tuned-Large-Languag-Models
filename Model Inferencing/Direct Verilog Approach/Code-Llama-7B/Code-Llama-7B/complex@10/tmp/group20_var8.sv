```
module mixed_sim;
  reg dcontrol, x;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @(x)
    $display("x=%d y=%d", x, ~x);
  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
             $time, dcontrol, data, x, ~x, bus);
    dcontrol = 0;
  end
endmodule
```