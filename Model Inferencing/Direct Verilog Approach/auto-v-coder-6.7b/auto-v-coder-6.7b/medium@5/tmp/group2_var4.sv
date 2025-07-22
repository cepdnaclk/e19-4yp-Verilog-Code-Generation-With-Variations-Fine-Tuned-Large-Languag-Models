```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [7:0] packed_array = '{8'b11111111, 8'b00000000, 8'b10101010};
integer i = 0;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    while(i < 8) begin
        packed_array[i] <= Q2;
        i <= i + 1;
    end
end
endmodule
```
This variation code shows how you can add a while loop condition that uses an index inside a packed array. Inside this loop, we are assigning the value of Q2 to each element of the packed array. If we want to iterate through the elements of the packed array, we use the while loop and index which is incremented after each iteration. This code changes the behavior of the original module to save the output of Q1 into a packed array. It is a simple way to remember and save the state of Q1 over time. Note that this code is still single-threaded and cannot be synthesized to hardware with a current Verilog tool. It only acts as a behavioral simulation model. For hardware implementation, a D flip-flop based behavioral model is needed.