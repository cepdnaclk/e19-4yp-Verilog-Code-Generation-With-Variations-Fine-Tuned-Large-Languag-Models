module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Expected Output:
###   - Line 18: syntax error
###   - Line 20: syntax error
###   - Line 24: syntax error
###   - Line 26: syntax error
###   - Line 27: syntax error
###   - Line 28: syntax error
###   - Line 29: syntax error
###   - Line 30: syntax error
###   - Line 31: syntax error
###   - Line 33: syntax error
###   - Line 34: syntax error
###   - Line 35: syntax error
###   - Line 36: syntax error
###   - Line 37: syntax error
###   - Line 38: syntax error
###   - Line 39: syntax error
###   - Line 40: syntax error
###   - Line 41: syntax error
###   - Line 42: syntax error
###   - Line 43: syntax error
###   - Line 44: syntax error
###   - Line 45: syntax error
###   - Line 46: syntax error
###   - Line 47: syntax error
###   - Line 48: syntax error
###   - Line 49: syntax error
###   - Line 50: syntax error
###   - Line 51: syntax error
###   - Line 52: syntax error
###   - Line 53: syntax error
###   - Line 54: syntax error
###   - Line 55: syntax error
###   - Line 56: syntax error
###   - Line 57: syntax error
###   - Line 58: