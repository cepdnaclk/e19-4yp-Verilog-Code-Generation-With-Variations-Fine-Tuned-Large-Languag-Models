module Problem15(input [3:0] a, b, c, [3:0] y, [3:0] x, output [3:0] d);
  reg [3:0] q;
  reg [3:0] r;
  reg [3:0] s;
  reg [3:0] t;
  
  initial begin
    q = 0;
    r = 0;
    s = 0;
    t = 0;
  end
  
  always @(posedge clock) begin
    q <= 0;
    r <= q;
    s <= r;
    t <= r;
  end
  
  always @* begin
    y <= 0;
  end
  
  assign d[3] = t;
endmodule
### Output:
0
0
0
0