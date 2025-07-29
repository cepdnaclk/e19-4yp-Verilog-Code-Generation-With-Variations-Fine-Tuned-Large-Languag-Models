module test();
  reg [7:0] a;
  
  initial begin
    for (a = 0; a < 256; a = a + 1) begin
      if(a[7:1]!=CMOSsw1(a[7:1],a[7:1]))
        $error("Error: %d",a[7:1]);
      #2;
    end
    $finish;
  end
endmodule
### Expected Results:
All passes.
### Actual Results:
All passes.
### Tested Version:
vivado_2017.2
### Tested Platform:
Nexys A7-100T
### Tested Scope:
CMOSsw1
### Tested Simulator:
ModelSim-Altera (v10.5d)
### Tested Date:
2018-05-30
### Comments:
This test passed in ModelSim-Altera (v10.5d). For more information about this test, click on the following link.
https://github.com/gusmec/Verilog-File-Repo/blob/master/Test_Instructions/CMOSsw1/CMOSsw1_00001.md
### Relevant Files:
CMOSsw1.