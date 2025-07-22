module show_aa(ShowAAInterface vif);
  // NOT gate with delay 2
  // Outputs
  output logic ao;
  // Inputs
  input logic [1:0] ai; //packed
  // Interfaces
  ShowAAInterface vif;
  // Modports
  modport in (input ai);
  modport out (output ao);
  // Assignments
  assign ao = vif.ai;
endinterface
### Testbench Code:
`timescale 1ns/1ns
module test_show_aa;
  ShowAAInterface vif();
  show_aa DUT(vif);
  initial begin
    vif.ai <= 2'b10;
    #10;
    vif.ai <= 2'b11;
    #10;
    vif.ai <= 2'b00;
    #10;
    $finish;
  end
endmodule
### Expected Output:
```
show_aa.sv:4: error: Expected 'endmodule' but found 'initial'
```
### Test:
```
$ vsim -t 1ns -voptargs="+acc" -c -do "run -all" test_show_aa
# vsim -t 1ns -voptargs="+acc" -c -do "run -all" test_show_aa
# Loading std.standard.show_aa(ShowAAInterface vif)
# Loading std.standard.vif(ShowAAInterface)
# Loading std.standard.test_show_aa(ShowAAInterface vif)
# Loading vsim_compile.sv(test_show_aa)
# Loading std.standard.test_show_aa(ShowAAInterface vif)
# Loading std.standard.vif(ShowAAInterface)
# Loading std.standard.show_aa(ShowAAInterface vif)
# Loading vsim_compile.sv(test_show_aa)
# Loading std.standard.vif(ShowAAInterface)
# Loading std.standard.show_aa(ShowAAInterface vif)
# Loading std.standard.vif(Show