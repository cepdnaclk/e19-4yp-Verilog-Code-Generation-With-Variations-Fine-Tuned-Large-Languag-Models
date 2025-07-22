```verilog
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
  integer i;
  for (i=0; i<$size({s1,s0}); i=i+1) begin
    case ({s1,s0}[i])
      0: Data_Out <= Data_Out; // Idle
      1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
      2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
      3: Data_Out <= Data_In; // Parallel Load
      4: Data_Out <= rand_logic; // Random Load
      default: $display("Undefined control");
    endcase
  end
end
end
endmodule
```
This modified code ensures that every control signal (`s1`, `s0`) is tested individually. The size of the packed array is used to determine how many control signals we're dealing with.

Please note that I've added an `rand_logic` variable, which is used to handle any unforeseen control cases. In a real-world scenario, it should be replaced by a proper randomization process.

Note: This code is a variation of instructions. It should be used based on the available resources and constraints of the specific project. It's a simplified and incomplete representation of a full test bench, intended to show the concept rather than a practical implementation. It's important to understand