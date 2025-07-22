module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;

// Modify for inside-dollar-unit case with packed array in scope
// Replace with:
reg [1: 0] s1_reg;
reg [1: 0] s0_reg;
assign s1_reg = s1[1: 0];
assign s0_reg = s0[1: 0];
assign s1[3: 0] = s1_reg; // This is the output
assign s0[3: 0] = s0_reg; // This is the output
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case ({s1_reg, s0_reg})
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end

endmodule

### Test Plan
Verify initial reset
Verify idle
Verify shift right
Verify shift left
Verify parallel load
Verify reset-on-the-fly

module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5; // 10-12-2004

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork join begin // Verify left shift join begin // Verify load join begin // reset join join endmodule ## Using inside-dollar-unit Modification with packed array in a module parameter This modification to the `test_Universal_Shift_Reg` module is identical to the code developed previously. Only the modified module is shown. ### Base Verilog Code: module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; // 10-12-2004 input s1, s0, clk, rst; reg [1: 0] s1_reg, s0_reg; module inside_dollar_unit (inside_dollar_unit_output, s1, s0); output [3: 0] inside_dollar_unit_output; input [1: 0] s1, s0; reg [1: 0] inside_dollar_unit_output; reg [3: 0] inside_dollar_unit_local; assign inside_dollar_unit_output = inside_dollar_unit_local; always @ (posedge s1, posedge s0) begin if (s1 == 0) inside_dollar_unit_local <= inside_dollar_unit_local; else inside_dollar_unit_local <= {s1_reg[1: 0], inside_dollar_unit_local[3: 1]}; if (s0 == 0) inside_dollar_unit_local <= inside_dollar_unit_local; else inside_dollar_unit_local <= {inside_dollar_unit_local[2: 0], s0_reg[1: 0]}; end endmodule assign s1_reg = s1[1: 0]; assign s0_reg = s0[1: 0]; assign s1[3: 0] = s1_reg; // This is the output assign s0[3: 0] = s0_reg; // This is the output always @ (posedge clk) begin if (rst) Data_Out <= 0; else case ({s1_reg, s0_reg}) 0: Data_Out <= Data_Out; // Idle 1: Data_Out <= {MSB_In, Data_Out[3: 1]}; // Shift right 2: Data_Out <= {Data_Out[2: 0], LSB_In}; // Shift Left 3: Data_Out <= Data_In; // Parallel Load endcase end end module ### Variation Instruction: Use `inside_dollar_unit_output` in the code for the `s1_reg` and `s0_reg` control signals. ### Modified Code: module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; // 10-12-2004 input s1, s0, clk, rst; reg [1: 0] s1_reg, s0_reg; module inside_dollar_unit (inside_dollar_unit_output, s1, s0); output [3: 0] inside_dollar_unit_output; input [1: 0] s1, s0; reg [1: 0] inside_dollar_unit_output; reg [3: 0] inside_dollar_unit_local; assign inside_dollar_unit_output = inside_dollar_unit_local; always @ (posedge s1, posedge s0) begin if (s1 == 0) inside_dollar_unit_local <= inside_dollar_unit_local; else inside_dollar_unit_local <= {s1_reg[1: 0], inside_dollar_unit_local[3: 1]}; if (s0 == 0) inside_dollar_unit_local <= inside_dollar_unit_local; else inside_dollar_unit_local <= {inside_dollar_unit_local[2: 0], s0_reg[1: 0]}; end endmodule assign s1_reg = s1[1: 0]; assign s0_reg = s0[1: 0]; assign s1[3: 0] = s1_reg; // This is the output assign s0[3: 0] = s0_reg; // This is the output always @ (posedge clk) begin if (rst) Data_Out <= 0; else case ({s1_reg, s0_reg}) 0: Data_Out <= Data_Out; // Idle 1: Data_Out <= {MSB_In, Data_Out[3: 1]}; // Shift right 2: Data_Out <= {Data_Out[2: 0], LSB_In}; // Shift Left 3: Data_Out <= Data_In; // Parallel Load endcase end end module ### Test Plan Verify initial reset Verify idle Verify shift right Verify shift left Verify parallel load Verify reset-on-the-fly module t_Universal_Shift_Reg(); wire [3: 0] Data_Out; reg [3: 0] Data_In; wire MSB_Out, LSB_Out; reg MSB_In, LSB_In; reg s1, s0, rst; defparam M2.half_cycle = 5; // 10-12-2004 Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); // This module is not visible inside