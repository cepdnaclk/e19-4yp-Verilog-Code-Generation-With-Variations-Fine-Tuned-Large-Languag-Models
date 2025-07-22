```verilog
`unpacked_array(control, [s1, s0])
```
If `control` is the unpacked array of `s1` and `s0` and the size is 2, then `$size(control)` returns 2.

Then add a case statement to check the unpacked array against different values. Also, make sure that `$size(control)` is equal to the size of your unpacked array.

```verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; 
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case (`unpacked_array(control, [s1, s0])) //using the unpacked array
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```
This code can be used to verify the behavior of the shift register with varying `s1`, `s0` inputs. Note that you need to define the `unpacked_array` function in your testbench to unpack the control signals. This function is up to the user to define based on their specific needs and constraints.

This approach allows you to easily verify the behavior of the circuit under different control signals, making it more flexible and scalable. However, the specific implementation of the `unpacked_array` function would also depend on the