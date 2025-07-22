```Verilog
package definitions;
  typedef struct packed {
    logic [3:0] Excess_3_out;
    logic [7:0] BCD_in;
  } Results;

  Results test_pattern[];
  initial begin
    test_pattern = new[8]; //Array to hold all test patterns
  end
endpackage

import definitions::*;

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
assign Excess_3_out = BCD_in + 3;
endmodule

module t_encoder();
reg [7:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in[3:0], Excess_3_out);

initial begin
  for(int i=0; i<8; i++) begin
    BCD_in = $urandom_range(0, 15);
    #5;
    $display("Testing BCD = %b -> Excess-3 Code = %b", BCD_in[3:0], Excess_3_out);
    definitions::test_pattern[i].Excess_3_out = Excess_3_out;
    definitions::test_pattern[i].BCD_in = BCD_in;
  end

  $display("All test patterns:");
  for(int i=0; i<8; i++) begin
    $display("Test %d: BCD = %b -> Excess_3_out = %b", i, definitions::test_pattern[i].BCD_in, definitions::test_pattern[i].Excess_3_out);
  end
end
endmodule
```

In this example, we are importing a package that includes a struct called `Results` which has two elements: `Excess_3_out` and `BCD_in`. We then use this struct to store the outputs of the encoder and the inputs of the encoder. We initialize the array `test_pattern` inside the package, which will hold the 8 test patterns. We