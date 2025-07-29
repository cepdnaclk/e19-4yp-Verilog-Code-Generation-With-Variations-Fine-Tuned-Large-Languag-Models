module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [3:0] signal;
  reg [3:0] diff;
  reg [3:0] x;
  reg [3:0] y;
  reg [3:0] z;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Problem8);
  end
  always @* begin
    if (a < b)
      signal = 4'b0001;
    else if (a > b)
      signal = 4'b0010;
    else
      signal = 4'b0100;
  end
  always @(*) begin
    x=a;
    y=b;
    z=x-y;
  end
  always @(signal) begin
    case (signal)
      4'b0001: diff = x - y;
      4'b0010: diff = y - x;
      4'b0100: diff = x - y;
      default: diff = 4'bxx;
    endcase
  end
endmodule
### Simulation
### Simulation with waveform
![](images/Problem8.png)
###