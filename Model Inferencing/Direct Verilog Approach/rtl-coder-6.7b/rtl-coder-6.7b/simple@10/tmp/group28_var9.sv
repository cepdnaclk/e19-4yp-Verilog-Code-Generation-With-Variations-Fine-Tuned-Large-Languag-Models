module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output wire [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule

### Result
| Test # | Compatibility |
| ------------- | ------------- |
| A | pass  |
| B | fail  |
| C | fail  |
| D | fail  |
| E | fail  |
| F | fail  |
| G | fail  |
| H | fail  |
| I | fail  |
| J | fail  |
| K | fail  |
| L | fail  |
| M | fail  |
| N | fail  |
| O | fail  |
| P | fail  |
| Q | fail  |
| R | fail  |
| S | fail  |
| T | fail  |
| U | fail  |
| V | fail  |
| W | fail  |
| X | fail  |
| Y | fail  |
| Z | fail  |
### Explanation:
wire supports two-dimensional arrays but not unpacked dimensions.