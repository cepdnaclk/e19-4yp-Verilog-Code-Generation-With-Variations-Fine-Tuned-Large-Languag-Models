module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial in=1'b1; // Start with input high -> output low
  always @(in) case (in)
      1'b1: out=out_arr[5][4][3][2];
      1'b0: out=out_arr[5][4][3][1];
  endcase

  initial begin
      out_arr[0][0][0][0]=1'b0
      out_arr[0][0][0][1]=1'b1
      out_arr[0][0][0][2]=1'b1
      out_arr[0][0][0][3]=1'b1
      out_arr[0][1][0][0]=1'b0
      out_arr[0][1][0][1]=1'b1
      out_arr[0][1][0][2]=1'b1
      out_arr[0][1][0][3]=1'b1
      out_arr[0][2][0][0]=1'b0
      out_arr[0][2][0][1]=1'b1
      out_arr[0][2][0][2]=1'b0
      out_arr[0][2][0][3]=1'b1
      out_arr