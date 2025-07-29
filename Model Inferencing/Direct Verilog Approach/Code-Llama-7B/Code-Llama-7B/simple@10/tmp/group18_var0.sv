module show_aa(o,i); // NOT gate with delay 2
  output [7:0] o; input [7:0] i; wire [7:0] o, i;
  not #2 (o[5],i[5]); not #2 (o[4],i[4]); not #2 (o[3],i[3]); not #2 (o[2],i[2]); not #2 (o[1],i[1]); not #2 (o[0],i[0]);
endmodule
### Test Cases:
#### Test with default value:
  Input:
  ```
  parameter A = 1, B = 2;
  show_aa a1 (.o(o[0]),.i(i));
  show_aa a2 (.o(o[1]),.i(i));
  show_aa a3 (.o(o[2]),.i(i));
  show_aa a4 (.o(o[3]),.i(i));
  show_aa a5 (.o(o[4]),.i(i));
  show_aa a6 (.o(o[5]),.i(i));
  show_aa a7 (.o(o[6]),.i(i));
  ```
  Output:
  ```
  0x00
  ```
#### Test with all non-default values:
  Input:
  ```
  parameter A = 0, B = 0;
  show_aa a1 (.o(o[0]),.i(i));
  show_aa a2 (.o(o[1]),.i(i));
  show_aa a3 (.o(o[2]),.i(i));
  show_aa a4 (.o(o[3]),.i(i));
  show_aa a5 (.o(o[4]),.i(i));
  show_aa a6 (.o(o[5]),.i(i));
  show_aa a7 (.o(o[6]),.i(i));
  ```
  Output:
  ```
  0x7f
  ```
#### Test with default value, non-default value, default value, and non-default value: