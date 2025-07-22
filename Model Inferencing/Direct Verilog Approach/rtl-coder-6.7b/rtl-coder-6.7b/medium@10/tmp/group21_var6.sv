module NMOSinv(Nout,Nin);
  input Nin; // Input - NMOS transistor input
  output Nout; // Output - NMOS transistor output
  parameter [15:0]
  DFF [0:2] [0:15] [0:2] [0:2] = // 4D delay tables
  '{ // DFF[i,j,k][l]
     '{'{0,5,7},'{0,5,7},'{0,5,7}}, // i=0
     '{'{0,0,0},'{11,11,11},'{22,22,22}}, // i=1
     '{'{0,0,0},'{0,0,0},'{0,0,0}}}; // i=1

  reg [15:0] nout_reg;
  reg [1:0] in_reg;
  wire [1:0] in_comb0;
  wire [2:0] in_comb1;
  assign in_comb1[2] =!Nin;
  assign in_comb1[0:1] = in_reg;
  assign nout_reg = DFF[in_comb1[1:0]][in_comb1[2:1]][in_comb0[0]][in_comb0[1]];
  assign #nout_reg Nout = ~Nin;
  always begin
    #1 in_reg <= {in_reg[0],Nin};
    #11 in_comb0 <= in_comb0+1;
  end
endmodule
### Testbench - tst_nm_in.v
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #20 $stop; // Stop simulation
endmodule
### Testbench Trace:
# Time