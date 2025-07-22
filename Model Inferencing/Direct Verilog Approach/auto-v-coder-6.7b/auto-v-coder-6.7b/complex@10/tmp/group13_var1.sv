```Verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else begin
    case ({s1, s0}) inside
        [2'b00]: Data_Out <= Data_Out; // Idle
        [2'b01]: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
        [2'b10]: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
        [2'b11]: Data_Out <= Data_In; // Parallel Load
    endcase
end
end
endmodule
```

Note:
In this updated code, the case statement uses a packed array of 2-bit binary numbers to represent the four cases: idle, shift right, shift left, and parallel load. This approach is more readable and concise. Also, it uses the `inside` keyword to simplify the case statement logic. It's a more readable and compact way to represent the same functionality.

Additionally, I've updated the code to use `inside` on `s1` and `s0` control signals. This ensures that the code is more concise and readable. This version of the code doesn't require any additional module instantiations or clock generation logic. The clock is assumed to be generated on the top level testbench.

Lastly, the test plan was modified to reflect the functionality of the shift register. This test plan now checks for the proper behavior of the shift register