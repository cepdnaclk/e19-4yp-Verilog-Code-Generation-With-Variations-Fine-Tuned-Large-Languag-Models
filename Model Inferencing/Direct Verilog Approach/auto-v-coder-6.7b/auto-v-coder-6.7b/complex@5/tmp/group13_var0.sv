```verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
output reg [3: 0] Data_Out;
output reg MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
input s1, s0, clk, rst;

always @ (posedge clk) begin
    if (rst) begin // Initial reset
        Data_Out <= 0;
        MSB_Out <= 0;
        LSB_Out <= 0;
    end else begin // Regular operation
        if ({s1, s0} == 0) begin // Idle
            Data_Out <= Data_Out;
        end else if ({s1, s0} == 1) begin // Shift right
            Data_Out <= {MSB_In, Data_Out[3:1]};
        end else if ({s1, s0} == 2) begin // Shift left
            Data_Out <= {Data_Out[2:0], LSB_In};
        end else if ({s1, s0} == 3) begin // Parallel Load
            Data_Out <= Data_In;
        end
        MSB_Out <= Data_Out[3]; // Output MSB
        LSB_Out <= Data_Out[0]; // Output LSB
    end
end
endmodule
```
### Test Plan:
Ensure the reset operation works as intended.
Ensure the idle state works as intended.
Ensure shift right operation works as intended.
Ensure shift left operation works as intended.
Ensure parallel load operation works as intended.
Ensure the reset-on-the-fly operation works as intended.
### Verification Process:
Write a testbench module to stimulate the Universal Shift Register. Use the `$display` macro to print the expected and actual results of the outputs. This will help in verifying the correctness of the design. The correctness will be verified by verifying if the output matches the expected output. Once the testbench is written, run the test