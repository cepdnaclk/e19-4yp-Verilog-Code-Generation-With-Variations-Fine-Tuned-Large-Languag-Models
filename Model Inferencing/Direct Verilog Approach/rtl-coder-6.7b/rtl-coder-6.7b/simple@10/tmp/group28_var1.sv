module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Description:
Test the ability to support a wire-array type as the output of a register.  
#### Test Steps:
1) Load the above testcase.
2) Open a command line.
3) Type 'iverilog -otest -g2005-sv -s example3 test.v' in the command line.
4) Type 'vvp -mv test' in the command line.
5) Type 'gtkwave example3.vcd' in the command line.
6) Load the test.gtkw file.
7) Verify that the waveform plays.
#### Expected Results:
1) Test should compile without error.
2) Test should execute.
3) Test should produce a waveform.
4) Waveform should play.
### Pass/Fail Criteria:
P/F criteria
Program runs without error
Waveform plays
#### Known Problems:
Known problems
Test may time out on execution