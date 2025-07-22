```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count = 0;
    end
    else begin
        Count <= {{Count[2:0]}, Count[3]}; // Circle the count left by one
    end
end
endmodule
```
In this modified code, the statement `{{Count[2:0]}, Count[3]}` constructs a new packed vector with the same bits as `Count`, except shifted to the left by one. This will create a binary counter that cycles from binary 0000 to binary 0001 to binary 0010, and so on. When the maximum count (binary 0011) is reached, it wraps around back to binary 0000. This is a common technique used to generate cyclical binary counts.

Please note that this code assumes that Count is a 4-bit binary number, and does not handle cases where the input value exceeds the bit width. This is a limitation of this code and the Verilog HDL language itself. For a more complex or scalable solution, the system would need to be designed with more complex data types, or a wider bit width. Also, this code does not cover edge case when Count is reset to 0. The count will still be 1 after reset, because the count is reset asynchronously. You can modify it to reset count to 0 immediately after reset by changing `Count = 0;` to `Count <= 4'b0000;`.