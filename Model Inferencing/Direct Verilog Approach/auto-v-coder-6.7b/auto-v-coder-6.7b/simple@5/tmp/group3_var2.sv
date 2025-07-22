```verilog
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
```

Now, the output `cout` has the same type as the output signals sum, which enables you to use logic-vector expressions in SystemVerilog for the testbench.

Please note that Verilog doesn't have a real wire type, but it can't know if a logic-vector assignment is using actual wire or not, which is why it's not required in the code above. If you are using Verilog for synthesis, you can use the logic type for output wires to ensure compatibility. However, some tools may not support it.

Also, it's worth noting that the syntax may differ between Verilog and SystemVerilog, so the code examples provided here might need to be adjusted depending on what version of Verilog you are using. 

If you're using SystemVerilog and still encounter issues, please provide more detailed information about your specific setup and environment. 

Finally, remember to validate your code with a tool that supports SystemVerilog code, such as Icarus Verilog or Modelsim. The synthesis tool might not understand SystemVerilog syntax. Therefore, before using it, make sure to cross-verify your code with a suitable tool.