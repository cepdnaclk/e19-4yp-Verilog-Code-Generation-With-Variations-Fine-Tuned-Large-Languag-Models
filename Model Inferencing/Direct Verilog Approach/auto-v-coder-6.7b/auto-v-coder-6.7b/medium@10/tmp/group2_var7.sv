```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

integer i;
bit [7:0] my_packed_array;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    i <= 0;
    my_packed_array[0] <= Q1;
    while(i < 7) begin : while_loop
        i <= i + 1;
        my_packed_array[i] <= my_packed_array[i-1];
    end
end
endmodule
```
This code will create a packed array of 8-bit width, and it will shift out the old Q1 value and store the new Q1 value into the array. The array is shifted out by continuously increasing the index until it reaches the maximum size of the array, 8.

Please note that Verilog does not support the packed array of bit in the size more than 1 bit. Hence, the array size can be only 1 bit as we are using bit [7:0] array. If you are going to use the 1 bit array for other purposes, you may want to increase the array size or use the bit [0:0] array for the single bit usage.

Also, the while loop condition is a bit tricky as we are not breaking out of it when condition is not met anymore. In case it is not required for your use-case, you can replace it with simple if statement as shown below:

```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

integer i;
bit [7:0] my_packed_array;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    i <= 0;
    my_packed_array[0] <= Q1;
    if(i < 7) begin : while_loop
        i <= i + 1;
        my_packed_array[i] <= my_