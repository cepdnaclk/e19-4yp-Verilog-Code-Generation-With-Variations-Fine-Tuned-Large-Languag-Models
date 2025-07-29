module tst_case();

  reg in; wire out;
  NMOSinv nmv[1:4][5:3][2:1][3:2];
  NMOSinv nm0[3:5][9:7][4:2][2:1];
  NMOSinv nm1[5:7][3:1][10:12][1:3];
  NMOSinv nm2[14:15][8:7][1:3][1:2];
  NMOSinv nm3[3:5][7:1][6:4][1:2];
  NMOSinv nm4[2:4][12:11][1:3][1:2];
  
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
  
  function case_func;
    input [1:0] i;
    case(i)
      2'b00: return nmv[1][1][1][1];
      2'b01: return nmv[1][1][1][2];
      2'b10: return nmv[1][1][1][3];
      2'b11: return nmv[1][1][2][1];
    endcase
endfunction : case_func