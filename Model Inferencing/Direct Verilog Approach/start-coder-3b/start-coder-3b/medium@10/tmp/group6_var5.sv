```
module clock_gen_genvar; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  genvar i;
  always @(posedge en) // Start clock generation on posedge en
    i=2;
    while (i>0)
      clk = ~clk; // Toggle clock every 2 time units forever
      i=i-1;
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  always @(posedge en) // Start clock generation on posedge en
    $display("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```
### Output:
```
clk=0, t=0, en=0
clk=1, t=2, en=1
clk=0, t=4, en=1
clk=1, t=6, en=1
clk=0, t=8, en=1
clk=1, t=10, en=1
clk=0, t=12, en=1
clk=1, t=14, en=1
clk=0, t=16, en=1
clk=1, t=18, en=1
clk=0, t=20, en=1
clk=1, t=22, en=1
clk=0, t=24, en=1
clk=1, t=26, en=1
clk=0, t=28, en=1
clk=1, t=30, en=1
clk=0, t=32, en=1
clk=1, t=34, en=1
clk=0, t=36, en=1
clk=1, t=38, en=1
clk=0, t=40, en=1
clk=1, t=42, en=1
clk=0, t=44, en=1
clk=1, t=46, en=1
clk=0, t=48, en=1
clk=1, t=50, en=1
```


## Design 5
### Base Verilog Code:
```
module design5;

  reg [7:0] num_a = 8'd15;
  reg [7:0] num_b = 8'd15;
  wire [7:0] result;


  initial
  begin
    $monitor("num_a=%3h, num_b=%3h, result=%3h