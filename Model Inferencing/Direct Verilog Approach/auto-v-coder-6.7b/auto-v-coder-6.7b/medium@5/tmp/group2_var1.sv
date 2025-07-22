```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg [3:0] packed_array [5:0] = '{4'b0001, 4'b0010, 4'b0100, 4'b1000, 4'b0001, 4'b0010};
reg Q1, Q2;
reg [1:0] index = 0;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    while (packed_array[index]!= 4'b1000) begin
        index += 2;
    end
end
endmodule
```
In this variation, you can see a while loop inside the `always` block that checks each element of the packed array array for a specific value until it hits a value of `4'b1000` (which corresponds to `1000` in binary). The index is incremented by 2 on each iteration of the loop. The index is used to access elements of the packed array.

This code is designed for educational purposes and might not work as expected in a real-world scenario or on a different synthesis tool due to the unpredictable behavior of the while loop. It's important to note that Verilog does not have a built-in functionality to wait for a certain value in a packed array, and the current implementation is simplified for educational purposes.

For a more realistic use case, you could use the `$display` or `$monitor` system tasks to print the value of `Q1` and `Q2` at each clock cycle. This would help you understand the state changes in the design.

Also, remember the `while` loop is not supported in synthesis. If you need to wait for a certain condition, Verilog recommends using `always_ff` or `always_comb` blocks with conditional statements for simulation or synthesis. If you use `while` loop in synthesis, you may encounter issues like the loop might never exit, or it may cause synthesis to hang.

Please ensure to adjust the index/packed array values according to your requirements. 

Last