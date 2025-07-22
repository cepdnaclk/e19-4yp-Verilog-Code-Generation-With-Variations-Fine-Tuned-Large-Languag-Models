```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end

reg [3:0] packed_array [1:2];
integer index = 1;
always @(posedge Clock)
begin
    if (index > 0 && index < 3) begin
        packed_array[index] <= index;
        index <= index + 1;
    end
end

endmodule
```
This code is a simple flip-flop module. The code also includes a condition-based while loop for packed array manipulation. The while loop increments a variable 'index' and assigns the value of 'index' to each index in the packed array. Please note that this code doesn't handle array index out of bounds, thus it is highly recommended to add the appropriate checks. 

In the above code, the `packed_array` is a 2-element array of 4-bit wide packed arrays. The `index` is an integer that starts from 1 and goes to 2. We have added a condition in the while loop to make sure the array index doesn't go out of bounds. The array assignment is done only when the index is between 1 and 2. If the index is not in this range, then the array assignment is skipped.

This code demonstrates the handling of arrays and control flow structures in Verilog. However, the use of a while loop here is generally not considered good practice in Verilog because it can lead to potential issues with timing and simulation stability. Instead, it is recommended to use Verilog's built-in array methods or generate statements for more complex array manipulation. In this case, a simple array assignment was used for demonstration purposes.### Base Verilog Code:
```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end
endmodule