```verilog
module show_aa #(parameter type enum_t = logic [1:0];) (ao,ai); // NOT gate with delay 2
  output enum_t ao; input enum_t ai;
  not #2 (ao,ai);
endmodule

module testbench();
  parameter enum_t = logic [1:0];
  
  logic [1:0] ai, ao;
  enum_t ai_enum, ao_enum;
  logic [1:0] ai_enum_int, ao_enum_int;
  show_aa #(.enum_t(enum_t)) u_aa (.ao(ao_enum),.ai(ai_enum));

  initial begin
    ai_enum = 'b01; ai_enum_int = 'b01;
    #1;
    $display("Output = %b %b",ao_enum, ao_enum_int);
    assert(ao_enum === 'b10);
    assert(ao_enum_int === 'b10);
  end
endmodule
```
In the above code, we are changing the input and output of the module to packed enums. Please make sure that you have defined logic values for the enums. This is just an example. You might need to change the values according to your application. 

Also, note that this code is for simulation and might not work in synthesis unless you define the size and signedness of the enum type.

In the testbench, we are simply testing two scenarios: the default and non-default values. In this case, we are testing with `'b01` for inputs and the expected output should be `'b10`. We check both for logic and integer values to ensure compatibility. The `assert` statments will fail if the output does not match the expected value.

You need to add this module and testbench to your testbench and run it for verification. Be sure to check the testbench for any syntax errors and ensure that your tools can run Verilog. 

Also, this testbench will only show the result of one case, but you can modify it to test different inputs and verify the output.

Remember to replace `logic` keyword with appropriate logic