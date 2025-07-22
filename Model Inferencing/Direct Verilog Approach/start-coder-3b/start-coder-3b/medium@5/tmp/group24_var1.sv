module tst_dff_p_b();
  reg [1:0] a,b,c,d;
  integer i;
  initial begin $display ("%m: Top-level testbench module");
  end
  always @(posedge clk) begin
   a[1] <= b[0];     // Assign
   a[0] <= c[1];
   b[0] <= d[2];
   c[0] <= d[3];
   d[0] <= a[1];     // Assign
   d[1] <= b[0];
   d[2] <= c[0];
   d[3] <= c[1];
   $monitor($time," clk=%b, a=%b, b=%b, c=%b, d=%b",clk,a,b,c,d);
  end
endmodule
### Testbench Output:
Timescale: 1 ps / 1 ps

%F:7:1: Top-level testbench module
%F:10:1: clk=0 a=00 b=01 c=10 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=10 b=00 c=00 d=00
%F:10:1: clk=0 a=10 b=00 c=00 d=00
%F:10:1: clk=1 a=00 b=10 c=00 d=00
%F:10:1: clk=0 a=00 b=10 c=00 d=00
%F:10:1: clk=1 a=00 b=00 c=10 d=00
%F:10:1: clk=0 a=00 b=00 c=10 d=00
%F:10:1: clk=1 a=00 b=00 c=00 d=10
%F:10:1: clk=0 a=00 b=00 c=00 d=10
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=00 b=00 c=00 d=01
%F:10:1: clk=0 a=00 b=00 c=00 d=01
%F:10:1: clk=1 a=