module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
module show_ab (ao, b, a); // multiple input or gate
  parameter N = 4;
  output ao; input[N-1:0] a, b;
  wire [N-1:0] ao;
  for (genvar i = 0; i < N; i++) begin: I
    show_aa uu(ao[i], a[i] | b[i]);
  end
endmodule
module show_ac (ao, bi, ai); // 2 input or gate
  output ao; input bi, ai;
  and #(1) u1(ao,ai,bi);
endmodule
module test (output [7:0] o, input [3:0] i);
  wire [7:0] ao;
  show_ab u0(ao,i);
  show_ac u1(o,i[3],i[0]);
endmodule
### Test Code:
  import "DPI-C" function int tb_interactive();
  initial begin
    $display("Interactive mode enabled.");
    tb_interactive();
  end
  initial begin
    $timeformat(-9, 2, " ns", 20);
    $display("Expecting simulation to fall at time %f ns.", $time + 10.0);
    #10;
    if (o!= 0x00) begin
      $display("ERROR: o=%b, expected 0x00", o);
      $stop;
    end
  end
### Expected Result:

### Actual Result:
Interactive mode enabled.
Expecting simulation to fall at time 10.00 ns.
ERROR: o=11111000, expected 0x00
### Failure Log:
```
sby/sim/interactive/interactive_dpi_failure.log:
```
[2021-03-02 19:28:08 EST] Open