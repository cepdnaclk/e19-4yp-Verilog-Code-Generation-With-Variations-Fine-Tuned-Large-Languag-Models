```verilog
module tst_nor3NMOS();
  reg in1,in2,in3;
  wire b;
  nor3NMOS nn(in1,in2,in3,b);
  initial begin
    in1=1'b0;
    in2=1'b0;
    in3=1'b0;
  end
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial
    $monitor($time,
             "in1 = %b, in2 = %b, in3 = %b, output = %b ",
             in1,in2,in3,b);
  initial #24 $stop;
endmodule
module nor_gatemodule \gen_block1 (input x, y, z, output g);

  //
  // 3-input NOR gate
  //
  genvar i;
  generate
    for (i=0; i<3; i=i+1) begin
      nmos (x[i], y[i], z[i], g[i]); // NMOS NOR
    end
  endgenerate
endmodule
module nor3NMOS(in1,in2,in3,bout);
parameter delay = 10;
input in1,in2,in3;
output bout;
wire b_NMOS;
nor_gatemodule \gen_block1 (in1,in2,in3,b_NMOS);
assign #delay bout=b_NMOS;
endmodule
```
### Code Output:
```verilog
$ mvsim  -l mv.log tst_nor3NMOS
*** MV_sim ***
Simulation Start
Time:     0
in1 = b'0, in2 = b'0, in3 = b'0, output = b'1 
Time:   200
in1 = b'1, in2 = b'0, in3 = b'0, output = b'1 
Time:   300
in1 =