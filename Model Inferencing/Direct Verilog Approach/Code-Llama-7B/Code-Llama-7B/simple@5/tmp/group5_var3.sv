module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk);
  initial begin clk=0; di=1'b0; #35 $stop; end
  always #3 clk=~clk;
  always #5 di=~di;
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Expected Output:
$ ghdl -a tst_dff_pbeh.v
$ ghdl -r tst_dff_pbeh --stop-time=100ns
$ ghdl -Wl --list-procs
The list of processes, with the associated library and the definition line:
                        tst_dff_pbeh -  work.tst_dff_pbeh
                        dff_p -  work.dff_p
                        clk -  work.tst_dff_pbeh
                        di -  work.tst_dff_pbeh
                        do -  work.tst_dff_pbeh
$ ghdl -r tst_dff_pbeh --stop-time=100ns -vdm-do wave.ghw
$ gtkwave wave.ghw
### Observations:
A) No problem compiling with -a and -r.
B) No problem with the output in waveform viewer.
### Source Code:
module dff_pbeh(do,di,clk); // Note: Posedge triggered
  parameter n = 8;
  input clk;
  input di;
  output reg [n-1:0] do;
  always@(posedge clk) do <= di;
endmodule
### Base Verilog Code:
module tst_dff_pbeh();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop