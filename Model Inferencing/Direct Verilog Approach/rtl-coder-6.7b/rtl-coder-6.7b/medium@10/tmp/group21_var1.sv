module tst_nm_in();
  reg in[3:0][3:0]; wire out[3:0][3:0];
  genvar y,x;
  generate
    for (y=0; y<4; y=y+1) begin : y_gen
      for (x=0; x<4; x=x+1) begin : x_gen
      NMOSinv nmv(out[y][x],in[y][x]); // Instantiate NMOS inverter
      initial
        in[y][x]=1'b1; // Start with input high -> output low
      always
      initial $monitor($time, " in = %b, output = %b ",in[y][x],out[y][x]);
      end
    end
  endgenerate
  initial #15 $stop; // Stop simulation
endmodule
### Resulting Testbench Code:
module tst_nm_in();
reg in; wire out;
NMOSinv nmv(out,in); // Instantiate NMOS inverter
initial in=1'b1; // Start with input high -> output low
always initial $monitor($time, " in = %b, output = %b ",in,out);
initial #15 $stop; // Stop simulation
endmodule