module tst_dff_pbeh();
  logic di,clk; logic do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
/code/verilog/basic_wave_gen/README.md
# Basic Wave Generator
This code is a basic wave generator which is based on the Verilog 'generate' statement. The basic wave generator can generate a waveform of bits, of any length, but with a fixed frequency. This means that every 1/frequency cycles the signal changes state. This is useful for basic tests where you want to know when an operation completes or if your design has an error. The code uses a 'for' loop to create the wave.
## How to Run
After downloading the code, navigate to this folder in a terminal and run:

`gtkwave gen_wave.vcd gen_wave.gtkw`

This will open the resulting.vcd file in gtkwave.