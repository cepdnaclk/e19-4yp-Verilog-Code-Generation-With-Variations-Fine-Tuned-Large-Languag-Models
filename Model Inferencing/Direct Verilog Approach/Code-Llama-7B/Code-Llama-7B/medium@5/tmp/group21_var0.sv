module tst_n_mux();
  reg [3:0] sel,data0,data1; wire out; // Mux inputs and output
  NMOSmux nmux(out,sel,data0,data1); // Instantiate NMOS mux
  initial
    begin
      data0 =4'b0001; data1 =4'b0011;  // Initialize with data1, sel low
      #5 data0 =4'b0010; data1 =4'b0101;  // now data0, sel high
      #10 data0 =4'b0100; data1 =4'b1001;  // now data1, sel low
      sel =4'b1111; // now sel high
      #5 data0 =4'b0110; data1 =4'b1010;  // now data0, sel high
      #10 data0 =4'b1100; data1 =4'b0111;  // now data1, sel low
    end
    initial $monitor($time, " out = %b ",out);
    initial #20 $stop; // Stop simulation
endmodule

### Base Verilog Code:
module tst_p_mux();
  reg sel,data0,data1; wire out; // Mux inputs and output
  PMOSmux pmux(out,sel,data0,data1); // Instantiate PMOS mux
  initial
    begin
      data0 =1'b0; data1