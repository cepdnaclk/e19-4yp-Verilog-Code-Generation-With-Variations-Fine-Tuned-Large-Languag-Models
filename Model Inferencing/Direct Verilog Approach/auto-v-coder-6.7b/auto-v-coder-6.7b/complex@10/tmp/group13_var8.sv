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

localparam  [1:0] IDLE = 2'b00;
localparam  [1:0] SR = 2'b01;
localparam  [1:0] SL = 2'b10;
localparam  [1:0] LOAD = 2'b11;

reg [1:0] sel;

always @(*) begin
  sel <= {s1, s0};
end

always @ (posedge clk) begin
 if (rst) Data_Out <= 0;
 else case (sel)
   IDLE: Data_Out <= Data_Out; // Idle
   SR: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
   SL: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
   LOAD: Data_Out <= Data_In; // Parallel Load
   default: Data_Out <= Data_Out; // Idle
 endcase
end
endmodule
```

```verilog
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out,