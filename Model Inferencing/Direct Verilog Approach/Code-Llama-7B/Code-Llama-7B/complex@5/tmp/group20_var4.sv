module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule
```
#### Solution
```verilog
module mixed_sim();
  reg dcontrol, x, y;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @x
  y = ~x;
  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
    dcontrol = 0;
    end
endmodule
package test_pkg; parameter int SIZE = 2;
endpackage
module mixed_sim();
  reg dcontrol, x, y;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @x
  y = ~x;
  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
    dcontrol = 0;
    end
endmodule
```
```verilog
module mixed_sim();
  reg dcontrol, x, y;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @x
  y = ~x;
  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
    dcontrol = 0;
    end
endmodule
package test_pkg; parameter int SIZE = 2;
endpackage
module mixed_sim();
  reg dcontrol, x, y;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @x
  y = ~x;
  initial
  begin
    $monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
    dcontrol = 0;
    end
endmodule
```
```verilog
module mixed_sim();
  reg dcontrol, x, y;
  reg [31:0] data;
  wire [31:0] bus;
  assign bus = dcontrol? data : 'bz;
  always @x
  y = ~x;
  initial
  begin