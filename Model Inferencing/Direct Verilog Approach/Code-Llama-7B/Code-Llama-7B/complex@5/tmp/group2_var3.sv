``` VHDL
initial begin
    $dumpfile("multiplier.vcd");
    $dumpvars; // Dump all variables onto VCD file
  generate
    for (indx=0; indx<3; indx=indx+1) begin
      if (indx[3:0]==0) begin
        mem1[indx]=indx[3:0];
        mem2[indx]=indx[3:0];
      end
      else if (indx[3:0]<16) begin
        mem1[indx]=indx[3:0]-1;