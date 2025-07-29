module testbench ();
string data = "data";
initial begin
  $display("Rand is %b", data[0]);
end
endmodule
### Expected Output:

Rand is 1000
### Pass Criteria:

No errors on elaboration
### Fail Criteria:

Generate errors: _testbench.v:4: error: unknown generate item data_

## 5.8.6
### Test Scenario:
### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction