module tst_andsw2();
  reg [1:0] in1,in2;
  wire con;
  wire [1:0] out;
  Andsw2 andsw(out,in1,in2,con);
  initial #100 $stop;
  initial $monitor( $time, "input 1 = %b, input