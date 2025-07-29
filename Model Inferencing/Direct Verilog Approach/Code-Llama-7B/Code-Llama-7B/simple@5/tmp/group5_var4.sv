module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Expected Results:
Diagnosis:
Error: **Error**: Instance "d1"
of module "dff_p" was not elaborated, because of
**error:** in line 8: Unresolved interface port type: "logic" is not a valid type name.
### Actual Results:

![11032021_23456_error_instance_not_elaborated.png](https://raw.githubusercontent.com/EckoTan0804/upic-repo/master/uPic/11032021_23456_error_instance_not_elaborated.png)


### Reference:
1. https://www.doulos.com/knowhow/verilog_design/comparing_hierarchies/
2. [Verilog HDL: Using and Creating Modules](https://verilog.simplified.io/tutorials/