module TOP1 (
  input logic CLK, RST_X,
  output logic LEDG
);
  logic x;
  always_ff @(posedge CLK) begin
    x <= 1'bx;
    LEDG <= (x inside {2, 3, 4, 5});
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TOP1);
  end
endmodule

package TEST;
  parameter WIDTH = 8;
  parameter DATA  = 8'h01;
endpackage

module TOP1 (
  input logic CLK, RST_X,
  output logic LEDG
);
  logic x;
  always_ff @(posedge CLK) begin
    x <= 1'bx;
  end
  assign LEDG = 0;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TOP1);
  end
endmodule

### Simulation:
$ ghdl -r tb_TOP1 --vcd=dump.vcd --ieee-asserts=disable
### Expected Console Output:
   Started:  20:37:37  0:00:00  0:00:00
   Finished: 20:37:38  0:00:00  0:00:00

  TB_TOP1..Done
  TB_TOP1..OK

  Run Finished: Testbenches (0) | Elapsed time: 00:00:00
### Expected Waveform Output:
![Expected Waveform Output](./in1.png)

### Result: