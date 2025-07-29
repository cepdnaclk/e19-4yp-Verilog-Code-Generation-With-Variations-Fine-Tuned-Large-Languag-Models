module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
module testbench;
  parameter STRENGTH_0 = 2'b00;
  parameter STRENGTH_1 = 2'b01;
  parameter STRENGTH_Z = 2'b10;
  parameter STRENGTH_X = 2'b11;
  logic a_, c_, zn_, zp_;
  mos_strength SUT (a_, c_, zn_, zp_);
  initial begin
    a_ = 0;
    c_ = 1;
    # 5
    a_ = 1;
    c_ = 1;
    # 5
    a_ = 0;
    c_ = 0;
    # 5
    a_ = 1;
    c_ = 0;
    # 5
    a_ = 0;
    c_ = 0;
    # 5
  end
endmodule
### Modified Testbench Output:
			  z         z        z        z
a      c      zn   zp      zn   zp      zn   zp
-------- ------ ------ ------ ------ ------ ------
0       1      1      X      1      0      1      X
1       1      0      0      1      X      0      0
0       0      X       0      X      X      0      X
1       0      1      1      0      0      1      1
0       0      0      0      0      X      0      X
1       0      0      1      1       1      0      1
0       0      1      0      1      0      1      0
1       0      1      X      1      X      1      X
0       0      X      1      X      X      X      X
1